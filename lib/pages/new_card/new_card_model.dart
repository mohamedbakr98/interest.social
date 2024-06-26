import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_card_widget.dart' show NewCardWidget;
import 'package:flutter/material.dart';

class NewCardModel extends FlutterFlowModel<NewCardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for card_name widget.
  FocusNode? cardNameFocusNode;
  TextEditingController? cardNameTextController;
  String? Function(BuildContext, String?)? cardNameTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];
  DateTime? datePicked;
  // State field(s) for people_number widget.
  FocusNode? peopleNumberFocusNode;
  TextEditingController? peopleNumberTextController;
  String? Function(BuildContext, String?)? peopleNumberTextControllerValidator;
  // State field(s) for hourCounter widget.
  int? hourCounterValue;
  // State field(s) for dayCounter widget.
  int? dayCounterValue;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CardsRecord? cardID;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    cardNameFocusNode?.dispose();
    cardNameTextController?.dispose();

    peopleNumberFocusNode?.dispose();
    peopleNumberTextController?.dispose();
  }
}
