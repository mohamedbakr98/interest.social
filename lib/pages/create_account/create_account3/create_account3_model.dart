import '/flutter_flow/flutter_flow_util.dart';
import 'create_account3_widget.dart' show CreateAccount3Widget;
import 'package:flutter/material.dart';

class CreateAccount3Model extends FlutterFlowModel<CreateAccount3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
