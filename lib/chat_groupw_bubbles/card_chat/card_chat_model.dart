import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_chat_widget.dart' show CardChatWidget;
import 'package:flutter/material.dart';

class CardChatModel extends FlutterFlowModel<CardChatWidget> {
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
  // Stores action output result for [Backend Call - Read Document] action in card_chat widget.
  CardsRecord? card;
  // State field(s) for Column widget.
  ScrollController? columnController;
  List<CardMessagesRecord>? columnPreviousSnapshot;
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
  CardMessagesRecord? newMessage;

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
