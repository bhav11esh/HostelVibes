import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HostelDatav2Record extends FirestoreRecord {
  HostelDatav2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "address1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  bool hasAddress1() => _address1 != null;

  // "address2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  bool hasAddress2() => _address2 != null;

  // "distance_units" field.
  String? _distanceUnits;
  String get distanceUnits => _distanceUnits ?? '';
  bool hasDistanceUnits() => _distanceUnits != null;

  // "district_name" field.
  String? _districtName;
  String get districtName => _districtName ?? '';
  bool hasDistrictName() => _districtName != null;

  // "fenceDistance" field.
  int? _fenceDistance;
  int get fenceDistance => _fenceDistance ?? 0;
  bool hasFenceDistance() => _fenceDistance != null;

  // "freeCancellationAvailable" field.
  bool? _freeCancellationAvailable;
  bool get freeCancellationAvailable => _freeCancellationAvailable ?? false;
  bool hasFreeCancellationAvailable() => _freeCancellationAvailable != null;

  // "freeCancellationAvailableUntil" field.
  String? _freeCancellationAvailableUntil;
  String get freeCancellationAvailableUntil =>
      _freeCancellationAvailableUntil ?? '';
  bool hasFreeCancellationAvailableUntil() =>
      _freeCancellationAvailableUntil != null;

  // "freeCancellation_description" field.
  String? _freeCancellationDescription;
  String get freeCancellationDescription => _freeCancellationDescription ?? '';
  bool hasFreeCancellationDescription() => _freeCancellationDescription != null;

  // "freeCancellation_label" field.
  String? _freeCancellationLabel;
  String get freeCancellationLabel => _freeCancellationLabel ?? '';
  bool hasFreeCancellationLabel() => _freeCancellationLabel != null;

  // "hostelworldRecommends" field.
  bool? _hostelworldRecommends;
  bool get hostelworldRecommends => _hostelworldRecommends ?? false;
  bool hasHostelworldRecommends() => _hostelworldRecommends != null;

  // "hwExtra" field.
  String? _hwExtra;
  String get hwExtra => _hwExtra ?? '';
  bool hasHwExtra() => _hwExtra != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "imagesGalleryUrl" field.
  List<String>? _imagesGalleryUrl;
  List<String> get imagesGalleryUrl => _imagesGalleryUrl ?? const [];
  bool hasImagesGalleryUrl() => _imagesGalleryUrl != null;

  // "images_url" field.
  List<String>? _imagesUrl;
  List<String> get imagesUrl => _imagesUrl ?? const [];
  bool hasImagesUrl() => _imagesUrl != null;

  // "isElevate" field.
  bool? _isElevate;
  bool get isElevate => _isElevate ?? false;
  bool hasIsElevate() => _isElevate != null;

  // "isFeatured" field.
  bool? _isFeatured;
  bool get isFeatured => _isFeatured ?? false;
  bool hasIsFeatured() => _isFeatured != null;

  // "isNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  bool hasIsNew() => _isNew != null;

  // "isPromoted" field.
  bool? _isPromoted;
  bool get isPromoted => _isPromoted ?? false;
  bool hasIsPromoted() => _isPromoted != null;

  // "lowestDormPricePerNight_currency" field.
  String? _lowestDormPricePerNightCurrency;
  String get lowestDormPricePerNightCurrency =>
      _lowestDormPricePerNightCurrency ?? '';
  bool hasLowestDormPricePerNightCurrency() =>
      _lowestDormPricePerNightCurrency != null;

  // "lowestPricePerNight_currency" field.
  String? _lowestPricePerNightCurrency;
  String get lowestPricePerNightCurrency => _lowestPricePerNightCurrency ?? '';
  bool hasLowestPricePerNightCurrency() => _lowestPricePerNightCurrency != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  bool hasOverview() => _overview != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 0;
  bool hasPosition() => _position != null;

  // "ratingBreakdown_average" field.
  int? _ratingBreakdownAverage;
  int get ratingBreakdownAverage => _ratingBreakdownAverage ?? 0;
  bool hasRatingBreakdownAverage() => _ratingBreakdownAverage != null;

  // "ratingBreakdow_clean" field.
  int? _ratingBreakdowClean;
  int get ratingBreakdowClean => _ratingBreakdowClean ?? 0;
  bool hasRatingBreakdowClean() => _ratingBreakdowClean != null;

  // "ratingBreakdow_facilities" field.
  int? _ratingBreakdowFacilities;
  int get ratingBreakdowFacilities => _ratingBreakdowFacilities ?? 0;
  bool hasRatingBreakdowFacilities() => _ratingBreakdowFacilities != null;

  // "ratingBreakdow_fun" field.
  int? _ratingBreakdowFun;
  int get ratingBreakdowFun => _ratingBreakdowFun ?? 0;
  bool hasRatingBreakdowFun() => _ratingBreakdowFun != null;

  // "ratingBreakdow_location" field.
  int? _ratingBreakdowLocation;
  int get ratingBreakdowLocation => _ratingBreakdowLocation ?? 0;
  bool hasRatingBreakdowLocation() => _ratingBreakdowLocation != null;

  // "ratingBreakdow_ratingsCount" field.
  int? _ratingBreakdowRatingsCount;
  int get ratingBreakdowRatingsCount => _ratingBreakdowRatingsCount ?? 0;
  bool hasRatingBreakdowRatingsCount() => _ratingBreakdowRatingsCount != null;

  // "ratingBreakdow_security" field.
  int? _ratingBreakdowSecurity;
  int get ratingBreakdowSecurity => _ratingBreakdowSecurity ?? 0;
  bool hasRatingBreakdowSecurity() => _ratingBreakdowSecurity != null;

  // "ratingBreakdow_staff" field.
  int? _ratingBreakdowStaff;
  int get ratingBreakdowStaff => _ratingBreakdowStaff ?? 0;
  bool hasRatingBreakdowStaff() => _ratingBreakdowStaff != null;

  // "ratingBreakdow_value" field.
  int? _ratingBreakdowValue;
  int get ratingBreakdowValue => _ratingBreakdowValue ?? 0;
  bool hasRatingBreakdowValue() => _ratingBreakdowValue != null;

  // "starRating" field.
  int? _starRating;
  int get starRating => _starRating ?? 0;
  bool hasStarRating() => _starRating != null;

  // "lowestDormPricePerNight_value" field.
  double? _lowestDormPricePerNightValue;
  double get lowestDormPricePerNightValue =>
      _lowestDormPricePerNightValue ?? 0.0;
  bool hasLowestDormPricePerNightValue() =>
      _lowestDormPricePerNightValue != null;

  // "lowestPrivatePricePerNight_value" field.
  double? _lowestPrivatePricePerNightValue;
  double get lowestPrivatePricePerNightValue =>
      _lowestPrivatePricePerNightValue ?? 0.0;
  bool hasLowestPrivatePricePerNightValue() =>
      _lowestPrivatePricePerNightValue != null;

  // "overallRating_overall" field.
  double? _overallRatingOverall;
  double get overallRatingOverall => _overallRatingOverall ?? 0.0;
  bool hasOverallRatingOverall() => _overallRatingOverall != null;

  // "distance_value" field.
  double? _distanceValue;
  double get distanceValue => _distanceValue ?? 0.0;
  bool hasDistanceValue() => _distanceValue != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "district_id" field.
  double? _districtId;
  double get districtId => _districtId ?? 0.0;
  bool hasDistrictId() => _districtId != null;

  // "overallRating_numberOfRatings" field.
  double? _overallRatingNumberOfRatings;
  double get overallRatingNumberOfRatings =>
      _overallRatingNumberOfRatings ?? 0.0;
  bool hasOverallRatingNumberOfRatings() =>
      _overallRatingNumberOfRatings != null;

  // "lowestPricePerNight_value" field.
  double? _lowestPricePerNightValue;
  double get lowestPricePerNightValue => _lowestPricePerNightValue ?? 0.0;
  bool hasLowestPricePerNightValue() => _lowestPricePerNightValue != null;

  // "city_id" field.
  double? _cityId;
  double get cityId => _cityId ?? 0.0;
  bool hasCityId() => _cityId != null;

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "city_idCountry" field.
  double? _cityIdCountry;
  double get cityIdCountry => _cityIdCountry ?? 0.0;
  bool hasCityIdCountry() => _cityIdCountry != null;

  // "city_country" field.
  String? _cityCountry;
  String get cityCountry => _cityCountry ?? '';
  bool hasCityCountry() => _cityCountry != null;

  // "region_id" field.
  double? _regionId;
  double get regionId => _regionId ?? 0.0;
  bool hasRegionId() => _regionId != null;

  // "region_name" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  bool hasRegionName() => _regionName != null;

  // "facilitiesSummary" field.
  List<String>? _facilitiesSummary;
  List<String> get facilitiesSummary => _facilitiesSummary ?? const [];
  bool hasFacilitiesSummary() => _facilitiesSummary != null;

  // "hbid" field.
  String? _hbid;
  String get hbid => _hbid ?? '';
  bool hasHbid() => _hbid != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "hosteladmin" field.
  List<DocumentReference>? _hosteladmin;
  List<DocumentReference> get hosteladmin => _hosteladmin ?? const [];
  bool hasHosteladmin() => _hosteladmin != null;

  void _initializeFields() {
    _address1 = snapshotData['address1'] as String?;
    _address2 = snapshotData['address2'] as String?;
    _distanceUnits = snapshotData['distance_units'] as String?;
    _districtName = snapshotData['district_name'] as String?;
    _fenceDistance = castToType<int>(snapshotData['fenceDistance']);
    _freeCancellationAvailable =
        snapshotData['freeCancellationAvailable'] as bool?;
    _freeCancellationAvailableUntil =
        snapshotData['freeCancellationAvailableUntil'] as String?;
    _freeCancellationDescription =
        snapshotData['freeCancellation_description'] as String?;
    _freeCancellationLabel = snapshotData['freeCancellation_label'] as String?;
    _hostelworldRecommends = snapshotData['hostelworldRecommends'] as bool?;
    _hwExtra = snapshotData['hwExtra'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _imagesGalleryUrl = getDataList(snapshotData['imagesGalleryUrl']);
    _imagesUrl = getDataList(snapshotData['images_url']);
    _isElevate = snapshotData['isElevate'] as bool?;
    _isFeatured = snapshotData['isFeatured'] as bool?;
    _isNew = snapshotData['isNew'] as bool?;
    _isPromoted = snapshotData['isPromoted'] as bool?;
    _lowestDormPricePerNightCurrency =
        snapshotData['lowestDormPricePerNight_currency'] as String?;
    _lowestPricePerNightCurrency =
        snapshotData['lowestPricePerNight_currency'] as String?;
    _name = snapshotData['name'] as String?;
    _overview = snapshotData['overview'] as String?;
    _position = castToType<int>(snapshotData['position']);
    _ratingBreakdownAverage =
        castToType<int>(snapshotData['ratingBreakdown_average']);
    _ratingBreakdowClean =
        castToType<int>(snapshotData['ratingBreakdow_clean']);
    _ratingBreakdowFacilities =
        castToType<int>(snapshotData['ratingBreakdow_facilities']);
    _ratingBreakdowFun = castToType<int>(snapshotData['ratingBreakdow_fun']);
    _ratingBreakdowLocation =
        castToType<int>(snapshotData['ratingBreakdow_location']);
    _ratingBreakdowRatingsCount =
        castToType<int>(snapshotData['ratingBreakdow_ratingsCount']);
    _ratingBreakdowSecurity =
        castToType<int>(snapshotData['ratingBreakdow_security']);
    _ratingBreakdowStaff =
        castToType<int>(snapshotData['ratingBreakdow_staff']);
    _ratingBreakdowValue =
        castToType<int>(snapshotData['ratingBreakdow_value']);
    _starRating = castToType<int>(snapshotData['starRating']);
    _lowestDormPricePerNightValue =
        castToType<double>(snapshotData['lowestDormPricePerNight_value']);
    _lowestPrivatePricePerNightValue =
        castToType<double>(snapshotData['lowestPrivatePricePerNight_value']);
    _overallRatingOverall =
        castToType<double>(snapshotData['overallRating_overall']);
    _distanceValue = castToType<double>(snapshotData['distance_value']);
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _districtId = castToType<double>(snapshotData['district_id']);
    _overallRatingNumberOfRatings =
        castToType<double>(snapshotData['overallRating_numberOfRatings']);
    _lowestPricePerNightValue =
        castToType<double>(snapshotData['lowestPricePerNight_value']);
    _cityId = castToType<double>(snapshotData['city_id']);
    _cityName = snapshotData['city_name'] as String?;
    _cityIdCountry = castToType<double>(snapshotData['city_idCountry']);
    _cityCountry = snapshotData['city_country'] as String?;
    _regionId = castToType<double>(snapshotData['region_id']);
    _regionName = snapshotData['region_name'] as String?;
    _facilitiesSummary = getDataList(snapshotData['facilitiesSummary']);
    _hbid = snapshotData['hbid'] as String?;
    _type = snapshotData['type'] as String?;
    _hosteladmin = getDataList(snapshotData['hosteladmin']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HostelDatav2');

  static Stream<HostelDatav2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HostelDatav2Record.fromSnapshot(s));

  static Future<HostelDatav2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HostelDatav2Record.fromSnapshot(s));

  static HostelDatav2Record fromSnapshot(DocumentSnapshot snapshot) =>
      HostelDatav2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HostelDatav2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HostelDatav2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HostelDatav2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HostelDatav2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHostelDatav2RecordData({
  String? address1,
  String? address2,
  String? distanceUnits,
  String? districtName,
  int? fenceDistance,
  bool? freeCancellationAvailable,
  String? freeCancellationAvailableUntil,
  String? freeCancellationDescription,
  String? freeCancellationLabel,
  bool? hostelworldRecommends,
  String? hwExtra,
  int? id,
  bool? isElevate,
  bool? isFeatured,
  bool? isNew,
  bool? isPromoted,
  String? lowestDormPricePerNightCurrency,
  String? lowestPricePerNightCurrency,
  String? name,
  String? overview,
  int? position,
  int? ratingBreakdownAverage,
  int? ratingBreakdowClean,
  int? ratingBreakdowFacilities,
  int? ratingBreakdowFun,
  int? ratingBreakdowLocation,
  int? ratingBreakdowRatingsCount,
  int? ratingBreakdowSecurity,
  int? ratingBreakdowStaff,
  int? ratingBreakdowValue,
  int? starRating,
  double? lowestDormPricePerNightValue,
  double? lowestPrivatePricePerNightValue,
  double? overallRatingOverall,
  double? distanceValue,
  double? latitude,
  double? longitude,
  double? districtId,
  double? overallRatingNumberOfRatings,
  double? lowestPricePerNightValue,
  double? cityId,
  String? cityName,
  double? cityIdCountry,
  String? cityCountry,
  double? regionId,
  String? regionName,
  String? hbid,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address1': address1,
      'address2': address2,
      'distance_units': distanceUnits,
      'district_name': districtName,
      'fenceDistance': fenceDistance,
      'freeCancellationAvailable': freeCancellationAvailable,
      'freeCancellationAvailableUntil': freeCancellationAvailableUntil,
      'freeCancellation_description': freeCancellationDescription,
      'freeCancellation_label': freeCancellationLabel,
      'hostelworldRecommends': hostelworldRecommends,
      'hwExtra': hwExtra,
      'id': id,
      'isElevate': isElevate,
      'isFeatured': isFeatured,
      'isNew': isNew,
      'isPromoted': isPromoted,
      'lowestDormPricePerNight_currency': lowestDormPricePerNightCurrency,
      'lowestPricePerNight_currency': lowestPricePerNightCurrency,
      'name': name,
      'overview': overview,
      'position': position,
      'ratingBreakdown_average': ratingBreakdownAverage,
      'ratingBreakdow_clean': ratingBreakdowClean,
      'ratingBreakdow_facilities': ratingBreakdowFacilities,
      'ratingBreakdow_fun': ratingBreakdowFun,
      'ratingBreakdow_location': ratingBreakdowLocation,
      'ratingBreakdow_ratingsCount': ratingBreakdowRatingsCount,
      'ratingBreakdow_security': ratingBreakdowSecurity,
      'ratingBreakdow_staff': ratingBreakdowStaff,
      'ratingBreakdow_value': ratingBreakdowValue,
      'starRating': starRating,
      'lowestDormPricePerNight_value': lowestDormPricePerNightValue,
      'lowestPrivatePricePerNight_value': lowestPrivatePricePerNightValue,
      'overallRating_overall': overallRatingOverall,
      'distance_value': distanceValue,
      'latitude': latitude,
      'longitude': longitude,
      'district_id': districtId,
      'overallRating_numberOfRatings': overallRatingNumberOfRatings,
      'lowestPricePerNight_value': lowestPricePerNightValue,
      'city_id': cityId,
      'city_name': cityName,
      'city_idCountry': cityIdCountry,
      'city_country': cityCountry,
      'region_id': regionId,
      'region_name': regionName,
      'hbid': hbid,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class HostelDatav2RecordDocumentEquality
    implements Equality<HostelDatav2Record> {
  const HostelDatav2RecordDocumentEquality();

  @override
  bool equals(HostelDatav2Record? e1, HostelDatav2Record? e2) {
    const listEquality = ListEquality();
    return e1?.address1 == e2?.address1 &&
        e1?.address2 == e2?.address2 &&
        e1?.distanceUnits == e2?.distanceUnits &&
        e1?.districtName == e2?.districtName &&
        e1?.fenceDistance == e2?.fenceDistance &&
        e1?.freeCancellationAvailable == e2?.freeCancellationAvailable &&
        e1?.freeCancellationAvailableUntil ==
            e2?.freeCancellationAvailableUntil &&
        e1?.freeCancellationDescription == e2?.freeCancellationDescription &&
        e1?.freeCancellationLabel == e2?.freeCancellationLabel &&
        e1?.hostelworldRecommends == e2?.hostelworldRecommends &&
        e1?.hwExtra == e2?.hwExtra &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.imagesGalleryUrl, e2?.imagesGalleryUrl) &&
        listEquality.equals(e1?.imagesUrl, e2?.imagesUrl) &&
        e1?.isElevate == e2?.isElevate &&
        e1?.isFeatured == e2?.isFeatured &&
        e1?.isNew == e2?.isNew &&
        e1?.isPromoted == e2?.isPromoted &&
        e1?.lowestDormPricePerNightCurrency ==
            e2?.lowestDormPricePerNightCurrency &&
        e1?.lowestPricePerNightCurrency == e2?.lowestPricePerNightCurrency &&
        e1?.name == e2?.name &&
        e1?.overview == e2?.overview &&
        e1?.position == e2?.position &&
        e1?.ratingBreakdownAverage == e2?.ratingBreakdownAverage &&
        e1?.ratingBreakdowClean == e2?.ratingBreakdowClean &&
        e1?.ratingBreakdowFacilities == e2?.ratingBreakdowFacilities &&
        e1?.ratingBreakdowFun == e2?.ratingBreakdowFun &&
        e1?.ratingBreakdowLocation == e2?.ratingBreakdowLocation &&
        e1?.ratingBreakdowRatingsCount == e2?.ratingBreakdowRatingsCount &&
        e1?.ratingBreakdowSecurity == e2?.ratingBreakdowSecurity &&
        e1?.ratingBreakdowStaff == e2?.ratingBreakdowStaff &&
        e1?.ratingBreakdowValue == e2?.ratingBreakdowValue &&
        e1?.starRating == e2?.starRating &&
        e1?.lowestDormPricePerNightValue == e2?.lowestDormPricePerNightValue &&
        e1?.lowestPrivatePricePerNightValue ==
            e2?.lowestPrivatePricePerNightValue &&
        e1?.overallRatingOverall == e2?.overallRatingOverall &&
        e1?.distanceValue == e2?.distanceValue &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.districtId == e2?.districtId &&
        e1?.overallRatingNumberOfRatings == e2?.overallRatingNumberOfRatings &&
        e1?.lowestPricePerNightValue == e2?.lowestPricePerNightValue &&
        e1?.cityId == e2?.cityId &&
        e1?.cityName == e2?.cityName &&
        e1?.cityIdCountry == e2?.cityIdCountry &&
        e1?.cityCountry == e2?.cityCountry &&
        e1?.regionId == e2?.regionId &&
        e1?.regionName == e2?.regionName &&
        listEquality.equals(e1?.facilitiesSummary, e2?.facilitiesSummary) &&
        e1?.hbid == e2?.hbid &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.hosteladmin, e2?.hosteladmin);
  }

  @override
  int hash(HostelDatav2Record? e) => const ListEquality().hash([
        e?.address1,
        e?.address2,
        e?.distanceUnits,
        e?.districtName,
        e?.fenceDistance,
        e?.freeCancellationAvailable,
        e?.freeCancellationAvailableUntil,
        e?.freeCancellationDescription,
        e?.freeCancellationLabel,
        e?.hostelworldRecommends,
        e?.hwExtra,
        e?.id,
        e?.imagesGalleryUrl,
        e?.imagesUrl,
        e?.isElevate,
        e?.isFeatured,
        e?.isNew,
        e?.isPromoted,
        e?.lowestDormPricePerNightCurrency,
        e?.lowestPricePerNightCurrency,
        e?.name,
        e?.overview,
        e?.position,
        e?.ratingBreakdownAverage,
        e?.ratingBreakdowClean,
        e?.ratingBreakdowFacilities,
        e?.ratingBreakdowFun,
        e?.ratingBreakdowLocation,
        e?.ratingBreakdowRatingsCount,
        e?.ratingBreakdowSecurity,
        e?.ratingBreakdowStaff,
        e?.ratingBreakdowValue,
        e?.starRating,
        e?.lowestDormPricePerNightValue,
        e?.lowestPrivatePricePerNightValue,
        e?.overallRatingOverall,
        e?.distanceValue,
        e?.latitude,
        e?.longitude,
        e?.districtId,
        e?.overallRatingNumberOfRatings,
        e?.lowestPricePerNightValue,
        e?.cityId,
        e?.cityName,
        e?.cityIdCountry,
        e?.cityCountry,
        e?.regionId,
        e?.regionName,
        e?.facilitiesSummary,
        e?.hbid,
        e?.type,
        e?.hosteladmin
      ]);

  @override
  bool isValidKey(Object? o) => o is HostelDatav2Record;
}
