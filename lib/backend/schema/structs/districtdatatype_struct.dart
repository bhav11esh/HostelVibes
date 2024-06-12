// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DistrictdatatypeStruct extends FFFirebaseStruct {
  DistrictdatatypeStruct({
    List<int>? rank,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rank = rank,
        super(firestoreUtilData);

  // "rank" field.
  List<int>? _rank;
  List<int> get rank => _rank ?? const [];
  set rank(List<int>? val) => _rank = val;
  void updateRank(Function(List<int>) updateFn) => updateFn(_rank ??= []);
  bool hasRank() => _rank != null;

  static DistrictdatatypeStruct fromMap(Map<String, dynamic> data) =>
      DistrictdatatypeStruct(
        rank: getDataList(data['rank']),
      );

  static DistrictdatatypeStruct? maybeFromMap(dynamic data) => data is Map
      ? DistrictdatatypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rank': _rank,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rank': serializeParam(
          _rank,
          ParamType.int,
          true,
        ),
      }.withoutNulls;

  static DistrictdatatypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DistrictdatatypeStruct(
        rank: deserializeParam<int>(
          data['rank'],
          ParamType.int,
          true,
        ),
      );

  static DistrictdatatypeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DistrictdatatypeStruct(
        rank: convertAlgoliaParam<int>(
          data['rank'],
          ParamType.int,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DistrictdatatypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DistrictdatatypeStruct &&
        listEquality.equals(rank, other.rank);
  }

  @override
  int get hashCode => const ListEquality().hash([rank]);
}

DistrictdatatypeStruct createDistrictdatatypeStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DistrictdatatypeStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DistrictdatatypeStruct? updateDistrictdatatypeStruct(
  DistrictdatatypeStruct? districtdatatype, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    districtdatatype
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDistrictdatatypeStructData(
  Map<String, dynamic> firestoreData,
  DistrictdatatypeStruct? districtdatatype,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (districtdatatype == null) {
    return;
  }
  if (districtdatatype.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && districtdatatype.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final districtdatatypeData =
      getDistrictdatatypeFirestoreData(districtdatatype, forFieldValue);
  final nestedData =
      districtdatatypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = districtdatatype.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDistrictdatatypeFirestoreData(
  DistrictdatatypeStruct? districtdatatype, [
  bool forFieldValue = false,
]) {
  if (districtdatatype == null) {
    return {};
  }
  final firestoreData = mapToFirestore(districtdatatype.toMap());

  // Add any Firestore field values
  districtdatatype.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDistrictdatatypeListFirestoreData(
  List<DistrictdatatypeStruct>? districtdatatypes,
) =>
    districtdatatypes
        ?.map((e) => getDistrictdatatypeFirestoreData(e, true))
        .toList() ??
    [];
