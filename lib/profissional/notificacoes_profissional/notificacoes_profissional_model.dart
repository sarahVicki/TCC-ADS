import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/sem_notificacao/sem_notificacao_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profissional/profissional_nav_bar_notificacoes/profissional_nav_bar_notificacoes_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'notificacoes_profissional_widget.dart'
    show NotificacoesProfissionalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificacoesProfissionalModel
    extends FlutterFlowModel<NotificacoesProfissionalWidget> {
  ///  Local state fields for this page.

  List<String> saloesFiliados = [];
  void addToSaloesFiliados(String item) => saloesFiliados.add(item);
  void removeFromSaloesFiliados(String item) => saloesFiliados.remove(item);
  void removeAtIndexFromSaloesFiliados(int index) =>
      saloesFiliados.removeAt(index);
  void insertAtIndexInSaloesFiliados(int index, String item) =>
      saloesFiliados.insert(index, item);
  void updateSaloesFiliadosAtIndex(int index, Function(String) updateFn) =>
      saloesFiliados[index] = updateFn(saloesFiliados[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in notificacoesProfissional widget.
  List<VincularSalProfRow>? pedidoVinculacao;
  // Stores action output result for [Backend Call - Query Rows] action in notificacoesProfissional widget.
  List<ProfissionalRow>? profissional;
  Completer<List<VincularSalProfRow>>? requestCompleter1;
  Completer<List<AgendamentosRow>>? requestCompleter2;
  // Model for Profissional-NavBar-Notificacoes component.
  late ProfissionalNavBarNotificacoesModel profissionalNavBarNotificacoesModel;

  @override
  void initState(BuildContext context) {
    profissionalNavBarNotificacoesModel =
        createModel(context, () => ProfissionalNavBarNotificacoesModel());
  }

  @override
  void dispose() {
    profissionalNavBarNotificacoesModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
