import '/backend/backend.dart';
import '/components/hostel_card_info/hostel_card_info_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'search_properties_model.dart';
export 'search_properties_model.dart';

class SearchPropertiesWidget extends StatefulWidget {
  const SearchPropertiesWidget({
    super.key,
    this.searchTerm,
  });

  final String? searchTerm;

  @override
  State<SearchPropertiesWidget> createState() => _SearchPropertiesWidgetState();
}

class _SearchPropertiesWidgetState extends State<SearchPropertiesWidget> {
  late SearchPropertiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPropertiesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'searchProperties'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_PROPERTIES_searchProperties_ON_IN');
      logFirebaseEvent('searchProperties_google_analytics_event');
      logFirebaseEvent('searchproperties');
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 25.0,
          ),
          onPressed: () async {
            logFirebaseEvent('SEARCH_PROPERTIES_arrow_back_rounded_ICN');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('SEARCH_PROPERTIES_Text_qdhclcyb_ON_TAP');
            logFirebaseEvent('Text_update_app_state');
            FFAppState().counter2 = 0;
            logFirebaseEvent('Text_navigate_to');

            context.pushNamed('SearchFilters');
          },
          child: Text(
            FFAppState().SearchedPlace,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PROPERTIES_Text_8dphldrz_ON_TAP');
                                  logFirebaseEvent('Text_update_app_state');
                                  FFAppState().counter2 = 1;
                                  logFirebaseEvent('Text_navigate_to');

                                  context.pushNamed('SearchFilters');
                                },
                                child: Text(
                                  '${functions.dateShow(FFAppState().startDate)}-${functions.dateShow(FFAppState().endDate)}',
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
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SEARCH_PROPERTIES_PAGE_BUTTON_BTN_ON_TAP');
                                logFirebaseEvent('Button_update_app_state');
                                FFAppState().counter2 = 1;
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('SearchFilters');
                              },
                              text: FFAppState().MembersVariable.toString(),
                              icon: Icon(
                                Icons.people_sharp,
                                color: FlutterFlowTheme.of(context).cultured,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                padding: const EdgeInsets.all(0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Flexible(
                              child: Opacity(
                                opacity: 0.6,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SEARCH_PROPERTIES_PAGE__BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'FIlters_for_hostel',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '9rbkfvkz' /*  */,
                                    ),
                                    icon: const Icon(
                                      Icons.filter_alt,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: PagedListView<DocumentSnapshot<Object?>?,
                    HostelDatav2Record>(
                  pagingController: _model.setListViewController(
                    HostelDatav2Record.collection.where(
                      'city_name',
                      isEqualTo: FFAppState().SearchedPlace,
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  builderDelegate:
                      PagedChildBuilderDelegate<HostelDatav2Record>(
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
                    noItemsFoundIndicatorBuilder: (_) => Image.asset(
                      'assets/images/no-results.png',
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewHostelDatav2Record = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return wrapWithModel(
                        model: _model.hostelCardInfoModels.getModel(
                          listViewHostelDatav2Record.id.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => setState(() {}),
                        child: HostelCardInfoWidget(
                          key: Key(
                            'Keyp3x_${listViewHostelDatav2Record.id.toString()}',
                          ),
                          parameter1: listViewHostelDatav2Record.imagesUrl,
                          parameter2: listViewHostelDatav2Record.name,
                          parameter3:
                              listViewHostelDatav2Record.overallRatingOverall,
                          parameter4: formatNumber(
                            listViewHostelDatav2Record
                                .overallRatingNumberOfRatings,
                            formatType: FormatType.custom,
                            format: '###',
                            locale: '',
                          ),
                          parameter5:
                              listViewHostelDatav2Record.facilitiesSummary,
                          parameter6: listViewHostelDatav2Record
                              .lowestPricePerNightValue,
                          p7: listViewHostelDatav2Record.distanceValue,
                          p8: listViewHostelDatav2Record.distanceUnits,
                          parameter9: listViewHostelDatav2Record,
                          instalink: listViewHostelDatav2Record.hwExtra,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
