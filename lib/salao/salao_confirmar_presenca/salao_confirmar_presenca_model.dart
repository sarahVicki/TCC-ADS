import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/salao/salao_nav_bar_notificacoes/salao_nav_bar_notificacoes_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'salao_confirmar_presenca_widget.dart' show SalaoConfirmarPresencaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoConfirmarPresencaModel
    extends FlutterFlowModel<SalaoConfirmarPresencaWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<AgendamentosRow>>? requestCompleter;
  // Model for Salao-NavBar-Notificacoes component.
  late SalaoNavBarNotificacoesModel salaoNavBarNotificacoesModel;

  @override
  void initState(BuildContext context) {
    salaoNavBarNotificacoesModel =
        createModel(context, () => SalaoNavBarNotificacoesModel());
  }

  @override
  void dispose() {
    salaoNavBarNotificacoesModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
