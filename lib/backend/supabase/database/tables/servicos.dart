import '../database.dart';

class ServicosTable extends SupabaseTable<ServicosRow> {
  @override
  String get tableName => 'servicos';

  @override
  ServicosRow createRow(Map<String, dynamic> data) => ServicosRow(data);
}

class ServicosRow extends SupabaseDataRow {
  ServicosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServicosTable();

  String get idServico => getField<String>('id_servico')!;
  set idServico(String value) => setField<String>('id_servico', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  int? get tempo => getField<int>('tempo');
  set tempo(int? value) => setField<int>('tempo', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  List<String> get idProf => getListField<String>('id_prof');
  set idProf(List<String>? value) => setListField<String>('id_prof', value);

  String? get idSalao => getField<String>('id_salao');
  set idSalao(String? value) => setField<String>('id_salao', value);
}
