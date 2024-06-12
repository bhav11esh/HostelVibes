import '/flutter_flow/flutter_flow_util.dart';
import 'phone_o_t_p_widget.dart' show PhoneOTPWidget;
import 'package:flutter/material.dart';

class PhoneOTPModel extends FlutterFlowModel<PhoneOTPWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}
