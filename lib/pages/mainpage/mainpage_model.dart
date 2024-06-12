import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainpage_widget.dart' show MainpageWidget;
import 'package:flutter/material.dart';

class MainpageModel extends FlutterFlowModel<MainpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Mainpage widget.
  UsersRecord? userrecord;
  // Stores action output result for [Custom Action - getAppVersion] action in Mainpage widget.
  String? userdeviceappversion;
  // Stores action output result for [Firestore Query - Query a collection] action in Mainpage widget.
  VersionRecord? versiondocument;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
