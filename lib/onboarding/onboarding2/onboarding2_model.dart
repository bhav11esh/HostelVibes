import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding2_widget.dart' show Onboarding2Widget;
import 'package:flutter/material.dart';

class Onboarding2Model extends FlutterFlowModel<Onboarding2Widget> {
  ///  Local state fields for this page.

  int page = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
