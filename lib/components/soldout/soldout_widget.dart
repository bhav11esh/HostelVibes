import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'soldout_model.dart';
export 'soldout_model.dart';

class SoldoutWidget extends StatefulWidget {
  const SoldoutWidget({
    super.key,
    String? distext,
  }) : distext = distext ?? '';

  final String distext;

  @override
  State<SoldoutWidget> createState() => _SoldoutWidgetState();
}

class _SoldoutWidgetState extends State<SoldoutWidget> {
  late SoldoutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoldoutModel());

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).info,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            widget.distext,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).tertiary,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
