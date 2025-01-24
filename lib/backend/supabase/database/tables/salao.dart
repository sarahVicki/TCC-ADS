import '../database.dart';

class SalaoTable extends SupabaseTable<SalaoRow> {
  @override
  String get tableName => 'salao';

  @override
  SalaoRow createRow(Map<String, dynamic> data) => SalaoRow(data);
}

class SalaoRow extends SupabaseDataRow {
  SalaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SalaoTable();

  String get idSalao => getField<String>('id_salao')!;
  set idSalao(String value) => setField<String>('id_salao', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get fotoFundo => getField<String>('foto_fundo');
  set fotoFundo(String? value) => setField<String>('foto_fundo', value);

  String? get fotoPerfil => getField<String>('foto_perfil');
  set fotoPerfil(String? value) => setField<String>('foto_perfil', value);

  int? get cnpj => getField<int>('cnpj');
  set cnpj(int? value) => setField<int>('cnpj', value);

  double? get estrelas => getField<double>('estrelas');
  set estrelas(double? value) => setField<double>('estrelas', value);

  int? get qntAvaliacoes => getField<int>('qnt_avaliacoes');
  set qntAvaliacoes(int? value) => setField<int>('qnt_avaliacoes', value);
}
