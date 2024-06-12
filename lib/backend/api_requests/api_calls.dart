import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BookinformationCall {
  static Future<ApiCallResponse> call({
    String? userName = 'null',
    String? checkin = '',
    String? checkout = '',
    int? members = 1,
    String? url = '',
    String? type = 'HW',
    String? cityid = '',
    int? hotelid,
    String? timestamp = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'BookinformationCall',
        'variables': {
          'userName': userName,
          'checkin': checkin,
          'checkout': checkout,
          'members': members,
          'url': url,
          'type': type,
          'cityid': cityid,
          'hotelid': hotelid,
          'timestamp': timestamp,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? apiCityPictures(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].cityPicture''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? apiavgDormPrice(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].avgDormPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? apiType(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].typeofRecommedation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? apiRank(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].displayRank''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class OpenAPICall {
  static Future<ApiCallResponse> call({
    String? apiKey = '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',
    dynamic promptJson,
  }) async {
    final prompt = _serializeJson(promptJson);
    final ffApiRequestBody = '''
{
  "model": "gpt-3.5-turbo",
  "messages": $prompt
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OpenAPI',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
  static String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.role''',
      ));
  static int? createdTimestamp(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.created''',
      ));
}

class TelegramBookingCall {
  static Future<ApiCallResponse> call({
    String? message = 'Null',
    List<String>? bookingdetailsList,
  }) async {
    final bookingdetails = _serializeList(bookingdetailsList);

    return ApiManager.instance.makeApiCall(
      callName: 'TelegramBooking',
      apiUrl:
          'https://api.telegram.org/bot6336276089:AAHEgFOEEdwuolWFDuN_E1xuyTAcIdEXtWY/sendMessage?chat_id=2118302731&text=$message$bookingdetails',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
