// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StayruledatalistStruct extends FFFirebaseStruct {
  StayruledatalistStruct({
    List<StayruleDataStruct>? liststay,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _liststay = liststay,
        super(firestoreUtilData);

  // "liststay" field.
  List<StayruleDataStruct>? _liststay;
  List<StayruleDataStruct> get liststay => _liststay ?? const [];
  set liststay(List<StayruleDataStruct>? val) => _liststay = val;
  void updateListstay(Function(List<StayruleDataStruct>) updateFn) =>
      updateFn(_liststay ??= []);
  bool hasListstay() => _liststay != null;

  static StayruledatalistStruct fromMap(Map<String, dynamic> data) =>
      StayruledatalistStruct(
        liststay: getStructList(
          data['liststay'],
          StayruleDataStruct.fromMap,
        ),
      );

  static StayruledatalistStruct? maybeFromMap(dynamic data) => data is Map
      ? StayruledatalistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'liststay': _liststay?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'liststay': serializeParam(
          _liststay,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static StayruledatalistStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StayruledatalistStruct(
        liststay: deserializeStructParam<StayruleDataStruct>(
          data['liststay'],
          ParamType.DataStruct,
          true,
          structBuilder: StayruleDataStruct.fromSerializableMap,
        ),
      );

  static StayruledatalistStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StayruledatalistStruct(
        liststay: convertAlgoliaParam<StayruleDataStruct>(
          data['liststay'],
          ParamType.DataStruct,
          true,
          structBuilder: StayruleDataStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StayruledatalistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StayruledatalistStruct &&
        listEquality.equals(liststay, other.liststay);
  }

  @override
  int get hashCode => const ListEquality().hash([liststay]);
}

StayruledatalistStruct createStayruledatalistStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StayruledatalistStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StayruledatalistStruct? updateStayruledatalistStruct(
  StayruledatalistStruct? stayruledatalist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stayruledatalist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStayruledatalistStructData(
  Map<String, dynamic> firestoreData,
  StayruledatalistStruct? stayruledatalist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stayruledatalist == null) {
    return;
  }
  if (stayruledatalist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stayruledatalist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stayruledatalistData =
      getStayruledatalistFirestoreData(stayruledatalist, forFieldValue);
  final nestedData =
      stayruledatalistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stayruledatalist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStayruledatalistFirestoreData(
  StayruledatalistStruct? stayruledatalist, [
  bool forFieldValue = false,
]) {
  if (stayruledatalist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stayruledatalist.toMap());

  // Add any Firestore field values
  stayruledatalist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStayruledatalistListFirestoreData(
  List<StayruledatalistStruct>? stayruledatalists,
) =>
    stayruledatalists
        ?.map((e) => getStayruledatalistFirestoreData(e, true))
        .toList() ??
    [];
