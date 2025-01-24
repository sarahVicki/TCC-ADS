import '../database.dart';

class VincularSalProfTable extends SupabaseTable<VincularSalProfRow> {
  @override
  String get tableName => 'vincularSalProf';

  @override
  VincularSalProfRow createRow(Map<String, dynamic> data) =>
      VincularSalProfRow(data);
}

class VincularSalProfRow extends SupabaseDataRow {
  VincularSalProfRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VincularSalProfTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get idSalao => getField<String>('id_salao');
  set idSalao(String? value) => setField<String>('id_salao', value);

  String? get idProfi => getField<String>('id_profi');
  set idProfi(String? value) => setField<String>('id_profi', value);

  bool get resolvido => getField<bool>('resolvido')!;
  set resolvido(bool value) => setField<bool>('resolvido', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
