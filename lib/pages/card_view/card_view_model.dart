import '/flutter_flow/flutter_flow_util.dart';
import 'card_view_widget.dart' show CardViewWidget;
import 'package:flutter/material.dart';

class CardViewModel extends FlutterFlowModel<CardViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
