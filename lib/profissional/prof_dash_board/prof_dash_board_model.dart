import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profissional/profissional_nav_bar_dashboard/profissional_nav_bar_dashboard_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'prof_dash_board_widget.dart' show ProfDashBoardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfDashBoardModel extends FlutterFlowModel<ProfDashBoardWidget> {
  ///  Local state fields for this page.

  int? finalizados = 0;

  int? cancelados = 0;

  int? naoCompareceu = 0;

  List<String> meses = [
    'Jan',
    'Fev',
    'Mar',
    'Abr',
    'Maio',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out',
    'Nov',
    'Dez'
  ];
  void addToMeses(String item) => meses.add(item);
  void removeFromMeses(String item) => meses.remove(item);
  void removeAtIndexFromMeses(int index) => meses.removeAt(index);
  void insertAtIndexInMeses(int index, String item) =>
      meses.insert(index, item);
  void updateMesesAtIndex(int index, Function(String) updateFn) =>
      meses[index] = updateFn(meses[index]);

  List<AgendamentosRow> agendamentos = [];
  void addToAgendamentos(AgendamentosRow item) => agendamentos.add(item);
  void removeFromAgendamentos(AgendamentosRow item) =>
      agendamentos.remove(item);
  void removeAtIndexFromAgendamentos(int index) => agendamentos.removeAt(index);
  void insertAtIndexInAgendamentos(int index, AgendamentosRow item) =>
      agendamentos.insert(index, item);
  void updateAgendamentosAtIndex(
          int index, Function(AgendamentosRow) updateFn) =>
      agendamentos[index] = updateFn(agendamentos[index]);

  List<ServicosRow> servicos = [];
  void addToServicos(ServicosRow item) => servicos.add(item);
  void removeFromServicos(ServicosRow item) => servicos.remove(item);
  void removeAtIndexFromServicos(int index) => servicos.removeAt(index);
  void insertAtIndexInServicos(int index, ServicosRow item) =>
      servicos.insert(index, item);
  void updateServicosAtIndex(int index, Function(ServicosRow) updateFn) =>
      servicos[index] = updateFn(servicos[index]);

  List<double> faturamentoMensal = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0
  ];
  void addToFaturamentoMensal(double item) => faturamentoMensal.add(item);
  void removeFromFaturamentoMensal(double item) =>
      faturamentoMensal.remove(item);
  void removeAtIndexFromFaturamentoMensal(int index) =>
      faturamentoMensal.removeAt(index);
  void insertAtIndexInFaturamentoMensal(int index, double item) =>
      faturamentoMensal.insert(index, item);
  void updateFaturamentoMensalAtIndex(int index, Function(double) updateFn) =>
      faturamentoMensal[index] = updateFn(faturamentoMensal[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Prof-DashBoard widget.
  List<ProfissionalRow>? profissional;
  // Stores action output result for [Backend Call - Query Rows] action in Prof-DashBoard widget.
  List<AgendamentosRow>? todosAgendamentos;
  // Stores action output result for [Backend Call - Query Rows] action in Prof-DashBoard widget.
  List<ServicosRow>? servicosTotais;
  // Model for Profissional-NavBar-Dashboard component.
  late ProfissionalNavBarDashboardModel profissionalNavBarDashboardModel;

  @override
  void initState(BuildContext context) {
    profissionalNavBarDashboardModel =
        createModel(context, () => ProfissionalNavBarDashboardModel());
  }

  @override
  void dispose() {
    profissionalNavBarDashboardModel.dispose();
  }
}
