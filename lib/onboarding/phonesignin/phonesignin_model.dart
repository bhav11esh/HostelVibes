import '/flutter_flow/flutter_flow_util.dart';
import 'phonesignin_widget.dart' show PhonesigninWidget;
import 'package:flutter/material.dart';

class PhonesigninModel extends FlutterFlowModel<PhonesigninWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
