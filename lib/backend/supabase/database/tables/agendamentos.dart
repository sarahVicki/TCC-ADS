import '../database.dart';

class AgendamentosTable extends SupabaseTable<AgendamentosRow> {
  @override
  String get tableName => 'agendamentos';

  @override
  AgendamentosRow createRow(Map<String, dynamic> data) => AgendamentosRow(data);
}

class AgendamentosRow extends SupabaseDataRow {
  AgendamentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AgendamentosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get idCliente => getField<String>('id_cliente');
  set idCliente(String? value) => setField<String>('id_cliente', value);

  String? get idSalao => getField<String>('id_salao');
  set idSalao(String? value) => setField<String>('id_salao', value);

  String? get idServico => getField<String>('id_servico');
  set idServico(String? value) => setField<String>('id_servico', value);

  DateTime? get dataAgendada => getField<DateTime>('data_agendada');
  set dataAgendada(DateTime? value) =>
      setField<DateTime>('data_agendada', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get idProf => getField<String>('id_prof');
  set idProf(String? value) => setField<String>('id_prof', value);

  DateTime? get dataFim => getField<DateTime>('data_fim');
  set dataFim(DateTime? value) => setField<DateTime>('data_fim', value);

  String? get nomeCliente => getField<String>('nome_cliente');
  set nomeCliente(String? value) => setField<String>('nome_cliente', value);

  String? get enderecoCliente => getField<String>('endereco_cliente');
  set enderecoCliente(String? value) =>
      setField<String>('endereco_cliente', value);

  String? get contatoCliente => getField<String>('contato_cliente');
  set contatoCliente(String? value) =>
      setField<String>('contato_cliente', value);
}
