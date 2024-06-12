import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cardNumber =
          await secureStorage.getString('ff_cardNumber') ?? _cardNumber;
    });
    await _safeInitAsync(() async {
      _cardHolderName =
          await secureStorage.getString('ff_cardHolderName') ?? _cardHolderName;
    });
    await _safeInitAsync(() async {
      _cardName = await secureStorage.getString('ff_cardName') ?? _cardName;
    });
    await _safeInitAsync(() async {
      _zipCode = await secureStorage.getString('ff_zipCode') ?? _zipCode;
    });
    await _safeInitAsync(() async {
      _SearchedPlace =
          await secureStorage.getString('ff_SearchedPlace') ?? _SearchedPlace;
    });
    await _safeInitAsync(() async {
      _MembersVariable =
          await secureStorage.getInt('ff_MembersVariable') ?? _MembersVariable;
    });
    await _safeInitAsync(() async {
      _startDate = await secureStorage.getString('ff_startDate') ?? _startDate;
    });
    await _safeInitAsync(() async {
      _endDate = await secureStorage.getString('ff_endDate') ?? _endDate;
    });
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _phonenumber =
          await secureStorage.getInt('ff_phonenumber') ?? _phonenumber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _cardNumber = '';
  String get cardNumber => _cardNumber;
  set cardNumber(String value) {
    _cardNumber = value;
    secureStorage.setString('ff_cardNumber', value);
  }

  void deleteCardNumber() {
    secureStorage.delete(key: 'ff_cardNumber');
  }

  String _cardHolderName = '';
  String get cardHolderName => _cardHolderName;
  set cardHolderName(String value) {
    _cardHolderName = value;
    secureStorage.setString('ff_cardHolderName', value);
  }

  void deleteCardHolderName() {
    secureStorage.delete(key: 'ff_cardHolderName');
  }

  String _cardName = '';
  String get cardName => _cardName;
  set cardName(String value) {
    _cardName = value;
    secureStorage.setString('ff_cardName', value);
  }

  void deleteCardName() {
    secureStorage.delete(key: 'ff_cardName');
  }

  String _zipCode = '';
  String get zipCode => _zipCode;
  set zipCode(String value) {
    _zipCode = value;
    secureStorage.setString('ff_zipCode', value);
  }

  void deleteZipCode() {
    secureStorage.delete(key: 'ff_zipCode');
  }

  String _SearchedPlace = '';
  String get SearchedPlace => _SearchedPlace;
  set SearchedPlace(String value) {
    _SearchedPlace = value;
    secureStorage.setString('ff_SearchedPlace', value);
  }

  void deleteSearchedPlace() {
    secureStorage.delete(key: 'ff_SearchedPlace');
  }

  int _MembersVariable = 1;
  int get MembersVariable => _MembersVariable;
  set MembersVariable(int value) {
    _MembersVariable = value;
    secureStorage.setInt('ff_MembersVariable', value);
  }

  void deleteMembersVariable() {
    secureStorage.delete(key: 'ff_MembersVariable');
  }

  int _counter2 = 0;
  int get counter2 => _counter2;
  set counter2(int value) {
    _counter2 = value;
  }

  List<String> _property = [];
  List<String> get property => _property;
  set property(List<String> value) {
    _property = value;
  }

  void addToProperty(String value) {
    _property.add(value);
  }

  void removeFromProperty(String value) {
    _property.remove(value);
  }

  void removeAtIndexFromProperty(int index) {
    _property.removeAt(index);
  }

  void updatePropertyAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _property[index] = updateFn(_property[index]);
  }

  void insertAtIndexInProperty(int index, String value) {
    _property.insert(index, value);
  }

  List<String> _facilities = [];
  List<String> get facilities => _facilities;
  set facilities(List<String> value) {
    _facilities = value;
  }

  void addToFacilities(String value) {
    _facilities.add(value);
  }

  void removeFromFacilities(String value) {
    _facilities.remove(value);
  }

  void removeAtIndexFromFacilities(int index) {
    _facilities.removeAt(index);
  }

  void updateFacilitiesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _facilities[index] = updateFn(_facilities[index]);
  }

  void insertAtIndexInFacilities(int index, String value) {
    _facilities.insert(index, value);
  }

  int _ratingfilter = 1;
  int get ratingfilter => _ratingfilter;
  set ratingfilter(int value) {
    _ratingfilter = value;
  }

  List<String> _Roomtypefilter = [];
  List<String> get Roomtypefilter => _Roomtypefilter;
  set Roomtypefilter(List<String> value) {
    _Roomtypefilter = value;
  }

  void addToRoomtypefilter(String value) {
    _Roomtypefilter.add(value);
  }

  void removeFromRoomtypefilter(String value) {
    _Roomtypefilter.remove(value);
  }

  void removeAtIndexFromRoomtypefilter(int index) {
    _Roomtypefilter.removeAt(index);
  }

  void updateRoomtypefilterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Roomtypefilter[index] = updateFn(_Roomtypefilter[index]);
  }

  void insertAtIndexInRoomtypefilter(int index, String value) {
    _Roomtypefilter.insert(index, value);
  }

  int _pricefilter = 0;
  int get pricefilter => _pricefilter;
  set pricefilter(int value) {
    _pricefilter = value;
  }

  String _startDate = '';
  String get startDate => _startDate;
  set startDate(String value) {
    _startDate = value;
    secureStorage.setString('ff_startDate', value);
  }

  void deleteStartDate() {
    secureStorage.delete(key: 'ff_startDate');
  }

  String _endDate = '';
  String get endDate => _endDate;
  set endDate(String value) {
    _endDate = value;
    secureStorage.setString('ff_endDate', value);
  }

  void deleteEndDate() {
    secureStorage.delete(key: 'ff_endDate');
  }

  double _price = 0.0;
  double get price => _price;
  set price(double value) {
    _price = value;
  }

  List<StayruleDataStruct> _bookeddetails = [];
  List<StayruleDataStruct> get bookeddetails => _bookeddetails;
  set bookeddetails(List<StayruleDataStruct> value) {
    _bookeddetails = value;
  }

  void addToBookeddetails(StayruleDataStruct value) {
    _bookeddetails.add(value);
  }

  void removeFromBookeddetails(StayruleDataStruct value) {
    _bookeddetails.remove(value);
  }

  void removeAtIndexFromBookeddetails(int index) {
    _bookeddetails.removeAt(index);
  }

  void updateBookeddetailsAtIndex(
    int index,
    StayruleDataStruct Function(StayruleDataStruct) updateFn,
  ) {
    _bookeddetails[index] = updateFn(_bookeddetails[index]);
  }

  void insertAtIndexInBookeddetails(int index, StayruleDataStruct value) {
    _bookeddetails.insert(index, value);
  }

  int _NumofNights = 1;
  int get NumofNights => _NumofNights;
  set NumofNights(int value) {
    _NumofNights = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  int _phonenumber = 0;
  int get phonenumber => _phonenumber;
  set phonenumber(int value) {
    _phonenumber = value;
    secureStorage.setInt('ff_phonenumber', value);
  }

  void deletePhonenumber() {
    secureStorage.delete(key: 'ff_phonenumber');
  }

  bool _isCacheOverride = false;
  bool get isCacheOverride => _isCacheOverride;
  set isCacheOverride(bool value) {
    _isCacheOverride = value;
  }

  DateTime? _lastcacheTime;
  DateTime? get lastcacheTime => _lastcacheTime;
  set lastcacheTime(DateTime? value) {
    _lastcacheTime = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
