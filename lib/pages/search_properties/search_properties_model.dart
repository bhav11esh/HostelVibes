import '/backend/backend.dart';
import '/components/hostel_card_info/hostel_card_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_properties_widget.dart' show SearchPropertiesWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPropertiesModel extends FlutterFlowModel<SearchPropertiesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, HostelDatav2Record>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for HostelCardInfo dynamic component.
  late FlutterFlowDynamicModels<HostelCardInfoModel> hostelCardInfoModels;

  @override
  void initState(BuildContext context) {
    hostelCardInfoModels =
        FlutterFlowDynamicModels(() => HostelCardInfoModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    hostelCardInfoModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, HostelDatav2Record> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, HostelDatav2Record>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, HostelDatav2Record>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryHostelDatav2RecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 7,
          isStream: true,
        ),
      );
  }
}
