// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtlocalStruct extends FFFirebaseStruct {
  DtlocalStruct({
    String? endereco,
    LatLng? coordenadas,
    String? nome,
    String? fotoPerfil,
    String? idSalao,
    double? estrelas,
    int? qntAvaliacoes,
    String? distancia,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _endereco = endereco,
        _coordenadas = coordenadas,
        _nome = nome,
        _fotoPerfil = fotoPerfil,
        _idSalao = idSalao,
        _estrelas = estrelas,
        _qntAvaliacoes = qntAvaliacoes,
        _distancia = distancia,
        super(firestoreUtilData);

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "coordenadas" field.
  LatLng? _coordenadas;
  LatLng? get coordenadas => _coordenadas;
  set coordenadas(LatLng? val) => _coordenadas = val;

  bool hasCoordenadas() => _coordenadas != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "foto_perfil" field.
  String? _fotoPerfil;
  String get fotoPerfil => _fotoPerfil ?? '';
  set fotoPerfil(String? val) => _fotoPerfil = val;

  bool hasFotoPerfil() => _fotoPerfil != null;

  // "id_salao" field.
  String? _idSalao;
  String get idSalao => _idSalao ?? '';
  set idSalao(String? val) => _idSalao = val;

  bool hasIdSalao() => _idSalao != null;

  // "estrelas" field.
  double? _estrelas;
  double get estrelas => _estrelas ?? 0.0;
  set estrelas(double? val) => _estrelas = val;

  void incrementEstrelas(double amount) => estrelas = estrelas + amount;

  bool hasEstrelas() => _estrelas != null;

  // "qnt_avaliacoes" field.
  int? _qntAvaliacoes;
  int get qntAvaliacoes => _qntAvaliacoes ?? 0;
  set qntAvaliacoes(int? val) => _qntAvaliacoes = val;

  void incrementQntAvaliacoes(int amount) =>
      qntAvaliacoes = qntAvaliacoes + amount;

  bool hasQntAvaliacoes() => _qntAvaliacoes != null;

  // "distancia" field.
  String? _distancia;
  String get distancia => _distancia ?? '';
  set distancia(String? val) => _distancia = val;

  bool hasDistancia() => _distancia != null;

  static DtlocalStruct fromMap(Map<String, dynamic> data) => DtlocalStruct(
        endereco: data['endereco'] as String?,
        coordenadas: data['coordenadas'] as LatLng?,
        nome: data['nome'] as String?,
        fotoPerfil: data['foto_perfil'] as String?,
        idSalao: data['id_salao'] as String?,
        estrelas: castToType<double>(data['estrelas']),
        qntAvaliacoes: castToType<int>(data['qnt_avaliacoes']),
        distancia: data['distancia'] as String?,
      );

  static DtlocalStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtlocalStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'endereco': _endereco,
        'coordenadas': _coordenadas,
        'nome': _nome,
        'foto_perfil': _fotoPerfil,
        'id_salao': _idSalao,
        'estrelas': _estrelas,
        'qnt_avaliacoes': _qntAvaliacoes,
        'distancia': _distancia,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'coordenadas': serializeParam(
          _coordenadas,
          ParamType.LatLng,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'foto_perfil': serializeParam(
          _fotoPerfil,
          ParamType.String,
        ),
        'id_salao': serializeParam(
          _idSalao,
          ParamType.String,
        ),
        'estrelas': serializeParam(
          _estrelas,
          ParamType.double,
        ),
        'qnt_avaliacoes': serializeParam(
          _qntAvaliacoes,
          ParamType.int,
        ),
        'distancia': serializeParam(
          _distancia,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtlocalStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtlocalStruct(
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        coordenadas: deserializeParam(
          data['coordenadas'],
          ParamType.LatLng,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        fotoPerfil: deserializeParam(
          data['foto_perfil'],
          ParamType.String,
          false,
        ),
        idSalao: deserializeParam(
          data['id_salao'],
          ParamType.String,
          false,
        ),
        estrelas: deserializeParam(
          data['estrelas'],
          ParamType.double,
          false,
        ),
        qntAvaliacoes: deserializeParam(
          data['qnt_avaliacoes'],
          ParamType.int,
          false,
        ),
        distancia: deserializeParam(
          data['distancia'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtlocalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtlocalStruct &&
        endereco == other.endereco &&
        coordenadas == other.coordenadas &&
        nome == other.nome &&
        fotoPerfil == other.fotoPerfil &&
        idSalao == other.idSalao &&
        estrelas == other.estrelas &&
        qntAvaliacoes == other.qntAvaliacoes &&
        distancia == other.distancia;
  }

  @override
  int get hashCode => const ListEquality().hash([
        endereco,
        coordenadas,
        nome,
        fotoPerfil,
        idSalao,
        estrelas,
        qntAvaliacoes,
        distancia
      ]);
}

DtlocalStruct createDtlocalStruct({
  String? endereco,
  LatLng? coordenadas,
  String? nome,
  String? fotoPerfil,
  String? idSalao,
  double? estrelas,
  int? qntAvaliacoes,
  String? distancia,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtlocalStruct(
      endereco: endereco,
      coordenadas: coordenadas,
      nome: nome,
      fotoPerfil: fotoPerfil,
      idSalao: idSalao,
      estrelas: estrelas,
      qntAvaliacoes: qntAvaliacoes,
      distancia: distancia,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtlocalStruct? updateDtlocalStruct(
  DtlocalStruct? dtlocal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtlocal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtlocalStructData(
  Map<String, dynamic> firestoreData,
  DtlocalStruct? dtlocal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtlocal == null) {
    return;
  }
  if (dtlocal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtlocal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtlocalData = getDtlocalFirestoreData(dtlocal, forFieldValue);
  final nestedData = dtlocalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtlocal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtlocalFirestoreData(
  DtlocalStruct? dtlocal, [
  bool forFieldValue = false,
]) {
  if (dtlocal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtlocal.toMap());

  // Add any Firestore field values
  dtlocal.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtlocalListFirestoreData(
  List<DtlocalStruct>? dtlocals,
) =>
    dtlocals?.map((e) => getDtlocalFirestoreData(e, true)).toList() ?? [];
