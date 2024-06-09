import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat2_main_widget.dart' show Chat2MainWidget;
import 'package:flutter/material.dart';

class Chat2MainModel extends FlutterFlowModel<Chat2MainWidget> {
  ///  Local state fields for this page.

  int? counter;

  List<ChatsRecord> chatDocList = [];
  void addToChatDocList(ChatsRecord item) => chatDocList.add(item);
  void removeFromChatDocList(ChatsRecord item) => chatDocList.remove(item);
  void removeAtIndexFromChatDocList(int index) => chatDocList.removeAt(index);
  void insertAtIndexInChatDocList(int index, ChatsRecord item) =>
      chatDocList.insert(index, item);
  void updateChatDocListAtIndex(int index, Function(ChatsRecord) updateFn) =>
      chatDocList[index] = updateFn(chatDocList[index]);

  List<CardsRecord> cardDocList = [];
  void addToCardDocList(CardsRecord item) => cardDocList.add(item);
  void removeFromCardDocList(CardsRecord item) => cardDocList.remove(item);
  void removeAtIndexFromCardDocList(int index) => cardDocList.removeAt(index);
  void insertAtIndexInCardDocList(int index, CardsRecord item) =>
      cardDocList.insert(index, item);
  void updateCardDocListAtIndex(int index, Function(CardsRecord) updateFn) =>
      cardDocList[index] = updateFn(cardDocList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in chat_2_main widget.
  ChatsRecord? singleDoc;
  // Stores action output result for [Backend Call - Read Document] action in chat_2_main widget.
  CardsRecord? singleCard;
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
