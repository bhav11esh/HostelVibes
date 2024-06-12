import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_details_widget.dart' show ChatDetailsWidget;
import 'package:flutter/material.dart';

class ChatDetailsModel extends FlutterFlowModel<ChatDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
