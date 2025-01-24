import '../database.dart';

class EspecialidadesTable extends SupabaseTable<EspecialidadesRow> {
  @override
  String get tableName => 'especialidades';

  @override
  EspecialidadesRow createRow(Map<String, dynamic> data) =>
      EspecialidadesRow(data);
}

class EspecialidadesRow extends SupabaseDataRow {
  EspecialidadesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EspecialidadesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
