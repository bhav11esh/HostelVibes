import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'chatgpt_dis_model.dart';
export 'chatgpt_dis_model.dart';

class ChatgptDisWidget extends StatefulWidget {
  const ChatgptDisWidget({super.key});

  @override
  State<ChatgptDisWidget> createState() => _ChatgptDisWidgetState();
}

class _ChatgptDisWidgetState extends State<ChatgptDisWidget> {
  late ChatgptDisModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatgptDisModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Container(
        width: 510.0,
        height: 152.0,
        decoration: BoxDecoration(
          color: const Color(0x991E2429),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SelectionArea(
              child: AutoSizeText(
            FFLocalizations.of(context).getText(
              'ydb55h49' /* You can build a Travel Itinary... */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).tertiary,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  lineHeight: 1.5,
                ),
          )),
        ),
      ),
    );
  }
}
