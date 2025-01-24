import '../database.dart';

class EnderecoTable extends SupabaseTable<EnderecoRow> {
  @override
  String get tableName => 'endereco';

  @override
  EnderecoRow createRow(Map<String, dynamic> data) => EnderecoRow(data);
}

class EnderecoRow extends SupabaseDataRow {
  EnderecoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EnderecoTable();

  String get idEndereco => getField<String>('id_endereco')!;
  set idEndereco(String value) => setField<String>('id_endereco', value);

  String? get endereco => getField<String>('endereco');
  set endereco(String? value) => setField<String>('endereco', value);

  String? get coordenadas => getField<String>('coordenadas');
  set coordenadas(String? value) => setField<String>('coordenadas', value);
}
