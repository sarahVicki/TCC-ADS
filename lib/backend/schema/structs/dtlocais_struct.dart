// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtlocaisStruct extends FFFirebaseStruct {
  DtlocaisStruct({
    String? idEndereco,
    String? endereco,
    LatLng? coordenadas,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idEndereco = idEndereco,
        _endereco = endereco,
        _coordenadas = coordenadas,
        super(firestoreUtilData);

  // "id_endereco" field.
  String? _idEndereco;
  String get idEndereco => _idEndereco ?? '';
  set idEndereco(String? val) => _idEndereco = val;

  bool hasIdEndereco() => _idEndereco != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "coordenadas" field.
  LatLng? _coordenadas;
  LatLng? get coordenadas => _coordenadas;
  set coordenadas(LatLng? val) => _coordenadas = val;

  bool hasCoordenadas() => _coordenadas != null;

  static DtlocaisStruct fromMap(Map<String, dynamic> data) => DtlocaisStruct(
        idEndereco: data['id_endereco'] as String?,
        endereco: data['endereco'] as String?,
        coordenadas: data['coordenadas'] as LatLng?,
      );

  static DtlocaisStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtlocaisStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id_endereco': _idEndereco,
        'endereco': _endereco,
        'coordenadas': _coordenadas,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_endereco': serializeParam(
          _idEndereco,
          ParamType.String,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'coordenadas': serializeParam(
          _coordenadas,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static DtlocaisStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtlocaisStruct(
        idEndereco: deserializeParam(
          data['id_endereco'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        coordenadas: deserializeParam(
          data['coordenadas'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'DtlocaisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtlocaisStruct &&
        idEndereco == other.idEndereco &&
        endereco == other.endereco &&
        coordenadas == other.coordenadas;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([idEndereco, endereco, coordenadas]);
}

DtlocaisStruct createDtlocaisStruct({
  String? idEndereco,
  String? endereco,
  LatLng? coordenadas,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtlocaisStruct(
      idEndereco: idEndereco,
      endereco: endereco,
      coordenadas: coordenadas,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtlocaisStruct? updateDtlocaisStruct(
  DtlocaisStruct? dtlocais, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtlocais
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtlocaisStructData(
  Map<String, dynamic> firestoreData,
  DtlocaisStruct? dtlocais,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtlocais == null) {
    return;
  }
  if (dtlocais.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtlocais.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtlocaisData = getDtlocaisFirestoreData(dtlocais, forFieldValue);
  final nestedData = dtlocaisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtlocais.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtlocaisFirestoreData(
  DtlocaisStruct? dtlocais, [
  bool forFieldValue = false,
]) {
  if (dtlocais == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtlocais.toMap());

  // Add any Firestore field values
  dtlocais.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtlocaisListFirestoreData(
  List<DtlocaisStruct>? dtlocaiss,
) =>
    dtlocaiss?.map((e) => getDtlocaisFirestoreData(e, true)).toList() ?? [];
