import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'your_cards_widget.dart' show YourCardsWidget;
import 'package:flutter/material.dart';

class YourCardsModel extends FlutterFlowModel<YourCardsWidget> {
  ///  Local state fields for this page.

  List<CardsRecord> cardlist = [];
  void addToCardlist(CardsRecord item) => cardlist.add(item);
  void removeFromCardlist(CardsRecord item) => cardlist.remove(item);
  void removeAtIndexFromCardlist(int index) => cardlist.removeAt(index);
  void insertAtIndexInCardlist(int index, CardsRecord item) =>
      cardlist.insert(index, item);
  void updateCardlistAtIndex(int index, Function(CardsRecord) updateFn) =>
      cardlist[index] = updateFn(cardlist[index]);

  int? counter;

  DateTime? currenttime;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in YourCards widget.
  CardsRecord? singleDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
