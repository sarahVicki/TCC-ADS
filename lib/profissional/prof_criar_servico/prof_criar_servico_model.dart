import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'prof_criar_servico_widget.dart' show ProfCriarServicoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfCriarServicoModel extends FlutterFlowModel<ProfCriarServicoWidget> {
  ///  Local state fields for this component.

  List<String> idProf = [];
  void addToIdProf(String item) => idProf.add(item);
  void removeFromIdProf(String item) => idProf.remove(item);
  void removeAtIndexFromIdProf(int index) => idProf.removeAt(index);
  void insertAtIndexInIdProf(int index, String item) =>
      idProf.insert(index, item);
  void updateIdProfAtIndex(int index, Function(String) updateFn) =>
      idProf[index] = updateFn(idProf[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for nomeServico widget.
  FocusNode? nomeServicoFocusNode;
  TextEditingController? nomeServicoTextController;
  String? Function(BuildContext, String?)? nomeServicoTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for duracao widget.
  FocusNode? duracaoFocusNode;
  TextEditingController? duracaoTextController;
  String? Function(BuildContext, String?)? duracaoTextControllerValidator;
  // State field(s) for preco widget.
  FocusNode? precoFocusNode;
  TextEditingController? precoTextController;
  String? Function(BuildContext, String?)? precoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeServicoFocusNode?.dispose();
    nomeServicoTextController?.dispose();

    duracaoFocusNode?.dispose();
    duracaoTextController?.dispose();

    precoFocusNode?.dispose();
    precoTextController?.dispose();
  }
}
