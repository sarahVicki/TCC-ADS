import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'salao_editar_servico_widget.dart' show SalaoEditarServicoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoEditarServicoModel
    extends FlutterFlowModel<SalaoEditarServicoWidget> {
  ///  Local state fields for this component.

  List<String> profSelecionados = [];
  void addToProfSelecionados(String item) => profSelecionados.add(item);
  void removeFromProfSelecionados(String item) => profSelecionados.remove(item);
  void removeAtIndexFromProfSelecionados(int index) =>
      profSelecionados.removeAt(index);
  void insertAtIndexInProfSelecionados(int index, String item) =>
      profSelecionados.insert(index, item);
  void updateProfSelecionadosAtIndex(int index, Function(String) updateFn) =>
      profSelecionados[index] = updateFn(profSelecionados[index]);

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
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

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
