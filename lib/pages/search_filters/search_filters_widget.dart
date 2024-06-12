import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'search_filters_model.dart';
export 'search_filters_model.dart';

class SearchFiltersWidget extends StatefulWidget {
  const SearchFiltersWidget({super.key});

  @override
  State<SearchFiltersWidget> createState() => _SearchFiltersWidgetState();
}

class _SearchFiltersWidgetState extends State<SearchFiltersWidget>
    with TickerProviderStateMixin {
  late SearchFiltersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchFiltersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchFilters'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_FILTERS_SearchFilters_ON_INIT_STA');
      logFirebaseEvent('SearchFilters_google_analytics_event');
      logFirebaseEvent('searchfilters');
    });

    _model.textField2SearchTextController ??=
        TextEditingController(text: FFAppState().SearchedPlace);
    _model.textField2SearchFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 72.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 60.0.ms,
            begin: const Offset(0.0, 94.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 60.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('SEARCH_FILTERS_arrow_back_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(
                'Mainpage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'xj9bwka0' /* Home */,
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Urbanist',
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            if (FFAppState().counter2 == 0)
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _model.textField2SearchTextController,
                              focusNode: _model.textField2SearchFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textField2SearchTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  logFirebaseEvent(
                                      'SEARCH_FILTERS_TextField2Search_ON_TEXTF');
                                  logFirebaseEvent(
                                      'TextField2Search_algolia_search');
                                  safeSetState(
                                      () => _model.algoliaSearchResults = null);
                                  await CityRecord.search(
                                    term: _model
                                        .textField2SearchTextController.text,
                                    maxResults: 4,
                                  )
                                      .then((r) =>
                                          _model.algoliaSearchResults = r)
                                      .onError((_, __) =>
                                          _model.algoliaSearchResults = [])
                                      .whenComplete(() => setState(() {}));

                                  logFirebaseEvent(
                                      'TextField2Search_update_page_state');
                                  _model.cItySearchFlag = true;
                                },
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: FFLocalizations.of(context).getText(
                                  '96mis4f6' /* Find destinations... */,
                                ),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'jino6ajr' /* Beach, mountains, long strolls... */,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 16.0,
                                ),
                                suffixIcon: _model
                                        .textField2SearchTextController!
                                        .text
                                        .isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textField2SearchTextController
                                              ?.clear();
                                          logFirebaseEvent(
                                              'SEARCH_FILTERS_TextField2Search_ON_TEXTF');
                                          logFirebaseEvent(
                                              'TextField2Search_algolia_search');
                                          safeSetState(() => _model
                                              .algoliaSearchResults = null);
                                          await CityRecord.search(
                                            term: _model
                                                .textField2SearchTextController
                                                .text,
                                            maxResults: 4,
                                          )
                                              .then((r) => _model
                                                  .algoliaSearchResults = r)
                                              .onError((_, __) => _model
                                                  .algoliaSearchResults = [])
                                              .whenComplete(
                                                  () => setState(() {}));

                                          logFirebaseEvent(
                                              'TextField2Search_update_page_state');
                                          _model.cItySearchFlag = true;
                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .textField2SearchTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.cItySearchFlag)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (_model.algoliaSearchResults == null) {
                              return Center(
                                child: SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: SpinKitThreeBounce(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 25.0,
                                  ),
                                ),
                              );
                            }
                            final algoliaresults =
                                (_model.algoliaSearchResults?.toList() ?? [])
                                    .take(4)
                                    .toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: algoliaresults.length,
                              itemBuilder: (context, algoliaresultsIndex) {
                                final algoliaresultsItem =
                                    algoliaresults[algoliaresultsIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCH_FILTERS_PAGE_ListTileCity_ON_TAP');
                                    logFirebaseEvent(
                                        'ListTileCity_update_app_state');
                                    FFAppState().SearchedPlace =
                                        algoliaresultsItem.cityName;
                                    logFirebaseEvent(
                                        'ListTileCity_update_app_state');
                                    FFAppState().counter2 = 1;
                                    setState(() {});
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.location_on_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    title: Text(
                                      algoliaresultsItem.cityName,
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    subtitle: Text(
                                      algoliaresultsItem.cityCountry,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    if (!_model.cItySearchFlag)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            CityRecord>(
                          pagingController:
                              _model.setCityRecommedationController(
                            CityRecord.collection,
                          ),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<CityRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              ),
                            ),
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: SpinKitThreeBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, cityRecommedationIndex) {
                              final cityRecommedationCityRecord = _model
                                  .cityRecommedationPagingController!
                                  .itemList![cityRecommedationIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_FILTERS_PAGE_ListTileCity_ON_TAP');
                                  logFirebaseEvent(
                                      'ListTileCity_update_app_state');
                                  FFAppState().SearchedPlace =
                                      cityRecommedationCityRecord.cityName;
                                  logFirebaseEvent(
                                      'ListTileCity_update_app_state');
                                  FFAppState().counter2 = 1;
                                  setState(() {});
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.location_on_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  title: Text(
                                    cityRecommedationCityRecord.cityName,
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  subtitle: Text(
                                    cityRecommedationCityRecord.cityCountry,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  dense: false,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Color(0x55000000),
                      offset: Offset(
                        0.0,
                        -1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  shape: BoxShape.rectangle,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'SEARCH_FILTERS_PAGE_Text_g48gazk7_ON_TAP');
                        logFirebaseEvent('Text_reset_form_fields');
                        setState(() {
                          _model.textField2SearchTextController?.text =
                              FFAppState().SearchedPlace;
                        });
                        logFirebaseEvent('Text_update_app_state');
                        FFAppState().counter2 = 0;
                        setState(() {});
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '5iry0xwg' /* Clear all */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).dark600,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'SEARCH_FILTERS_PAGE_SEARCH_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'searchProperties',
                          queryParameters: {
                            'searchTerm': serializeParam(
                              FFAppState().SearchedPlace,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        'p9xrhtwk' /* Search  */,
                      ),
                      icon: const Icon(
                        Icons.search_sharp,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 150.0,
                        height: 45.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            if (FFAppState().counter2 == 1)
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'y30g058r' /* When's Your trip ? */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Rubik',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.44,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFCFD4DB),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 5.0, 12.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFAppState().startDate,
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: const Color(0xFF57636C),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        const Icon(
                                          Icons.date_range_outlined,
                                          color: Color(0xFF57636C),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.44,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: const Color(0xFFCFD4DB),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 5.0, 12.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFAppState().endDate,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: const Color(0xFF57636C),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      const Icon(
                                        Icons.date_range_outlined,
                                        color: Color(0xFF57636C),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.98,
                          height: 60.0,
                          child: custom_widgets.DateWidget(
                            width: MediaQuery.sizeOf(context).width * 0.98,
                            height: 60.0,
                            updatepagedate: () async {
                              logFirebaseEvent(
                                  'SEARCH_FILTERS_Container_xpqqh3sn_CALLBA');
                              logFirebaseEvent('DateWidget_update_page_state');

                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (FFAppState().counter2 == 1)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '92wjyibx' /* Guests : */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 150.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: const Color(0xFF9E9E9E),
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowCountController(
                                decrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.minus,
                                  color: enabled
                                      ? const Color(0xDD000000)
                                      : const Color(0xFFEEEEEE),
                                  size: 20.0,
                                ),
                                incrementIconBuilder: (enabled) => FaIcon(
                                  FontAwesomeIcons.plus,
                                  color:
                                      enabled ? Colors.blue : const Color(0xFFEEEEEE),
                                  size: 20.0,
                                ),
                                countBuilder: (count) => Text(
                                  count.toString(),
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                count: _model.countControllerValue ??=
                                    FFAppState().MembersVariable,
                                updateCount: (count) async {
                                  setState(() =>
                                      _model.countControllerValue = count);
                                  logFirebaseEvent(
                                      'SEARCH_FILTERS_CountController_9nah98au_');
                                  logFirebaseEvent(
                                      'CountController_update_app_state');
                                  FFAppState().MembersVariable =
                                      _model.countControllerValue!;
                                },
                                stepSize: 1,
                                minimum: 1,
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                ],
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ],
        ),
      ),
    );
  }
}
