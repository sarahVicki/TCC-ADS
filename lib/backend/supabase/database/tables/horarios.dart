import '../database.dart';

class HorariosTable extends SupabaseTable<HorariosRow> {
  @override
  String get tableName => 'horarios';

  @override
  HorariosRow createRow(Map<String, dynamic> data) => HorariosRow(data);
}

class HorariosRow extends SupabaseDataRow {
  HorariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HorariosTable();

  List<String> get dia => getListField<String>('dia')!;
  set dia(List<String> value) => setListField<String>('dia', value);

  List<String> get status => getListField<String>('status');
  set status(List<String>? value) => setListField<String>('status', value);

  List<String> get horaAbertura => getListField<String>('hora_abertura');
  set horaAbertura(List<String>? value) =>
      setListField<String>('hora_abertura', value);

  List<String> get horaFechamento => getListField<String>('hora_fechamento');
  set horaFechamento(List<String>? value) =>
      setListField<String>('hora_fechamento', value);

  String get idHorario => getField<String>('id_horario')!;
  set idHorario(String value) => setField<String>('id_horario', value);

  List<String> get intervaloInicio => getListField<String>('intervalo_inicio');
  set intervaloInicio(List<String>? value) =>
      setListField<String>('intervalo_inicio', value);

  List<String> get intervaloFinal => getListField<String>('intervalo_final');
  set intervaloFinal(List<String>? value) =>
      setListField<String>('intervalo_final', value);

  List<String> get localTrabalho => getListField<String>('local_trabalho');
  set localTrabalho(List<String>? value) =>
      setListField<String>('local_trabalho', value);
}
