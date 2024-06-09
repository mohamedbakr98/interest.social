import '/flutter_flow/flutter_flow_util.dart';
import 'card_info_widget.dart' show CardInfoWidget;
import 'package:flutter/material.dart';

class CardInfoModel extends FlutterFlowModel<CardInfoWidget> {
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
