import '/flutter_flow/flutter_flow_util.dart';
import 'choose_card_genre_widget.dart' show ChooseCardGenreWidget;
import 'package:flutter/material.dart';

class ChooseCardGenreModel extends FlutterFlowModel<ChooseCardGenreWidget> {
  ///  Local state fields for this page.

  List<bool> camelCase = [];
  void addToCamelCase(bool item) => camelCase.add(item);
  void removeFromCamelCase(bool item) => camelCase.remove(item);
  void removeAtIndexFromCamelCase(int index) => camelCase.removeAt(index);
  void insertAtIndexInCamelCase(int index, bool item) =>
      camelCase.insert(index, item);
  void updateCamelCaseAtIndex(int index, Function(bool) updateFn) =>
      camelCase[index] = updateFn(camelCase[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ChooseCardGenre widget.
  int? genreListCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
