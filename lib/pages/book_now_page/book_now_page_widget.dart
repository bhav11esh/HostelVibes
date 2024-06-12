import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/razorpay/razorpay_payment_sheet.dart';
import '/components/dorms/dorms_widget.dart';
import '/components/saveuserdetails/saveuserdetails_widget.dart';
import '/components/soldout/soldout_widget.dart';
import '/components/tn_c/tn_c_widget.dart';
import '/components/total/total_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'book_now_page_model.dart';
export 'book_now_page_model.dart';

class BookNowPageWidget extends StatefulWidget {
  const BookNowPageWidget({
    super.key,
    this.propertyDetails,
  });

  final HostelDatav2Record? propertyDetails;

  @override
  State<BookNowPageWidget> createState() => _BookNowPageWidgetState();
}

class _BookNowPageWidgetState extends State<BookNowPageWidget>
    with TickerProviderStateMixin {
  late BookNowPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookNowPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bookNowPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOK_NOW_bookNowPage_ON_INIT_STATE');
      logFirebaseEvent('bookNowPage_update_app_state');
      FFAppState().bookeddetails = [];
      FFAppState().price = 0.0;
      FFAppState().NumofNights = functions.datediff(
          functions.datestringdate(FFAppState().startDate)!,
          functions.datestringdate(FFAppState().endDate)!)!;
      setState(() {});
      logFirebaseEvent('bookNowPage_google_analytics_event');
      logFirebaseEvent(
        'BookingPage',
        parameters: {
          'user': currentUserDisplayName,
        },
      );
      logFirebaseEvent('bookNowPage_refresh_database_request');
      setState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
    });

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
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0x3A000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            buttonSize: 46.0,
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOOK_NOW_arrow_back_rounded_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.safePop();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '5oaq5pdb' /* Book Now */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOOK_NOW_PAGE_PAGE_Icon_mffezb94_ON_TAP');
                              logFirebaseEvent('Icon_share');
                              await Share.share(
                                'HostelSearch://hostel.com${GoRouterState.of(context).uri.toString()}',
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            },
                            child: FaIcon(
                              FontAwesomeIcons.shareAlt,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl: widget.propertyDetails!.imagesUrl.first,
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.propertyDetails!.name.maybeHandleOverflow(
                              maxChars: 70,
                              replacement: '…',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '${widget.propertyDetails?.address1}${widget.propertyDetails?.address2}'
                                .maybeHandleOverflow(
                              maxChars: 120,
                              replacement: '…',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend Deca',
                                      color: const Color(0xFF8B97A2),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.0,
                    indent: 12.0,
                    endIndent: 12.0,
                    color: FlutterFlowTheme.of(context).lineGray,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '4ek146tk' /* Choose Dates */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Opacity(
                        opacity: 0.0,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.98,
                            height: 60.0,
                            child: custom_widgets.DateWidget(
                              width: MediaQuery.sizeOf(context).width * 0.98,
                              height: 60.0,
                              updatepagedate: () async {
                                logFirebaseEvent(
                                    'BOOK_NOW_Container_tceyoi7g_CALLBACK');
                                logFirebaseEvent('DateWidget_update_app_state');

                                FFAppState().update(() {});
                                logFirebaseEvent(
                                    'DateWidget_refresh_database_request');
                                setState(
                                    () => _model.apiRequestCompleter = null);
                                await _model.waitForApiRequestCompleted();
                              },
                            ),
                          ),
                        ),
                      ),
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
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Guest ${FFAppState().MembersVariable.toString()}',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '${functions.dateShow(FFAppState().startDate)}-${functions.dateShow(FFAppState().endDate)}',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Rubik',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => FutureBuilder<ApiCallResponse>(
                      future: (_model.apiRequestCompleter ??=
                              Completer<ApiCallResponse>()
                                ..complete(BookinformationCall.call(
                                  userName: currentUserDisplayName,
                                  checkin: FFAppState().startDate,
                                  checkout: FFAppState().endDate,
                                  members: FFAppState().MembersVariable,
                                  url: widget.propertyDetails?.hbid,
                                  type: 'HW',
                                  cityid: widget.propertyDetails?.cityId
                                      .toString(),
                                  hotelid: widget.propertyDetails?.id,
                                  timestamp: getCurrentTimestamp.toString(),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
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
                        final containerBookinformationResponse = snapshot.data!;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              if (containerBookinformationResponse.statusCode ==
                                  200) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Builder(
                                        builder: (context) {
                                          final cc = getJsonField(
                                            containerBookinformationResponse
                                                .jsonBody,
                                            r'''$.rooms.dorms''',
                                          ).toList();
                                          if (cc.isEmpty) {
                                            return const SizedBox(
                                              width: 150.0,
                                              child: SoldoutWidget(
                                                distext: 'Dorms Sold Out',
                                              ),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: cc.length,
                                            itemBuilder: (context, ccIndex) {
                                              final ccItem = cc[ccIndex];
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: wrapWithModel(
                                                    model: _model.dormsModels1
                                                        .getModel(
                                                      ccIndex.toString(),
                                                      ccIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: DormsWidget(
                                                      key: Key(
                                                        'Keycyu_${ccIndex.toString()}',
                                                      ),
                                                      cardRoom: ccItem,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Builder(
                                        builder: (context) {
                                          final ccp = getJsonField(
                                            containerBookinformationResponse
                                                .jsonBody,
                                            r'''$.rooms.privates''',
                                          ).toList();
                                          if (ccp.isEmpty) {
                                            return const SizedBox(
                                              width: 150.0,
                                              child: SoldoutWidget(
                                                distext:
                                                    'Private Room Sold Out',
                                              ),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: ccp.length,
                                            itemBuilder: (context, ccpIndex) {
                                              final ccpItem = ccp[ccpIndex];
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: wrapWithModel(
                                                    model: _model.dormsModels2
                                                        .getModel(
                                                      ccpIndex.toString(),
                                                      ccpIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: DormsWidget(
                                                      key: Key(
                                                        'Keyl5l_${ccpIndex.toString()}',
                                                      ),
                                                      cardRoom: ccpItem,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: wrapWithModel(
                                    model: _model.soldoutModel,
                                    updateCallback: () => setState(() {}),
                                    child: const SoldoutWidget(
                                      distext:
                                          'There is no availability on your selected dates',
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'dbzkwcw2' /* Base Price */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              formatNumber(
                                FFAppState().price * FFAppState().NumofNights,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: 'Rs ',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'otvjm0p2' /* Taxes */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'uangb8yq' /* 0% */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qxve35mg' /* Service Fee */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF8B97A2),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'j11u29hm' /* 0%  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'yc552tdz' /* Total */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 36.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.infoCircle,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'BOOK_NOW_PAGE_PAGE_infoCircle_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: const Color(0xB3000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.7,
                                            child: const TotalWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ],
                            ),
                            Flexible(
                              child: Text(
                                formatNumber(
                                  FFAppState().price * FFAppState().NumofNights,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'Rs ',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2bcoiuzo' /* Terms and Conditions */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 36.0,
                                  icon: Icon(
                                    Icons.info_outlined,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 18.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'BOOK_NOW_info_outlined_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: const Color(0xB3000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const SizedBox(
                                            height: 670.0,
                                            child: TnCWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (FFAppState().bookeddetails.isNotEmpty)
            StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
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
                final bottomButtonAreaUsersRecord = snapshot.data!;
                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4B39EF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7.0,
                        color: Color(0x55000000),
                        offset: Offset(
                          0.0,
                          -1.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('BOOK_NOW_RESERVE_NOW_BTN_ON_TAP');
                            if (!((bottomButtonAreaUsersRecord.phoneNumber !=
                                        '') &&
                                (bottomButtonAreaUsersRecord.email != '') &&
                                (bottomButtonAreaUsersRecord.displayName !=
                                        '') &&
                                (bottomButtonAreaUsersRecord.age != null))) {
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SaveuserdetailsWidget(
                                      docUser:
                                          bottomButtonAreaUsersRecord.reference,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                            logFirebaseEvent('Button_firestore_query');
                            _model.propertychat = await queryChatsRecordOnce(
                              queryBuilder: (chatsRecord) => chatsRecord.where(
                                'group_chat_id',
                                isEqualTo: widget.propertyDetails?.id,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (!(_model.propertychat?.reference != null)) {
                              // newChat
                              logFirebaseEvent('Button_newChat');

                              var chatsRecordReference =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference.set({
                                ...createChatsRecordData(
                                  userA: widget
                                      .propertyDetails?.hosteladmin.first,
                                  lastMessage:
                                      'Community Chat ${widget.propertyDetails?.name}',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: widget
                                      .propertyDetails?.hosteladmin.first,
                                  groupChatId: widget.propertyDetails?.id,
                                  groupName: widget.propertyDetails?.name,
                                  userB: widget
                                      .propertyDetails?.hosteladmin.first,
                                ),
                                ...mapToFirestore(
                                  {
                                    'users':
                                        widget.propertyDetails?.hosteladmin,
                                  },
                                ),
                              });
                              _model.newchathostelthread =
                                  ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  userA: widget
                                      .propertyDetails?.hosteladmin.first,
                                  lastMessage:
                                      'Community Chat ${widget.propertyDetails?.name}',
                                  lastMessageTime: getCurrentTimestamp,
                                  lastMessageSentBy: widget
                                      .propertyDetails?.hosteladmin.first,
                                  groupChatId: widget.propertyDetails?.id,
                                  groupName: widget.propertyDetails?.name,
                                  userB: widget
                                      .propertyDetails?.hosteladmin.first,
                                ),
                                ...mapToFirestore(
                                  {
                                    'users':
                                        widget.propertyDetails?.hosteladmin,
                                  },
                                ),
                              }, chatsRecordReference);
                            }
                            if (isWeb) {
                              logFirebaseEvent('Button_backend_call');

                              var tripsRecordReference1 =
                                  TripsRecord.collection.doc();
                              await tripsRecordReference1.set({
                                ...createTripsRecordData(
                                  userRef: currentUserReference,
                                  tripBeginDate: functions
                                      .datestringdate(FFAppState().startDate),
                                  tripEndDate: functions
                                      .datestringdate(FFAppState().endDate),
                                  paymentMethod: 'Mastercard •••• 3021',
                                  tripCreated: getCurrentTimestamp,
                                  guests: FFAppState().MembersVariable,
                                  tripTotal: (FFAppState().price *
                                          FFAppState().NumofNights)
                                      .toInt(),
                                  cancelTrip: false,
                                  upcoming: true,
                                  tripCost: FFAppState().price *
                                      FFAppState().NumofNights,
                                  propertyRef:
                                      widget.propertyDetails?.reference,
                                  host: widget
                                      .propertyDetails?.hosteladmin.first,
                                  complete: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'BookingDetail':
                                        getStayruleDataListFirestoreData(
                                      FFAppState().bookeddetails,
                                    ),
                                  },
                                ),
                              });
                              _model.newTripWeb =
                                  TripsRecord.getDocumentFromData({
                                ...createTripsRecordData(
                                  userRef: currentUserReference,
                                  tripBeginDate: functions
                                      .datestringdate(FFAppState().startDate),
                                  tripEndDate: functions
                                      .datestringdate(FFAppState().endDate),
                                  paymentMethod: 'Mastercard •••• 3021',
                                  tripCreated: getCurrentTimestamp,
                                  guests: FFAppState().MembersVariable,
                                  tripTotal: (FFAppState().price *
                                          FFAppState().NumofNights)
                                      .toInt(),
                                  cancelTrip: false,
                                  upcoming: true,
                                  tripCost: FFAppState().price *
                                      FFAppState().NumofNights,
                                  propertyRef:
                                      widget.propertyDetails?.reference,
                                  host: widget
                                      .propertyDetails?.hosteladmin.first,
                                  complete: false,
                                ),
                                ...mapToFirestore(
                                  {
                                    'BookingDetail':
                                        getStayruleDataListFirestoreData(
                                      FFAppState().bookeddetails,
                                    ),
                                  },
                                ),
                              }, tripsRecordReference1);
                              logFirebaseEvent('Button_backend_call');
                              _model.telegramAPIWeb =
                                  await TelegramBookingCall.call(
                                message:
                                    '${'  Name:$currentUserDisplayName   number:$currentPhoneNumber  Age:${valueOrDefault(currentUserDocument?.age, 0).toString()} Email: $currentUserEmail'}${'  Datefrom: ${dateTimeFormat(
                                  'yMMMd',
                                  functions
                                      .datestringdate(FFAppState().startDate),
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )}  to ${dateTimeFormat(
                                  'yMMMd',
                                  functions
                                      .datestringdate(FFAppState().endDate),
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                )} Num of nights :  ${FFAppState().NumofNights.toString()}'}${'  Property: ${widget.propertyDetails?.name}   City:${widget.propertyDetails?.cityName}'}${'   BookingPrice -> ${formatNumber(
                                  FFAppState().price * FFAppState().NumofNights,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'Rs ',
                                )}'}',
                                bookingdetailsList: functions.bookinglist(
                                    FFAppState()
                                        .bookeddetails
                                        .map((e) => e.type)
                                        .toList(),
                                    FFAppState()
                                        .bookeddetails
                                        .map((e) => e.price)
                                        .toList()),
                              );
                              logFirebaseEvent('Button_google_analytics_event');
                              logFirebaseEvent(
                                'Booked',
                                parameters: {
                                  'Button': true,
                                },
                              );
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Your book has been successfully booked!',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).turquoise,
                                ),
                              );
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed(
                                'tripDetails',
                                queryParameters: {
                                  'tripRef': serializeParam(
                                    _model.newTripWeb,
                                    ParamType.Document,
                                  ),
                                  'propertyRef': serializeParam(
                                    widget.propertyDetails,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'tripRef': _model.newTripWeb,
                                  'propertyRef': widget.propertyDetails,
                                },
                              );
                            } else {
                              logFirebaseEvent('Button_razorpay_payment');
                              await processRazorpayPayment(
                                context,
                                amount: (FFAppState().price *
                                        FFAppState().NumofNights *
                                        100)
                                    .round(),
                                currency: 'INR',
                                description: 'Reservation Amount',
                                userName:
                                    bottomButtonAreaUsersRecord.displayName,
                                userEmail: bottomButtonAreaUsersRecord.email,
                                userContact:
                                    bottomButtonAreaUsersRecord.phoneNumber,
                                onReceivedResponse: (paymentId) => safeSetState(
                                    () => _model.razorpayPaymentId = paymentId),
                              );

                              if (_model.razorpayPaymentId != null &&
                                  _model.razorpayPaymentId != '') {
                                logFirebaseEvent('Button_backend_call');

                                var tripsRecordReference2 =
                                    TripsRecord.collection.doc();
                                await tripsRecordReference2.set({
                                  ...createTripsRecordData(
                                    userRef: currentUserReference,
                                    tripBeginDate: functions
                                        .datestringdate(FFAppState().startDate),
                                    tripEndDate: functions
                                        .datestringdate(FFAppState().endDate),
                                    paymentMethod: 'Mastercard •••• 3021',
                                    tripCreated: getCurrentTimestamp,
                                    guests: FFAppState().MembersVariable,
                                    tripTotal: (FFAppState().price *
                                            FFAppState().NumofNights)
                                        .toInt(),
                                    cancelTrip: false,
                                    upcoming: true,
                                    tripCost: FFAppState().price *
                                        FFAppState().NumofNights,
                                    propertyRef:
                                        widget.propertyDetails?.reference,
                                    host: currentUserReference,
                                    complete: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'BookingDetail':
                                          getStayruleDataListFirestoreData(
                                        FFAppState().bookeddetails,
                                      ),
                                    },
                                  ),
                                });
                                _model.newTrip =
                                    TripsRecord.getDocumentFromData({
                                  ...createTripsRecordData(
                                    userRef: currentUserReference,
                                    tripBeginDate: functions
                                        .datestringdate(FFAppState().startDate),
                                    tripEndDate: functions
                                        .datestringdate(FFAppState().endDate),
                                    paymentMethod: 'Mastercard •••• 3021',
                                    tripCreated: getCurrentTimestamp,
                                    guests: FFAppState().MembersVariable,
                                    tripTotal: (FFAppState().price *
                                            FFAppState().NumofNights)
                                        .toInt(),
                                    cancelTrip: false,
                                    upcoming: true,
                                    tripCost: FFAppState().price *
                                        FFAppState().NumofNights,
                                    propertyRef:
                                        widget.propertyDetails?.reference,
                                    host: currentUserReference,
                                    complete: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'BookingDetail':
                                          getStayruleDataListFirestoreData(
                                        FFAppState().bookeddetails,
                                      ),
                                    },
                                  ),
                                }, tripsRecordReference2);
                                logFirebaseEvent('Button_backend_call');
                                _model.telegramAPI =
                                    await TelegramBookingCall.call(
                                  message:
                                      '${'  user:${bottomButtonAreaUsersRecord.displayName}   number:${bottomButtonAreaUsersRecord.phoneNumber}'}${'  Datefrom: ${dateTimeFormat(
                                    'yMMMd',
                                    functions
                                        .datestringdate(FFAppState().startDate),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}  to ${dateTimeFormat(
                                    'yMMMd',
                                    functions
                                        .datestringdate(FFAppState().endDate),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )} Num of nights :  ${FFAppState().NumofNights.toString()}'}${'  Property: ${widget.propertyDetails?.name}   City:${widget.propertyDetails?.cityName}'}${'   BookingPrice -> ${formatNumber(
                                    FFAppState().price *
                                        FFAppState().NumofNights,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: 'Rs ',
                                  )}'}',
                                  bookingdetailsList: functions.bookinglist(
                                      FFAppState()
                                          .bookeddetails
                                          .map((e) => e.type)
                                          .toList(),
                                      FFAppState()
                                          .bookeddetails
                                          .map((e) => e.price)
                                          .toList()),
                                );
                                logFirebaseEvent(
                                    'Button_google_analytics_event');
                                logFirebaseEvent(
                                  'Booked',
                                  parameters: {
                                    'Button': true,
                                  },
                                );
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Your book has been successfully booked!',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 800),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).turquoise,
                                  ),
                                );
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamed(
                                  'tripDetails',
                                  queryParameters: {
                                    'tripRef': serializeParam(
                                      _model.newTrip,
                                      ParamType.Document,
                                    ),
                                    'propertyRef': serializeParam(
                                      widget.propertyDetails,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'tripRef': _model.newTrip,
                                    'propertyRef': widget.propertyDetails,
                                  },
                                );

                                logFirebaseEvent('Button_firestore_query');
                                _model.chathostelref2 =
                                    await queryChatsRecordOnce(
                                  queryBuilder: (chatsRecord) =>
                                      chatsRecord.where(
                                    'group_chat_id',
                                    isEqualTo: widget.propertyDetails?.id,
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                              } else {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Transaction Failed',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 500),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                  ),
                                );
                              }
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'pimn588v' /* Reserve Now */,
                          ),
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
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
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!);
              },
            ),
        ],
      ),
    );
  }
}
