import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'salao_atribuir_servicos_widget.dart' show SalaoAtribuirServicosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoAtribuirServicosModel
    extends FlutterFlowModel<SalaoAtribuirServicosWidget> {
  ///  Local state fields for this component.

  List<String> servicosSelecionados = [];
  void addToServicosSelecionados(String item) => servicosSelecionados.add(item);
  void removeFromServicosSelecionados(String item) =>
      servicosSelecionados.remove(item);
  void removeAtIndexFromServicosSelecionados(int index) =>
      servicosSelecionados.removeAt(index);
  void insertAtIndexInServicosSelecionados(int index, String item) =>
      servicosSelecionados.insert(index, item);
  void updateServicosSelecionadosAtIndex(
          int index, Function(String) updateFn) =>
      servicosSelecionados[index] = updateFn(servicosSelecionados[index]);

  List<String> profsServicos = [];
  void addToProfsServicos(String item) => profsServicos.add(item);
  void removeFromProfsServicos(String item) => profsServicos.remove(item);
  void removeAtIndexFromProfsServicos(int index) =>
      profsServicos.removeAt(index);
  void insertAtIndexInProfsServicos(int index, String item) =>
      profsServicos.insert(index, item);
  void updateProfsServicosAtIndex(int index, Function(String) updateFn) =>
      profsServicos[index] = updateFn(profsServicos[index]);

  int? quant = 0;

  List<String> servicosTotais = [];
  void addToServicosTotais(String item) => servicosTotais.add(item);
  void removeFromServicosTotais(String item) => servicosTotais.remove(item);
  void removeAtIndexFromServicosTotais(int index) =>
      servicosTotais.removeAt(index);
  void insertAtIndexInServicosTotais(int index, String item) =>
      servicosTotais.insert(index, item);
  void updateServicosTotaisAtIndex(int index, Function(String) updateFn) =>
      servicosTotais[index] = updateFn(servicosTotais[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Salao-AtribuirServicos widget.
  List<ServicosRow>? servicosOutPut;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServicosRow>? todosServicos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
