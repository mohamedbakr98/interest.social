import '/flutter_flow/flutter_flow_util.dart';
import 'others_profiles_widget.dart' show OthersProfilesWidget;
import 'package:flutter/material.dart';

class OthersProfilesModel extends FlutterFlowModel<OthersProfilesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
