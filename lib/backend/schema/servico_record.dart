import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicoRecord extends FirestoreRecord {
  ServicoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "categoria" field.
  Categoria? _categoria;
  Categoria? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  bool hasValor() => _valor != null;

  // "tempo" field.
  int? _tempo;
  int get tempo => _tempo ?? 0;
  bool hasTempo() => _tempo != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "id_salao" field.
  String? _idSalao;
  String get idSalao => _idSalao ?? '';
  bool hasIdSalao() => _idSalao != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _categoria = snapshotData['categoria'] is Categoria
        ? snapshotData['categoria']
        : deserializeEnum<Categoria>(snapshotData['categoria']);
    _valor = castToType<double>(snapshotData['valor']);
    _tempo = castToType<int>(snapshotData['tempo']);
    _id = snapshotData['id'] as String?;
    _idSalao = snapshotData['id_salao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('servico');

  static Stream<ServicoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicoRecord.fromSnapshot(s));

  static Future<ServicoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicoRecord.fromSnapshot(s));

  static ServicoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicoRecordData({
  String? nome,
  Categoria? categoria,
  double? valor,
  int? tempo,
  String? id,
  String? idSalao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'categoria': categoria,
      'valor': valor,
      'tempo': tempo,
      'id': id,
      'id_salao': idSalao,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicoRecordDocumentEquality implements Equality<ServicoRecord> {
  const ServicoRecordDocumentEquality();

  @override
  bool equals(ServicoRecord? e1, ServicoRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.categoria == e2?.categoria &&
        e1?.valor == e2?.valor &&
        e1?.tempo == e2?.tempo &&
        e1?.id == e2?.id &&
        e1?.idSalao == e2?.idSalao;
  }

  @override
  int hash(ServicoRecord? e) => const ListEquality()
      .hash([e?.nome, e?.categoria, e?.valor, e?.tempo, e?.id, e?.idSalao]);

  @override
  bool isValidKey(Object? o) => o is ServicoRecord;
}
