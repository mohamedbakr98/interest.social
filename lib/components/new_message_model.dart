import '/flutter_flow/flutter_flow_util.dart';
import 'new_message_widget.dart' show NewMessageWidget;
import 'package:flutter/material.dart';

class NewMessageModel extends FlutterFlowModel<NewMessageWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
