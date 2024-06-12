import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityRecord extends FirestoreRecord {
  CityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  bool hasCityId() => _cityId != null;

  // "city_idCountry" field.
  int? _cityIdCountry;
  int get cityIdCountry => _cityIdCountry ?? 0;
  bool hasCityIdCountry() => _cityIdCountry != null;

  // "region_id" field.
  int? _regionId;
  int get regionId => _regionId ?? 0;
  bool hasRegionId() => _regionId != null;

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  bool hasRegionName() => _regionName != null;

  // "city_country" field.
  String? _cityCountry;
  String get cityCountry => _cityCountry ?? '';
  bool hasCityCountry() => _cityCountry != null;

  void _initializeFields() {
    _cityId = castToType<int>(snapshotData['city_id']);
    _cityIdCountry = castToType<int>(snapshotData['city_idCountry']);
    _regionId = castToType<int>(snapshotData['region_id']);
    _cityName = snapshotData['city_name'] as String?;
    _regionName = snapshotData['region_name'] as String?;
    _cityCountry = snapshotData['city_country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('city');

  static Stream<CityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CityRecord.fromSnapshot(s));

  static Future<CityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CityRecord.fromSnapshot(s));

  static CityRecord fromSnapshot(DocumentSnapshot snapshot) => CityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CityRecord._(reference, mapFromFirestore(data));

  static CityRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CityRecord.getDocumentFromData(
        {
          'city_id': convertAlgoliaParam(
            snapshot.data['city_id'],
            ParamType.int,
            false,
          ),
          'city_idCountry': convertAlgoliaParam(
            snapshot.data['city_idCountry'],
            ParamType.int,
            false,
          ),
          'region_id': convertAlgoliaParam(
            snapshot.data['region_id'],
            ParamType.int,
            false,
          ),
          'city_name': snapshot.data['city_name'],
          'region_name': snapshot.data['region_name'],
          'city_country': snapshot.data['city_country'],
        },
        CityRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CityRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'city',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCityRecordData({
  int? cityId,
  int? cityIdCountry,
  int? regionId,
  String? cityName,
  String? regionName,
  String? cityCountry,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_id': cityId,
      'city_idCountry': cityIdCountry,
      'region_id': regionId,
      'city_name': cityName,
      'region_name': regionName,
      'city_country': cityCountry,
    }.withoutNulls,
  );

  return firestoreData;
}

class CityRecordDocumentEquality implements Equality<CityRecord> {
  const CityRecordDocumentEquality();

  @override
  bool equals(CityRecord? e1, CityRecord? e2) {
    return e1?.cityId == e2?.cityId &&
        e1?.cityIdCountry == e2?.cityIdCountry &&
        e1?.regionId == e2?.regionId &&
        e1?.cityName == e2?.cityName &&
        e1?.regionName == e2?.regionName &&
        e1?.cityCountry == e2?.cityCountry;
  }

  @override
  int hash(CityRecord? e) => const ListEquality().hash([
        e?.cityId,
        e?.cityIdCountry,
        e?.regionId,
        e?.cityName,
        e?.regionName,
        e?.cityCountry
      ]);

  @override
  bool isValidKey(Object? o) => o is CityRecord;
}
