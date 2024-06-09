import '/flutter_flow/flutter_flow_util.dart';
import 'image_details_widget.dart' show ImageDetailsWidget;
import 'package:flutter/material.dart';

class ImageDetailsModel extends FlutterFlowModel<ImageDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
