import '../database.dart';

class AvaliacaoTable extends SupabaseTable<AvaliacaoRow> {
  @override
  String get tableName => 'avaliacao';

  @override
  AvaliacaoRow createRow(Map<String, dynamic> data) => AvaliacaoRow(data);
}

class AvaliacaoRow extends SupabaseDataRow {
  AvaliacaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvaliacaoTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get estrelas => getField<double>('estrelas');
  set estrelas(double? value) => setField<double>('estrelas', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get idCliente => getField<String>('id_cliente');
  set idCliente(String? value) => setField<String>('id_cliente', value);

  String? get idSalao => getField<String>('id_salao');
  set idSalao(String? value) => setField<String>('id_salao', value);

  String? get idProf => getField<String>('id_prof');
  set idProf(String? value) => setField<String>('id_prof', value);

  String? get idServico => getField<String>('id_servico');
  set idServico(String? value) => setField<String>('id_servico', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get arquivo => getField<String>('arquivo');
  set arquivo(String? value) => setField<String>('arquivo', value);
}
