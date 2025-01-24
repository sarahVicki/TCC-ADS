import '../database.dart';

class RedesTable extends SupabaseTable<RedesRow> {
  @override
  String get tableName => 'redes';

  @override
  RedesRow createRow(Map<String, dynamic> data) => RedesRow(data);
}

class RedesRow extends SupabaseDataRow {
  RedesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RedesTable();

  String? get linkZap => getField<String>('link_zap');
  set linkZap(String? value) => setField<String>('link_zap', value);

  String? get linkInsta => getField<String>('link_insta');
  set linkInsta(String? value) => setField<String>('link_insta', value);

  String? get linkFace => getField<String>('link_face');
  set linkFace(String? value) => setField<String>('link_face', value);

  String get idRedes => getField<String>('id_redes')!;
  set idRedes(String value) => setField<String>('id_redes', value);
}
