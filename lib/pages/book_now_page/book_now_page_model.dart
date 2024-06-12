import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/dorms/dorms_widget.dart';
import '/components/soldout/soldout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'book_now_page_widget.dart' show BookNowPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BookNowPageModel extends FlutterFlowModel<BookNowPageWidget> {
  ///  Local state fields for this page.

  int bookingCounter = 0;

  List<String> ss = [];
  void addToSs(String item) => ss.add(item);
  void removeFromSs(String item) => ss.remove(item);
  void removeAtIndexFromSs(int index) => ss.removeAt(index);
  void insertAtIndexInSs(int index, String item) => ss.insert(index, item);
  void updateSsAtIndex(int index, Function(String) updateFn) =>
      ss[index] = updateFn(ss[index]);

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for Dorms dynamic component.
  late FlutterFlowDynamicModels<DormsModel> dormsModels1;
  // Models for Dorms dynamic component.
  late FlutterFlowDynamicModels<DormsModel> dormsModels2;
  // Model for soldout component.
  late SoldoutModel soldoutModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? propertychat;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newchathostelthread;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TripsRecord? newTripWeb;
  // Stores action output result for [Backend Call - API (TelegramBooking)] action in Button widget.
  ApiCallResponse? telegramAPIWeb;
  // Stores action output result for [Razorpay Payment] action in Button widget.
  String? razorpayPaymentId;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TripsRecord? newTrip;
  // Stores action output result for [Backend Call - API (TelegramBooking)] action in Button widget.
  ApiCallResponse? telegramAPI;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? chathostelref2;

  @override
  void initState(BuildContext context) {
    dormsModels1 = FlutterFlowDynamicModels(() => DormsModel());
    dormsModels2 = FlutterFlowDynamicModels(() => DormsModel());
    soldoutModel = createModel(context, () => SoldoutModel());
  }

  @override
  void dispose() {
    dormsModels1.dispose();
    dormsModels2.dispose();
    soldoutModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
