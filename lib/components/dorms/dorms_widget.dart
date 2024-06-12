import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dorms_model.dart';
export 'dorms_model.dart';

class DormsWidget extends StatefulWidget {
  const DormsWidget({
    super.key,
    required this.cardRoom,
  });

  final dynamic cardRoom;

  @override
  State<DormsWidget> createState() => _DormsWidgetState();
}

class _DormsWidgetState extends State<DormsWidget> {
  late DormsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DormsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('DORMS_COMP_Dorms_ON_INIT_STATE');
      logFirebaseEvent('Dorms_update_component_state');
      _model.minpriceavg = valueOrDefault<double>(
        functions.minprice(
            getJsonField(
              widget.cardRoom,
              r'''$.averagePricePerNight[0].price.value''',
            ).toString().toString(),
            getJsonField(
              widget.cardRoom,
              r'''$.averagePricePerNight[1].price.value''',
            ).toString().toString()),
        999.0,
      );
      _model.name = getJsonField(
        widget.cardRoom,
        r'''$.name''',
      ).toString().toString();
      _model.cnt = 0;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.98,
      height: 320.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 5.0, 5.0),
                child: Container(
                  width: 180.0,
                  height: 195.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DORMS_COMP_Image_tzkr5pk2_ON_TAP');
                      logFirebaseEvent('Image_expand_image');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 0),
                              fadeOutDuration: const Duration(milliseconds: 0),
                              imageUrl: getJsonField(
                                        widget.cardRoom,
                                        r'''$.images[0].suffix''',
                                      ) !=
                                      null
                                  ? 'https://${getJsonField(
                                      widget.cardRoom,
                                      r'''$.images[0].prefix''',
                                    ).toString()}${getJsonField(
                                      widget.cardRoom,
                                      r'''$.images[0].suffix''',
                                    ).toString()}'
                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/travelv3-egx6ev/assets/n1nfblwd8b31/bunk-bed-cartoon-style-stiker-white-background-isolated-transparent-png-logo-generative-ai-277310284.webp',
                              fit: BoxFit.contain,
                              errorWidget: (context, error, stackTrace) =>
                                  Image.asset(
                                'assets/images/error_image.webp',
                                fit: BoxFit.contain,
                              ),
                            ),
                            allowRotation: false,
                            tag: getJsonField(
                                      widget.cardRoom,
                                      r'''$.images[0].suffix''',
                                    ) !=
                                    null
                                ? 'https://${getJsonField(
                                    widget.cardRoom,
                                    r'''$.images[0].prefix''',
                                  ).toString()}${getJsonField(
                                    widget.cardRoom,
                                    r'''$.images[0].suffix''',
                                  ).toString()}'
                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/travelv3-egx6ev/assets/n1nfblwd8b31/bunk-bed-cartoon-style-stiker-white-background-isolated-transparent-png-logo-generative-ai-277310284.webp',
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: getJsonField(
                                widget.cardRoom,
                                r'''$.images[0].suffix''',
                              ) !=
                              null
                          ? 'https://${getJsonField(
                              widget.cardRoom,
                              r'''$.images[0].prefix''',
                            ).toString()}${getJsonField(
                              widget.cardRoom,
                              r'''$.images[0].suffix''',
                            ).toString()}'
                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/travelv3-egx6ev/assets/n1nfblwd8b31/bunk-bed-cartoon-style-stiker-white-background-isolated-transparent-png-logo-generative-ai-277310284.webp',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 0),
                          fadeOutDuration: const Duration(milliseconds: 0),
                          imageUrl: getJsonField(
                                    widget.cardRoom,
                                    r'''$.images[0].suffix''',
                                  ) !=
                                  null
                              ? 'https://${getJsonField(
                                  widget.cardRoom,
                                  r'''$.images[0].prefix''',
                                ).toString()}${getJsonField(
                                  widget.cardRoom,
                                  r'''$.images[0].suffix''',
                                ).toString()}'
                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/travelv3-egx6ev/assets/n1nfblwd8b31/bunk-bed-cartoon-style-stiker-white-background-isolated-transparent-png-logo-generative-ai-277310284.webp',
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.webp',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      constraints: const BoxConstraints(
                        minHeight: 20.0,
                        maxHeight: 80.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            getJsonField(
                              widget.cardRoom,
                              r'''$.name''',
                            )?.toString(),
                            'abc',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Urbanist',
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: 150.0,
                      constraints: const BoxConstraints(
                        maxHeight: 150.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          getJsonField(
                            widget.cardRoom,
                            r'''$.description''',
                          ).toString(),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            getJsonField(
                              widget.cardRoom,
                              r'''$.capacity''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'uzdkvi0a' /*  Person */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
          Container(
            width: 350.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ii3y6gr3' /* Standard */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        'Rs ${_model.minpriceavg?.toString()}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 190.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_model.cnt > 0)
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DORMS_COMP_Icon_lrajjvn5_ON_TAP');
                                  logFirebaseEvent(
                                      'Icon_update_component_state');
                                  _model.cnt = _model.cnt + -1;
                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().removeFromBookeddetails(
                                      StayruleDataStruct(
                                    type: _model.name,
                                    price: _model.minpriceavg,
                                  ));
                                  setState(() {});
                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().price = FFAppState().price +
                                      (-1 * ((_model.minpriceavg!)));
                                  _model.updatePage(() {});
                                },
                                child: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.cnt.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      if (_model.cnt <
                          getJsonField(
                            widget.cardRoom,
                            r'''$.totalBedsAvailable''',
                          ))
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DORMS_COMP_Icon_n4h05d6y_ON_TAP');
                                  logFirebaseEvent(
                                      'Icon_update_component_state');
                                  _model.cnt = _model.cnt + 1;
                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState()
                                      .addToBookeddetails(StayruleDataStruct(
                                    type: _model.name,
                                    price: _model.minpriceavg,
                                  ));
                                  setState(() {});
                                  logFirebaseEvent('Icon_update_app_state');
                                  FFAppState().price =
                                      FFAppState().price + _model.minpriceavg!;
                                  _model.updatePage(() {});
                                },
                                child: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 30.0,
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
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'q6kwe8zg' /* *Average Prices per night per ... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              if (_model.cnt > 0)
                Text(
                  '${_model.minpriceavg?.toString()}x${_model.cnt.toString()}=${(((_model.minpriceavg!)) * (_model.cnt.toDouble())).toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
