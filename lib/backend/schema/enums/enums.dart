import 'package:collection/collection.dart';

enum Categoria {
  Barbearia,
  Cabelo,
  cilios,
  depilacao,
  estetica,
  manicure,
  pedicure,
  maquiagem,
  spa,
  sobrancelha,
  massagem,
  outros,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Categoria):
      return Categoria.values.deserialize(value) as T?;
    default:
      return null;
  }
}
