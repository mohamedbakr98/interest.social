import '/flutter_flow/flutter_flow_util.dart';
import 'edit_bio_widget.dart' show EditBioWidget;
import 'package:flutter/material.dart';

class EditBioModel extends FlutterFlowModel<EditBioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioTextController;
  String? Function(BuildContext, String?)? bioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    bioFocusNode?.dispose();
    bioTextController?.dispose();
  }
}
