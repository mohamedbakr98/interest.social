import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat2_details_widget.dart' show Chat2DetailsWidget;
import 'package:flutter/material.dart';

class Chat2DetailsModel extends FlutterFlowModel<Chat2DetailsWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> lastMessageSeenBy = [];
  void addToLastMessageSeenBy(DocumentReference item) =>
      lastMessageSeenBy.add(item);
  void removeFromLastMessageSeenBy(DocumentReference item) =>
      lastMessageSeenBy.remove(item);
  void removeAtIndexFromLastMessageSeenBy(int index) =>
      lastMessageSeenBy.removeAt(index);
  void insertAtIndexInLastMessageSeenBy(int index, DocumentReference item) =>
      lastMessageSeenBy.insert(index, item);
  void updateLastMessageSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastMessageSeenBy[index] = updateFn(lastMessageSeenBy[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in chat_2_Details widget.
  ChatsRecord? chat;
  // Stores action output result for [Backend Call - Read Document] action in chat_2_Details widget.
  UsersRecord? user;
  // State field(s) for Column widget.
  ScrollController? columnController;
  List<ChatMessagesRecord>? columnPreviousSnapshot;
  // State field(s) for images widget.
  ScrollController? images;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newMessage;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    images = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    images?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
