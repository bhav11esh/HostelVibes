// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StayruleDataStruct extends FFFirebaseStruct {
  StayruleDataStruct({
    String? type,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _price = price,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static StayruleDataStruct fromMap(Map<String, dynamic> data) =>
      StayruleDataStruct(
        type: data['type'] as String?,
        price: castToType<double>(data['price']),
      );

  static StayruleDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StayruleDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static StayruleDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StayruleDataStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  static StayruleDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StayruleDataStruct(
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StayruleDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StayruleDataStruct &&
        type == other.type &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([type, price]);
}

StayruleDataStruct createStayruleDataStruct({
  String? type,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StayruleDataStruct(
      type: type,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StayruleDataStruct? updateStayruleDataStruct(
  StayruleDataStruct? stayruleData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stayruleData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStayruleDataStructData(
  Map<String, dynamic> firestoreData,
  StayruleDataStruct? stayruleData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stayruleData == null) {
    return;
  }
  if (stayruleData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stayruleData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stayruleDataData =
      getStayruleDataFirestoreData(stayruleData, forFieldValue);
  final nestedData =
      stayruleDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stayruleData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStayruleDataFirestoreData(
  StayruleDataStruct? stayruleData, [
  bool forFieldValue = false,
]) {
  if (stayruleData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stayruleData.toMap());

  // Add any Firestore field values
  stayruleData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStayruleDataListFirestoreData(
  List<StayruleDataStruct>? stayruleDatas,
) =>
    stayruleDatas?.map((e) => getStayruleDataFirestoreData(e, true)).toList() ??
    [];
