import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'facility_model.dart';
export 'facility_model.dart';

class FacilityWidget extends StatefulWidget {
  const FacilityWidget({
    super.key,
    required this.fac,
  });

  final List<String>? fac;

  @override
  State<FacilityWidget> createState() => _FacilityWidgetState();
}

class _FacilityWidgetState extends State<FacilityWidget> {
  late FacilityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FacilityModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('FACILITY_COMP_Container_sk5exmkt_ON_TAP');
          logFirebaseEvent('Container_bottom_sheet');
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.8,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Builder(
              builder: (context) {
                final child = widget.fac!.map((e) => e).toList();
                return Wrap(
                  spacing: 2.0,
                  runSpacing: 2.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: List.generate(child.length, (childIndex) {
                    final childItem = child[childIndex];
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: childItem,
                        options: FFButtonOptions(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 2.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 2.0,
                          borderSide: const BorderSide(
                            color: Color(0x00FFFFFF),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
