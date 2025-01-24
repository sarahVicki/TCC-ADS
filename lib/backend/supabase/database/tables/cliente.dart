import '../database.dart';

class ClienteTable extends SupabaseTable<ClienteRow> {
  @override
  String get tableName => 'cliente';

  @override
  ClienteRow createRow(Map<String, dynamic> data) => ClienteRow(data);
}

class ClienteRow extends SupabaseDataRow {
  ClienteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClienteTable();

  String get idCliente => getField<String>('id_cliente')!;
  set idCliente(String value) => setField<String>('id_cliente', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);
}
