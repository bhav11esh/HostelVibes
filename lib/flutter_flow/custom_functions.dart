import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

String? dateShow(String inputDate) {
  // take input as Date in format 23-08-2023 and convert it into 23-Aug format

  DateTime date = DateFormat('yyyy-MM-dd').parse(inputDate);
  String outputDate = DateFormat('dd MMM').format(date);
  return outputDate;
}

int? stringtoint(String? someString) {
  // convert string to int
  if (someString == null) {
    return null;
  }
  return int.tryParse(someString);
}

double minprice(
  String? price1,
  String? price2,
) {
  //   // compare 2 double , find its minimum and return. edge case 1 is null
  double? p1 = double.tryParse(price1 ?? '');
  double? p2 = double.tryParse(price2 ?? '');

  if (p1 == null && p2 == null) {
    return 0.0;
  } else if (p1 == null) {
    return p2!;
  } else if (p2 == null) {
    return p1!;
  } else {
    return math.min(p1, p2);
  }
}

DateTime? datestringdate(String? datestringtodate) {
  // convert string 2023-08-12 to datetime format
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final DateTime? dateTime = formatter.parse(datestringtodate ?? '');
  return dateTime;
}

List<dynamic>? nulllistcheck(List<dynamic>? list) {
  // if list contains json elements and if json elemrnts are empty return null element
  if (list == null) {
    return null;
  }
  for (var element in list) {
    if (element is Map && element.isEmpty) {
      return null;
    }
  }
  return list;
}

List<String>? bookinglist(
  List<String> stringList,
  List<double> doubleList,
) {
  //   // take 2 input list of string and double and concat. them  into a final list
  if (stringList.length != doubleList.length) {
    return null;
  }

  List<String> finalList = [];

  for (int i = 0; i < stringList.length; i++) {
    finalList.add('${stringList[i]}: ${doubleList[i]}');
  }

  return finalList;
}

int? datediff(
  DateTime date1,
  DateTime date2,
) {
  // Difference between date1 and date2 in days
  final difference = date1.difference(date2).inDays;
  return difference.abs();
}

String endDatePicker(
  String endDateFinal,
  int numofNights,
) {
  // input string of YYYY-MM-DD date , add variable Numofnights  and return the string in yyyy-mm-dd
  DateTime endDate = DateTime.parse(endDateFinal);
  endDate = endDate.add(Duration(days: numofNights));
  String formattedDate = DateFormat('yyyy-MM-dd').format(endDate);
  return formattedDate;
}

List<DocumentReference>? uniquedocrefence(
    List<DocumentReference>? inputlistrefuser) {
  // ouput unique list of given input document reference users
  if (inputlistrefuser == null) {
    return null;
  }
  final uniqueList = inputlistrefuser.toSet().toList();
  return uniqueList;
}

LatLng? latlongfunction(
  double? lat,
  double? long,
) {
  // take input lat and long and convert them into latlng output
  if (lat != null && long != null) {
    return LatLng(lat, long);
  } else {
    return null;
  }
}
