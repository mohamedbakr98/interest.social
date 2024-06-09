import '/flutter_flow/flutter_flow_util.dart';
import 'home01_company_list_widget.dart' show Home01CompanyListWidget;
import 'package:flutter/material.dart';

class Home01CompanyListModel extends FlutterFlowModel<Home01CompanyListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
