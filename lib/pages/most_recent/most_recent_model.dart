import '/flutter_flow/flutter_flow_util.dart';
import 'most_recent_widget.dart' show MostRecentWidget;
import 'package:flutter/material.dart';

class MostRecentModel extends FlutterFlowModel<MostRecentWidget> {
  ///  Local state fields for this page.

  int? currenttime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
