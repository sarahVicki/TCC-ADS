import '../database.dart';

class FavoritosTable extends SupabaseTable<FavoritosRow> {
  @override
  String get tableName => 'favoritos';

  @override
  FavoritosRow createRow(Map<String, dynamic> data) => FavoritosRow(data);
}

class FavoritosRow extends SupabaseDataRow {
  FavoritosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoritosTable();

  int get idFavoritos => getField<int>('id_favoritos')!;
  set idFavoritos(int value) => setField<int>('id_favoritos', value);

  String get idCliente => getField<String>('id_cliente')!;
  set idCliente(String value) => setField<String>('id_cliente', value);

  String? get idSalao => getField<String>('id_salao');
  set idSalao(String? value) => setField<String>('id_salao', value);

  String? get idProf => getField<String>('id_prof');
  set idProf(String? value) => setField<String>('id_prof', value);
}
