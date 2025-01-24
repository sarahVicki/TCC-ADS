import '../database.dart';

class ProfissionalTable extends SupabaseTable<ProfissionalRow> {
  @override
  String get tableName => 'profissional';

  @override
  ProfissionalRow createRow(Map<String, dynamic> data) => ProfissionalRow(data);
}

class ProfissionalRow extends SupabaseDataRow {
  ProfissionalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfissionalTable();

  String get idProf => getField<String>('id_prof')!;
  set idProf(String value) => setField<String>('id_prof', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  List<String> get especialidade => getListField<String>('especialidade');
  set especialidade(List<String>? value) =>
      setListField<String>('especialidade', value);

  bool? get domicilio => getField<bool>('domicilio');
  set domicilio(bool? value) => setField<bool>('domicilio', value);

  int? get qntAvaliacoes => getField<int>('qnt_avaliacoes');
  set qntAvaliacoes(int? value) => setField<int>('qnt_avaliacoes', value);

  double? get estrelas => getField<double>('estrelas');
  set estrelas(double? value) => setField<double>('estrelas', value);

  bool? get autonomo => getField<bool>('autonomo');
  set autonomo(bool? value) => setField<bool>('autonomo', value);

  List<String> get filiadoSalao => getListField<String>('filiado_salao');
  set filiadoSalao(List<String>? value) =>
      setListField<String>('filiado_salao', value);
}
