import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'f_ilters_for_hostel_model.dart';
export 'f_ilters_for_hostel_model.dart';

class FIltersForHostelWidget extends StatefulWidget {
  const FIltersForHostelWidget({super.key});

  @override
  State<FIltersForHostelWidget> createState() => _FIltersForHostelWidgetState();
}

class _FIltersForHostelWidgetState extends State<FIltersForHostelWidget> {
  late FIltersForHostelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FIltersForHostelModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FIlters_for_hostel'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('F_ILTERS_FOR_HOSTEL_FIlters_for_hostel_O');
      logFirebaseEvent('FIlters_for_hostel_google_analytics_even');
      logFirebaseEvent('filterforhostel');
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'wjfvwvav' /* Filters  */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Rubik',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 10.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '3yphy4j3' /* Property Type */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowCheckboxGroup(
                  options: [
                    FFLocalizations.of(context).getText(
                      'fv8auix1' /* All */,
                    ),
                    FFLocalizations.of(context).getText(
                      '7s0iqhw7' /* Party */,
                    ),
                    FFLocalizations.of(context).getText(
                      'wgew1r1j' /* Work */,
                    ),
                    FFLocalizations.of(context).getText(
                      'xvtxxf26' /* Peaceful */,
                    ),
                    FFLocalizations.of(context).getText(
                      'pen6es97' /* Camping */,
                    ),
                    FFLocalizations.of(context).getText(
                      'x5lcthtp' /* Flexible  Booking */,
                    )
                  ],
                  onChanged: (val) async {
                    setState(
                        () => _model.checkboxGroupPropertytypeValues = val);
                    logFirebaseEvent(
                        'F_ILTERS_FOR_HOSTEL_CheckboxGroupPropert');
                    logFirebaseEvent(
                        'CheckboxGroupPropertytype_update_app_sta');
                    FFAppState().property = _model
                        .checkboxGroupPropertytypeValues!
                        .toList()
                        .cast<String>();
                    FFAppState().facilities =
                        _model.room2Values!.toList().cast<String>();
                    setState(() {});
                  },
                  controller:
                      _model.checkboxGroupPropertytypeValueController ??=
                          FormFieldController<List<String>>(
                    List.from([
                          FFLocalizations.of(context).getText(
                            'wit5lu26' /* All */,
                          )
                        ] ??
                        []),
                  ),
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: FlutterFlowTheme.of(context).info,
                  checkboxBorderColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                  checkboxBorderRadius: BorderRadius.circular(4.0),
                  initialized: _model.checkboxGroupPropertytypeValues != null,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'mxl6ux4y' /* Average Price Per Night */,
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Slider.adaptive(
                activeColor: FlutterFlowTheme.of(context).primary,
                inactiveColor: FlutterFlowTheme.of(context).alternate,
                min: 0.0,
                max: 5000.0,
                value: _model.sliderValue ??= 800.0,
                label: _model.sliderValue?.toStringAsFixed(0),
                divisions: 25,
                onChanged: (newValue) {
                  newValue = double.parse(newValue.toStringAsFixed(0));
                  setState(() => _model.sliderValue = newValue);
                },
              ),
              Text(
                'Rs ${_model.sliderValue?.toString()}',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Urbanist',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'ysfz4ch8' /* Room */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.0,
                          child: FlutterFlowCheckboxGroup(
                            options: [
                              FFLocalizations.of(context).getText(
                                '8t2v69xv' /* All */,
                              ),
                              FFLocalizations.of(context).getText(
                                'qfym40ep' /* Female Dorm */,
                              ),
                              FFLocalizations.of(context).getText(
                                'l825s2wu' /* Male Dorm */,
                              ),
                              FFLocalizations.of(context).getText(
                                'taif7mxg' /* Mix Dorm */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.room1Values = val),
                            controller: _model.room1ValueController ??=
                                FormFieldController<List<String>>(
                              List.from([
                                    FFLocalizations.of(context).getText(
                                      'u9d09hy5' /* All */,
                                    )
                                  ] ??
                                  []),
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                            checkboxBorderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                            checkboxBorderRadius: BorderRadius.circular(4.0),
                            initialized: _model.room1Values != null,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200.0,
                          child: FlutterFlowCheckboxGroup(
                            options: [
                              FFLocalizations.of(context).getText(
                                'iqw23muy' /* All */,
                              ),
                              FFLocalizations.of(context).getText(
                                'g6393qpd' /* SIngle Room */,
                              ),
                              FFLocalizations.of(context).getText(
                                '30fpfdvz' /* Double Room */,
                              ),
                              FFLocalizations.of(context).getText(
                                'v893tv3s' /* Triple Room */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.room2Values = val),
                            controller: _model.room2ValueController ??=
                                FormFieldController<List<String>>(
                              List.from([
                                    FFLocalizations.of(context).getText(
                                      'odvlcw4b' /* All */,
                                    )
                                  ] ??
                                  []),
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                            checkboxBorderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  letterSpacing: 0.0,
                                ),
                            checkboxBorderRadius: BorderRadius.circular(4.0),
                            initialized: _model.room2Values != null,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'yzmeeovn' /* Hello World */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '2v1l9uhz' /* Rating */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Rubik',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              RatingBar.builder(
                onRatingUpdate: (newValue) =>
                    setState(() => _model.ratingBarValue = newValue),
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFF37214),
                ),
                direction: Axis.horizontal,
                initialRating: _model.ratingBarValue ??= 1.0,
                unratedColor: FlutterFlowTheme.of(context).accent3,
                itemCount: 5,
                itemSize: 30.0,
                glowColor: const Color(0xFFF37214),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '2g7iwou9' /* Facilities */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Rubik',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'pn5lrv0y' /* Free Wifi */,
                        ),
                        Icons.wifi_password),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          '12wdq3r2' /* Kitchen */,
                        ),
                        Icons.food_bank_outlined),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'dwqziz0j' /* AC */,
                        ),
                        Icons.air_rounded),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'earjo1vz' /* Swimming Pool */,
                        ),
                        Icons.pool_sharp),
                    ChipData(
                        FFLocalizations.of(context).getText(
                          'v1bwdryo' /* Vechicle */,
                        ),
                        Icons.directions_bike),
                    ChipData(FFLocalizations.of(context).getText(
                      'rx1kcuez' /* Games */,
                    ))
                  ],
                  onChanged: (val) =>
                      setState(() => _model.faciliteschoicechipsValues = val),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 18.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: true,
                  initialized: _model.faciliteschoicechipsValues != null,
                  alignment: WrapAlignment.start,
                  controller: _model.faciliteschoicechipsValueController ??=
                      FormFieldController<List<String>>(
                    [
                      FFLocalizations.of(context).getText(
                        '2zveeb5l' /* Free Wifi */,
                      )
                    ],
                  ),
                  wrapped: true,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('F_ILTERS_FOR_HOSTEL_APPLY_BTN_ON_TAP');
                  logFirebaseEvent('Button_update_app_state');
                  FFAppState().property = _model
                      .checkboxGroupPropertytypeValues!
                      .toList()
                      .cast<String>();
                  FFAppState().facilities = _model.faciliteschoicechipsValues!
                      .toList()
                      .cast<String>();
                  FFAppState().Roomtypefilter =
                      _model.room1Values!.toList().cast<String>();
                  FFAppState().ratingfilter = valueOrDefault<int>(
                    _model.ratingBarValue?.round(),
                    0,
                  );
                  FFAppState().pricefilter =
                      functions.stringtoint(_model.sliderValue?.toString())!;
                  logFirebaseEvent('Button_navigate_to');

                  context.goNamed('searchProperties');
                },
                text: FFLocalizations.of(context).getText(
                  '9tbi8ay5' /* Apply */,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).info,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Urbanist',
                        color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
