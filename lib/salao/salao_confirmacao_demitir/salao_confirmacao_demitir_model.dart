import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'salao_confirmacao_demitir_widget.dart'
    show SalaoConfirmacaoDemitirWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoConfirmacaoDemitirModel
    extends FlutterFlowModel<SalaoConfirmacaoDemitirWidget> {
  ///  Local state fields for this component.

  List<String> servicosTotais = [];
  void addToServicosTotais(String item) => servicosTotais.add(item);
  void removeFromServicosTotais(String item) => servicosTotais.remove(item);
  void removeAtIndexFromServicosTotais(int index) =>
      servicosTotais.removeAt(index);
  void insertAtIndexInServicosTotais(int index, String item) =>
      servicosTotais.insert(index, item);
  void updateServicosTotaisAtIndex(int index, Function(String) updateFn) =>
      servicosTotais[index] = updateFn(servicosTotais[index]);

  int? quant = 0;

  List<String> profTotais = [];
  void addToProfTotais(String item) => profTotais.add(item);
  void removeFromProfTotais(String item) => profTotais.remove(item);
  void removeAtIndexFromProfTotais(int index) => profTotais.removeAt(index);
  void insertAtIndexInProfTotais(int index, String item) =>
      profTotais.insert(index, item);
  void updateProfTotaisAtIndex(int index, Function(String) updateFn) =>
      profTotais[index] = updateFn(profTotais[index]);

  List<String> saloesFiliados = [];
  void addToSaloesFiliados(String item) => saloesFiliados.add(item);
  void removeFromSaloesFiliados(String item) => saloesFiliados.remove(item);
  void removeAtIndexFromSaloesFiliados(int index) =>
      saloesFiliados.removeAt(index);
  void insertAtIndexInSaloesFiliados(int index, String item) =>
      saloesFiliados.insert(index, item);
  void updateSaloesFiliadosAtIndex(int index, Function(String) updateFn) =>
      saloesFiliados[index] = updateFn(saloesFiliados[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Salao-ConfirmacaoDemitir widget.
  List<ServicosRow>? todosServicos;
  // Stores action output result for [Backend Call - Query Rows] action in Salao-ConfirmacaoDemitir widget.
  List<ProfissionalRow>? profissional;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ServicosRow>? verificaServico;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
