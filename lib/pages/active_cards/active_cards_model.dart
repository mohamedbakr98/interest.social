import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'active_cards_widget.dart' show ActiveCardsWidget;
import 'package:flutter/material.dart';

class ActiveCardsModel extends FlutterFlowModel<ActiveCardsWidget> {
  ///  Local state fields for this page.

  List<CardsRecord> activecards = [];
  void addToActivecards(CardsRecord item) => activecards.add(item);
  void removeFromActivecards(CardsRecord item) => activecards.remove(item);
  void removeAtIndexFromActivecards(int index) => activecards.removeAt(index);
  void insertAtIndexInActivecards(int index, CardsRecord item) =>
      activecards.insert(index, item);
  void updateActivecardsAtIndex(int index, Function(CardsRecord) updateFn) =>
      activecards[index] = updateFn(activecards[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
