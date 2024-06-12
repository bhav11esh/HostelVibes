import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_filters_widget.dart' show SearchFiltersWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchFiltersModel extends FlutterFlowModel<SearchFiltersWidget> {
  ///  Local state fields for this page.

  bool cItySearchFlag = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField2Search widget.
  FocusNode? textField2SearchFocusNode;
  TextEditingController? textField2SearchTextController;
  String? Function(BuildContext, String?)?
      textField2SearchTextControllerValidator;
  // Algolia Search Results from action on TextField2Search
  List<CityRecord>? algoliaSearchResults = [];
  // State field(s) for CityRecommedation widget.

  PagingController<DocumentSnapshot?, CityRecord>?
      cityRecommedationPagingController;
  Query? cityRecommedationPagingQuery;
  List<StreamSubscription?> cityRecommedationStreamSubscriptions = [];

  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textField2SearchFocusNode?.dispose();
    textField2SearchTextController?.dispose();

    for (var s in cityRecommedationStreamSubscriptions) {
      s?.cancel();
    }
    cityRecommedationPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CityRecord>
      setCityRecommedationController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    cityRecommedationPagingController ??=
        _createCityRecommedationController(query, parent);
    if (cityRecommedationPagingQuery != query) {
      cityRecommedationPagingQuery = query;
      cityRecommedationPagingController?.refresh();
    }
    return cityRecommedationPagingController!;
  }

  PagingController<DocumentSnapshot?, CityRecord>
      _createCityRecommedationController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CityRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCityRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: cityRecommedationStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
