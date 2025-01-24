import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<dynamic> stringtolat(
  String jsonString,
  List<String> camposCoordenadas,
) {
  List<dynamic> jsonList = jsonDecode(jsonString);

// Itera sobre cada objeto na lista e atualiza os campos de coordenadas

  for (var jsonMap in jsonList) {
// Verifica se o objeto atual é um Map

    if (jsonMap is Map<String, dynamic>) {
      for (var campo in camposCoordenadas) {
        if (jsonMap.containsKey(campo) && jsonMap[campo] is String) {
          String coordenadaString = jsonMap[campo];

// Extrair latitude e longitude usando expressões regulares
          final match = RegExp(r'LatLng\(lat: (.*), lng: (.*)\)')
              .firstMatch(coordenadaString);

          if (match != null) {
            double lat = double.parse(match.group(1)!);

            double lng = double.parse(match.group(2)!);

// Atualizar o campo com uma nova instância de LatLng jsonMap[campo] = LatLng(lat, Ing); // Converte para o formato 'LatLng(lat, Ing)'

            jsonMap[campo] = LatLng(lat, lng);
          }
        }
      }
    }
  }

// Retorna a lista de Maps modificacia
  return List<Map<String, dynamic>>.from(jsonList);
}

int verificaDiaSemana(DateTime dataReferencia) {
  int dia = dataReferencia.weekday % 7;
  return dia;
}

DateTime? atualizarHorario(
  DateTime data,
  String horarioString,
) {
// Verifica se a string de horário é "0" ou vazia
  if (horarioString == "0" || horarioString.isEmpty) {
    return null; // Retorna null se a string for "0"
  }

  // Divide a string de horário nos componentes de hora e minuto
  List<String> partes = horarioString.split(':');

  // Tenta parsear os componentes de hora e minuto
  int hora = int.parse(partes[0]);
  int minuto = int.parse(partes[1]);

  // Retorna uma nova data com o horário atualizado
  return DateTime(
    data.year,
    data.month,
    data.day,
    hora,
    minuto,
    0, // Define os segundos como 0
  );
}

DateTime horaUTC(DateTime data) {
  return data.toUtc();
}

List<DateTime>? gerarHorarios(
  List<String> idsProfissionais,
  DateTime dataReferencia,
  List<AgendamentosRow> listaSupabase,
  DateTime horarioInicial,
  DateTime horarioFinal,
  List<HorariosRow>? listaHorarioProf,
  int tempoMinutos,
  String nomeSalao,
) {
  List<DateTime> horariosDisponiveis = [];

  DateTime inicio = DateTime(
    dataReferencia.year,
    dataReferencia.month,
    dataReferencia.day,
    horarioInicial.hour,
    horarioInicial.minute,
  );
  DateTime fim = DateTime(
    dataReferencia.year,
    dataReferencia.month,
    dataReferencia.day,
    horarioFinal.hour,
    horarioFinal.minute,
  );

  // Gera horários e verifica disponibilidade em cada horário
  while (inicio.isBefore(fim) || inicio.isAtSameMomentAs(fim)) {
    int profissionaisDisponiveis = 0;
    DateTime horarioFimAtual = inicio.add(Duration(minutes: tempoMinutos));

    // Verifica a disponibilidade dos profissionais para o horário atual
    for (var idProf in idsProfissionais) {
      bool estaDisponivel = true;

      // Verifica o status do profissional no dia da semana
      bool profissionalDisponivel = false;

      for (var registro in listaHorarioProf ?? []) {
        if (registro.idHorario == idProf) {
          int diaSemana = (inicio.weekday % 7); // 0 para domingo, 6 para sábado

          // Verifica se o profissional está fechado
          if (registro.status[diaSemana] == "Fechado") {
            estaDisponivel = false;
            break;
          }

          if (registro.localTrabalho[diaSemana] != nomeSalao) {
            estaDisponivel = false;
            break;
          }

          if (registro.status[diaSemana] == "Aberto") {
            profissionalDisponivel = true;

            // Obtém os intervalos de indisponibilidade
            String intervaloInicioStr = registro.intervaloInicio[diaSemana];
            String intervaloFinalStr = registro.intervaloFinal[diaSemana];

            if (intervaloInicioStr != "0" &&
                intervaloInicioStr.isNotEmpty &&
                intervaloFinalStr != "0" &&
                intervaloFinalStr.isNotEmpty) {
              var partesInicio = intervaloInicioStr.split(':');
              DateTime intervaloInicio = DateTime(
                dataReferencia.year,
                dataReferencia.month,
                dataReferencia.day,
                int.parse(partesInicio[0]),
                int.parse(partesInicio[1]),
              );

              var partesFim = intervaloFinalStr.split(':');
              DateTime intervaloFinal = DateTime(
                dataReferencia.year,
                dataReferencia.month,
                dataReferencia.day,
                int.parse(partesFim[0]),
                int.parse(partesFim[1]),
              );

              // Verifica se o horário atual conflita com o intervalo
              if ((horarioFimAtual.isAfter(intervaloInicio) &&
                      inicio.isBefore(intervaloFinal)) ||
                  horarioFimAtual.isAtSameMomentAs(intervaloInicio)) {
                estaDisponivel = false;
                break;
              }
            }
          }
          break;
        }
      }

      if (!profissionalDisponivel) {
        estaDisponivel = false;
      }

      // Verifica conflitos de horário nos agendamentos
      for (var registro in listaSupabase) {
        if (registro.idProf == idProf) {
          DateTime? dataAgendadaInicio = registro.dataAgendada;
          DateTime? dataAgendadaFim = registro.dataFim;

          if (dataAgendadaInicio != null && dataAgendadaFim != null) {
            if ((inicio.isBefore(dataAgendadaFim) &&
                    horarioFimAtual.isAfter(dataAgendadaInicio)) ||
                inicio.isAtSameMomentAs(dataAgendadaFim)) {
              estaDisponivel = false;
              break;
            }
          }
        }
      }

      if (estaDisponivel) {
        profissionaisDisponiveis++;
      }
    }

    // Adiciona o horário à lista apenas se há pelo menos 1 profissional disponível
    if (profissionaisDisponiveis > 0) {
      horariosDisponiveis.add(inicio);
    }

    // Avança para o próximo horário
    inicio = inicio.add(Duration(minutes: 15));
  }

  return horariosDisponiveis;
}

double calculateDistance(
  LatLng point1,
  LatLng point2,
) {
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  var earthRadius = 6371.0; // Raio da Terra em quilômetros
  var dLat = degreesToRadians(point2.latitude - point1.latitude);
  var dLng = degreesToRadians(point2.longitude - point1.longitude);

  var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(degreesToRadians(point1.latitude)) *
          math.cos(degreesToRadians(point2.latitude)) *
          math.sin(dLng / 2) *
          math.sin(dLng / 2);

  var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return earthRadius * c;
}

String calcularDistancia(
  LatLng localSalao,
  LatLng localCliente,
) {
  // Pegar latitude e longitude do salão
  double latitudeSalao = localSalao.latitude;
  double longitudeSalao = localSalao.longitude;

  // Pegar latitude e longitude do cliente
  double latitudeCliente = localCliente.latitude;
  double longitudeCliente = localCliente.longitude;

  // Converter graus para radianos
  double toRadians(double degree) {
    return degree * math.pi / 180; // Usar math.pi
  }

  // Raio da Terra em km
  const double raioTerraKm = 6371.0;

  // Diferença de latitude e longitude em radianos
  double deltaLatitude = toRadians(latitudeCliente - latitudeSalao);
  double deltaLongitude = toRadians(longitudeCliente - longitudeSalao);

  // Converter as latitudes para radianos
  double lat1 = toRadians(latitudeSalao);
  double lat2 = toRadians(latitudeCliente);

  // Fórmula de Haversine
  double a = math.pow(math.sin(deltaLatitude / 2), 2) +
      math.pow(math.sin(deltaLongitude / 2), 2) *
          math.cos(lat1) *
          math.cos(lat2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Distância em quilômetros
  double distanciaKm = raioTerraKm * c;

  // Retornar a distância em metros ou quilômetros
  if (distanciaKm >= 1) {
    return "${distanciaKm.toStringAsFixed(2)} km";
  } else {
    // Converter para metros
    double distanciaMetros = distanciaKm * 1000;
    return "${distanciaMetros.toStringAsFixed(0)} metros";
  }
}

LatLng stringToLatLng(String locationString) {
  final latStart = locationString.indexOf('lat: ') + 5;
  final latEnd = locationString.indexOf(',', latStart);
  final lngStart = locationString.indexOf('lng: ') + 5;
  final lngEnd = locationString.indexOf(')', lngStart);

  final latitude = double.parse(locationString.substring(latStart, latEnd));
  final longitude = double.parse(locationString.substring(lngStart, lngEnd));

  return LatLng(latitude, longitude);
}

double calculateDistanceFromStrings(
  String coord1,
  String coord2,
) {
  // Função para converter a string "lat,lng" em um par de double
  List<double> parseCoordinates(String coord) {
    var parts = coord.split(',');
    return [double.parse(parts[0]), double.parse(parts[1])];
  }

  // Converter as coordenadas de string para double
  var point1 = parseCoordinates(coord1);
  var point2 = parseCoordinates(coord2);

  // Função para converter graus para radianos
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  var earthRadius = 6371.0; // Raio da Terra em quilômetros
  var dLat = degreesToRadians(point2[0] - point1[0]);
  var dLng = degreesToRadians(point2[1] - point1[1]);

  var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(degreesToRadians(point1[0])) *
          math.cos(degreesToRadians(point2[0])) *
          math.sin(dLng / 2) *
          math.sin(dLng / 2);

  var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return earthRadius * c;
}

DateTime horarioFinalAgendamento(
  DateTime data,
  int minutos,
) {
  return data.add(Duration(minutes: minutos));
}

bool verificarConflitoDataProf(
  String id,
  DateTime dataInicio,
  DateTime dataFinal,
  List<AgendamentosRow> listaSupabase,
  DateTime? intervaloInicio,
  DateTime? intervaloFinal,
) {
  // Verifica se os intervalos foram fornecidos
  if (intervaloInicio != null && intervaloFinal != null) {
    // Verifica primeiro se há conflito no intervalo fornecido
    bool conflitoIntervalo = intervaloInicio.isBefore(dataFinal) &&
        intervaloFinal.isAfter(dataInicio);

    // Se há conflito no intervalo e não há necessidade de verificar os agendamentos
    if (conflitoIntervalo) {
      return true; // Conflito de intervalo encontrado
    }
  }

  // Verifica conflito com os agendamentos existentes
  for (var registro in listaSupabase) {
    String? idProf = registro.idProf;
    DateTime? dataExistenteInicio = registro.dataAgendada;
    DateTime? dataExistenteFinal = registro.dataFim;

    if (idProf == id &&
        dataExistenteInicio != null &&
        dataExistenteFinal != null) {
      bool conflitoDatasPrincipais = dataInicio.isBefore(dataExistenteFinal) &&
          dataFinal.isAfter(dataExistenteInicio);

      if (conflitoDatasPrincipais) {
        return true; // Conflito encontrado nos agendamentos
      }
    }
  }

  return false; // Nenhum conflito encontrado
}

List<DateTime> gerarHorariosProf(
  List<String> idsProfissionais,
  DateTime dataReferencia,
  List<AgendamentosRow> listaSupabase,
  DateTime horarioInicial,
  DateTime horarioFinal,
  DateTime intervaloInicio,
  DateTime intervaloFinal,
  int tempoEmMinutos,
) {
  List<DateTime> horariosDisponiveis = [];

  DateTime inicio = DateTime(
    dataReferencia.year,
    dataReferencia.month,
    dataReferencia.day,
    horarioInicial.hour,
    horarioInicial.minute,
  );
  DateTime fim = DateTime(
    dataReferencia.year,
    dataReferencia.month,
    dataReferencia.day,
    horarioFinal.hour,
    horarioFinal.minute,
  );

  // Gera horários e verifica disponibilidade em cada horário
  while (inicio.isBefore(fim) || inicio.isAtSameMomentAs(fim)) {
    int profissionaisDisponiveis = 0;
    DateTime horarioFimAtual = inicio.add(Duration(minutes: tempoEmMinutos));

    // Verifica a disponibilidade dos profissionais para o horário atual
    for (var idProf in idsProfissionais) {
      bool estaDisponivel = true;

      for (var registro in listaSupabase) {
        if (registro.idProf == idProf) {
          DateTime? dataAgendadaInicio = registro.dataAgendada;
          DateTime? dataAgendadaFim = registro.dataFim;

          if (dataAgendadaInicio != null && dataAgendadaFim != null) {
            // Calcula o limite máximo de horário permitido (dataAgendadaInicio - tempoEmMinutos)
            DateTime limiteDisponivel =
                dataAgendadaInicio.subtract(Duration(minutes: tempoEmMinutos));

            // Verifica conflitos com agendamentos
            if ((inicio.isBefore(dataAgendadaFim) &&
                    horarioFimAtual.isAfter(dataAgendadaInicio)) ||
                inicio.isAfter(limiteDisponivel)) {
              estaDisponivel = false;
              break;
            }
          }
        }
      }

      if (estaDisponivel) {
        profissionaisDisponiveis++;
      }
    }

    // Adiciona o horário à lista apenas se a quantidade mínima de profissionais estiver disponível
    if (profissionaisDisponiveis > 0) {
      // Verifica se o horário e o horário + tempo estão fora do intervalo de indisponibilidade
      bool foraIntervalo = (inicio.isBefore(intervaloInicio) &&
              horarioFimAtual.isBefore(intervaloInicio)) ||
          (inicio.isAfter(intervaloFinal) ||
              inicio.isAtSameMomentAs(intervaloFinal));

      // Inclui horários exatamente no final do intervalo
      bool noFimDoIntervalo = inicio.isAtSameMomentAs(intervaloFinal);

      if (foraIntervalo || noFimDoIntervalo) {
        horariosDisponiveis.add(inicio);
      }
    }

    // Avança para o próximo horário
    inicio = inicio.add(Duration(minutes: 15));
  }

  return horariosDisponiveis;
}

bool verificarConflitoDataCliente(
  String id,
  DateTime dataInicio,
  DateTime dataFinal,
  List<AgendamentosRow> listaSupabase,
) {
  for (var registro in listaSupabase) {
    String? idCliente = registro.idCliente;

    // Verifica se as datas são nulas e trata o caso
    DateTime? dataExistenteInicio = registro.dataAgendada;
    DateTime? dataExistenteFinal = registro.dataFim;

    if (idCliente == id &&
        dataExistenteInicio != null &&
        dataExistenteFinal != null) {
      bool conflito = dataInicio.isBefore(dataExistenteFinal) &&
          dataFinal.isAfter(dataExistenteInicio);
      if (conflito) {
        return true; // Conflito encontrado
      }
    }
  }
  return false; // Nenhum conflito encontrado
}

int verificarDisponibilidadeProf(
  List<String> idsProfissionais,
  DateTime dataReferencia,
  List<AgendamentosRow> listaSupabase,
) {
  int profissionaisDisponiveis = 0;

  for (var idProf in idsProfissionais) {
    bool estaDisponivel = true;

    for (var registro in listaSupabase) {
      if (registro.idProf == idProf) {
        DateTime? dataAgendadaInicio = registro.dataAgendada;
        DateTime? dataAgendadaFim = registro.dataFim;

        if (dataAgendadaInicio != null && dataAgendadaFim != null) {
          // Verifica se a data de referência está dentro do período de algum agendamento existente
          if (dataReferencia.isAfter(dataAgendadaInicio) &&
              dataReferencia.isBefore(dataAgendadaFim)) {
            estaDisponivel = false;
            break; // Se o profissional já tiver conflito, não precisa continuar verificando
          }
        }
      }
    }

    if (estaDisponivel) {
      profissionaisDisponiveis++;
    }
  }

  return profissionaisDisponiveis;
}

String formatarDataParaBR(DateTime dataReferencia) {
  /// Extrai dia, mês, ano, hora e minutos
  String dia = dataReferencia.day.toString().padLeft(2, '0');
  String mes = dataReferencia.month.toString().padLeft(2, '0');
  String ano = dataReferencia.year
      .toString()
      .substring(2); // Últimos dois dígitos do ano
  String hora = dataReferencia.hour.toString().padLeft(2, '0');
  String minutos = dataReferencia.minute.toString().padLeft(2, '0');

  // Formata no padrão BR
  return '$dia/$mes/$ano às $hora:$minutos';
}

double calculateDistanceToSavedLocation(
  LatLng currentLocation,
  String savedLocationString,
) {
// Função para converter uma string no formato "LatLng(lat: -22.610915, lng: -43.709691)" para um Map com latitude e longitude
  Map<String, double> parseLatLng(String place) {
    // Verifique se a string contém 'lat' e 'lng'
    if (!place.contains('lat') || !place.contains('lng')) {
      throw ArgumentError(
          'Formato inválido. A string deve conter "lat" e "lng".');
    }

    // Divida a string e extraia os valores de lat e lng
    try {
      var parts = place.split(',');
      var latPart = parts[0].split(':');
      var lngPart = parts[1].split(':');

      // Converte para double e retorna
      var lat = double.parse(latPart[1].trim());
      var lng = double.parse(lngPart[1].trim().replaceAll(')', ''));
      return {'lat': lat, 'lng': lng};
    } catch (e) {
      throw ArgumentError('Erro ao processar a string: ' + e.toString());
    }
  }

// Função para converter graus em radianos
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

// Função para calcular a distância entre dois pontos (em Km) usando a fórmula de Haversine
  double calculateDistanceToSavedLocation(
      LatLng currentLocation, String savedLocationString) {
    // Converte a string do banco de dados em coordenadas LatLng
    final latLng = parseLatLng(savedLocationString);

    var earthRadiusKm = 6371.0;

    // Diferença de latitude e longitude
    var dLat = degreesToRadians(latLng['lat']! - currentLocation.latitude);
    var dLng = degreesToRadians(latLng['lng']! - currentLocation.longitude);

    var lat1 = degreesToRadians(currentLocation.latitude);
    var lat2 = degreesToRadians(latLng['lat']!);

    var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.sin(dLng / 2) *
            math.sin(dLng / 2) *
            math.cos(lat1) *
            math.cos(lat2);

    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadiusKm * c;
  }

  return calculateDistanceToSavedLocation(currentLocation, savedLocationString);
}

List<double> calculateDistancesFromCurrentLocation(
  LatLng currentLocation,
  List<LatLng> locations,
) {
// Função para converter graus em radianos
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

// Função para calcular a distância entre dois pontos (em Km) usando a fórmula de Haversine
  double calculateDistance(LatLng loc1, LatLng loc2) {
    var earthRadiusKm = 6371.0;

    // Diferença de latitude e longitude
    var dLat = degreesToRadians(loc2.latitude - loc1.latitude);
    var dLng = degreesToRadians(loc2.longitude - loc1.longitude);

    var lat1 = degreesToRadians(loc1.latitude);
    var lat2 = degreesToRadians(loc2.latitude);

    var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.sin(dLng / 2) *
            math.sin(dLng / 2) *
            math.cos(lat1) *
            math.cos(lat2);

    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadiusKm * c;
  }

// Função principal para calcular a distância entre a localização atual e uma lista de locais
  List<double> calculateDistancesFromCurrentLocation(
      LatLng currentLocation, List<LatLng> locations) {
    List<double> distances = [];

    // Itera sobre a lista de coordenadas e calcula a distância para cada uma
    for (LatLng location in locations) {
      double distance = calculateDistance(currentLocation, location);
      distances.add(distance); // Adiciona a distância calculada à lista
    }

    return distances;
  }

  return calculateDistancesFromCurrentLocation(currentLocation, locations);

  // Calcula a distância para cada local na lista
  /*
  return locations.map((location) {
    return calculateDistance(currentLocation, location);
  }).toList();
}

List<Map<String, dynamic>> sortSalonsByDistance(
  LatLng currentLocation,
  List<Map<String, dynamic>> salons,
) {
  // Extrai as localizações dos salões
  List<LatLng> locations = salons.map((salon) {
    return LatLng(
      salon['location']['latitude'],
      salon['location']['longitude'],
    );
  }).toList();

  // Calcula as distâncias usando a função existente
  List<double> distances =
      calculateDistancesFromCurrentLocation(currentLocation, locations);

  // Adiciona as distâncias aos objetos dos salões
  for (int i = 0; i < salons.length; i++) {
    salons[i]['distance'] = distances[i];
  }

  // Ordena os salões com base na distância
  salons.sort(
      (a, b) => (a['distance'] as double).compareTo(b['distance'] as double));

  return salons;*/
}

bool verificarFavorito(
  String idCliente,
  String idReferencia,
  String tipo,
  List<FavoritosRow>? listaFavoritos,
) {
// Verifica se a lista de favoritos não é nula e contém registros
  if (listaFavoritos != null && listaFavoritos.isNotEmpty) {
    for (var favorito in listaFavoritos) {
      // Verifica se o cliente está no registro de favorito
      if (favorito.idCliente == idCliente) {
        // Verifica o tipo e compara os IDs de referência
        if (tipo == 'Salão') {
          if (favorito.idSalao == idReferencia) {
            return true; // Cliente e Salão correspondem
          }
        } else if (tipo == 'Profissional') {
          if (favorito.idProf == idReferencia) {
            return true; // Cliente e Profissional correspondem
          }
        }
      }
    }
  }

  return false; // Nenhuma correspondência encontrada
}

double atualizarEstrelas(
  double novaAvaliacao,
  double? estrelasAtuais,
  int? qntAvaliacoes,
) {
// Define o valor padrão para estrelasAtuais e qntAvaliacoes se forem nulos
  double estrelasNaoNulas = estrelasAtuais ?? 0.0;
  int qntNaoNula = qntAvaliacoes ?? 0;

  // Incrementa a quantidade de avaliações
  int novaQntAvaliacoes = qntNaoNula + 1;

  // Atualiza o total de estrelas somando a nova avaliação
  double totalEstrelasAtualizado =
      (estrelasNaoNulas * qntNaoNula) + novaAvaliacao;

  // Calcula a nova média de estrelas
  double novaMediaEstrelas = totalEstrelasAtualizado / novaQntAvaliacoes;

  // Retorna o valor com uma casa decimal
  return double.parse(novaMediaEstrelas.toStringAsFixed(1));
}

int? atualizarQuantAvaliacoes(int? qntAvaliacoes) {
  int novaQntAvaliacoes = qntAvaliacoes ?? 0;

  novaQntAvaliacoes += 1;

  return novaQntAvaliacoes;
}

DateTime cancelamentoUmDiaAnterior(DateTime dataReferencia) {
  // Subtrai um dia da data de referência
  return dataReferencia.subtract(Duration(days: 1));
}

bool verificarDiaCalendario(DateTime dataSelecionada) {
  DateTime today = DateTime.now();

  // Comparando a data selecionada com a data de hoje
  if (dataSelecionada.isBefore(DateTime(today.year, today.month, today.day))) {
    return false; // Data inválida (passada)
  } else {
    return true; // Data válida (presente ou futura)
  }
}

bool horarioFormatoProf(
  String horaInicio,
  String horaFinal,
  String intervaloInicio,
  String intervaloFinal,
) {
  // Expressão regular para verificar o formato de horas (HH:mm)
  final RegExp formatoHoras = RegExp(r'^\d{2}:\d{2}$');

  // Verifica se todos os horários estão no formato correto
  bool formatoHorarioInicio = formatoHoras.hasMatch(horaInicio);
  bool formatoHorarioFinal = formatoHoras.hasMatch(horaFinal);
  bool formatoIntervaloInicio = formatoHoras.hasMatch(intervaloInicio);
  bool formatoIntervaloFinal = formatoHoras.hasMatch(intervaloFinal);

  // Retorna true se todos os horários estiverem no formato correto, senão false
  return formatoHorarioInicio &&
      formatoHorarioFinal &&
      formatoIntervaloInicio &&
      formatoIntervaloFinal;
}

bool horarioFormatoSalao(
  String horarioInicio,
  String horarioFinal,
) {
  // Expressão regular para verificar o formato de horas (HH:mm)
  final RegExp formatoHoras = RegExp(r'^\d{2}:\d{2}$');

  // Verifica se os horários estão no formato correto
  bool formatoHorarioInicio = formatoHoras.hasMatch(horarioInicio);
  bool formatoHorarioFinal = formatoHoras.hasMatch(horarioFinal);

  // Retorna true se ambos os horários estiverem no formato correto, senão false
  return formatoHorarioInicio && formatoHorarioFinal;
}

bool verificaVinculacao(
  String idProf,
  String idSalao,
  List<VincularSalProfRow>? listaVinculacao,
) {
// Verifica se a lista é nula ou vazia
  if (listaVinculacao == null || listaVinculacao.isEmpty) {
    return false; // Retorna false se a lista for nula ou estiver vazia
  }

  // Percorre cada linha da tabela (representada como um Map)
  for (var linha in listaVinculacao) {
    String? idDoProf = linha.idProfi;
    String? idDoSalao = linha.idSalao;
    // Verifica se os valores de idProf e idSalao estão presentes na mesma linha
    if (idDoProf == idProf && idDoSalao == idSalao) {
      return true; // Encontrou a linha correspondente
    }
  }

  return false; // Não encontrou nenhuma linha correspondente
}

String? criptografar(String palavra) {
// Inicializa constantes do SHA-256
  List<int> constants = [
    0x6a09e667,
    0xbb67ae85,
    0x3c6ef372,
    0xa54ff53a,
    0x510e527f,
    0x9b05688c,
    0x1f83d9ab,
    0x5be0cd19
  ];

  // Inicializa variáveis do estado intermediário do SHA-256
  List<int> state = List.from(constants);

  // Processa o input e aplica a função hash (aqui seria necessário expandir a lógica)
  // O exemplo a seguir é apenas ilustrativo; o algoritmo completo é mais complexo.

  // Neste exemplo básico, a string original é transformada em código de caracteres
  List<int> codeUnits = palavra.codeUnits;

  // Aplicação de uma transformação simples nos bytes (esta não é a versão final do SHA-256)
  for (int i = 0; i < codeUnits.length; i++) {
    state[i % state.length] ^= codeUnits[i];
  }

  // Converte o estado final para hexadecimal como uma representação do hash
  return state.map((e) => e.toRadixString(16).padLeft(8, '0')).join();
}

String? getNeighborhood(String address) {
  // Define uma expressão regular para identificar o bairro dentro do endereço.
  RegExp neighborhoodRegex = RegExp(r'\b\S+\s+bairro\b', caseSensitive: false);

  // Executa a pesquisa para extrair o bairro.
  Match? match = neighborhoodRegex.firstMatch(address);

  // Retorna o bairro, ou null se não encontrado.
  return match != null ? match.group(0) : null;
}

int? totalServicoFinalizado(
  String idServico,
  List<AgendamentosRow>? agendamentos,
) {
  int totalFinalizados = agendamentos?.where((servico) {
        return servico.idServico == idServico && servico.status == 'Finalizado';
      }).length ??
      0;

  return totalFinalizados;
}

List<double> totalRendimentProf(
  String idProf,
  List<AgendamentosRow>? agendamentos,
  List<ServicosRow>? servicosValores,
) {
  // Verifica se agendamentos ou serviços são nulos ou vazios
  if (agendamentos == null ||
      agendamentos.isEmpty ||
      servicosValores == null ||
      servicosValores.isEmpty) {
    return List<double>.filled(12, 0.0); // Retorna lista de ganhos zerada
  }

  // Inicializa uma lista para armazenar os ganhos por mês
  List<double> ganhosPorMes = List<double>.filled(12, 0.0);

  // Itera pelos agendamentos
  for (var agendamento in agendamentos) {
    if (agendamento.idProf == idProf) {
      // Busca o serviço correspondente ao idServico do agendamento
      ServicosRow? servico = servicosValores.firstWhere(
        (servico) => servico.idServico == agendamento.idServico,
        orElse: () => ServicosRow(
            {'id_servico': 0, 'valor': 0.0}), // Retorna um mapa padrão
      );

      // Obtém o valor do serviço
      double valorServico = servico.valor ?? 0.0;

      // Verifica o mês do agendamento e adiciona o valor ao mês correspondente
      DateTime? dataAgendada = agendamento.dataAgendada;
      if (dataAgendada != null) {
        int mes = dataAgendada.month; // Extrai o número do mês
        ganhosPorMes[mes - 1] += valorServico;
      }
    }
  }

  return ganhosPorMes;
}

List<double> totalRendimentoSalao(
  List<AgendamentosRow>? agendamentos,
  List<ServicosRow>? servicosValores,
  String? idSalao,
) {
// Verifica se agendamentos ou serviços são nulos ou vazios
  if (agendamentos == null ||
      agendamentos.isEmpty ||
      servicosValores == null ||
      servicosValores.isEmpty) {
    return List<double>.filled(12, 0.0); // Retorna lista de ganhos zerada
  }

  // Inicializa uma lista para armazenar os ganhos por mês
  List<double> ganhosPorMes = List<double>.filled(12, 0.0);

  // Itera pelos agendamentos
  for (var agendamento in agendamentos) {
    if (agendamento.idSalao == idSalao) {
      // Busca o serviço correspondente ao idServico do agendamento
      ServicosRow? servico = servicosValores.firstWhere(
        (servico) => servico.idServico == agendamento.idServico,
        orElse: () => ServicosRow(
            {'id_servico': 0, 'valor': 0.0}), // Retorna um mapa padrão
      );

      // Obtém o valor do serviço
      double valorServico = servico.valor ?? 0.0;

      // Verifica o mês do agendamento e adiciona o valor ao mês correspondente
      DateTime? dataAgendada = agendamento.dataAgendada;
      if (dataAgendada != null) {
        int mes = dataAgendada.month; // Extrai o número do mês
        ganhosPorMes[mes - 1] += valorServico;
      }
    }
  }

  return ganhosPorMes;
}

int? totalServicoProfFinalizado(
  String idProf,
  List<AgendamentosRow>? agendamentos,
) {
  int totalFinalizados = agendamentos?.where((servico) {
        return servico.idProf == idProf && servico.status == 'Finalizado';
      }).length ??
      0;

  return totalFinalizados;
}
