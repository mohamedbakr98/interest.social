import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat2_invite_users_widget.dart' show Chat2InviteUsersWidget;
import 'package:flutter/material.dart';

class Chat2InviteUsersModel extends FlutterFlowModel<Chat2InviteUsersWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> friendsList = [];
  void addToFriendsList(DocumentReference item) => friendsList.add(item);
  void removeFromFriendsList(DocumentReference item) =>
      friendsList.remove(item);
  void removeAtIndexFromFriendsList(int index) => friendsList.removeAt(index);
  void insertAtIndexInFriendsList(int index, DocumentReference item) =>
      friendsList.insert(index, item);
  void updateFriendsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendsList[index] = updateFn(friendsList[index]);

  int? chatcounter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxListTile widget.
  Map<DocumentReference, bool> checkboxListTileValueMap = {};
  List<DocumentReference> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChatsRecord? chat;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? newChat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
