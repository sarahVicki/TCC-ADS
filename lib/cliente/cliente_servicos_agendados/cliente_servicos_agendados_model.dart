import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/cliente/cliente_nav_bar_calendario/cliente_nav_bar_calendario_widget.dart';
import '/componentes/confirmacao_cancelamento/confirmacao_cancelamento_widget.dart';
import '/componentes/sem_servico_agendado/sem_servico_agendado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cliente_servicos_agendados_widget.dart'
    show ClienteServicosAgendadosWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClienteServicosAgendadosModel
    extends FlutterFlowModel<ClienteServicosAgendadosWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<List<AgendamentosRow>>? requestCompleter;
  // Model for Cliente-NavBar-Calendario component.
  late ClienteNavBarCalendarioModel clienteNavBarCalendarioModel;

  @override
  void initState(BuildContext context) {
    clienteNavBarCalendarioModel =
        createModel(context, () => ClienteNavBarCalendarioModel());
  }

  @override
  void dispose() {
    clienteNavBarCalendarioModel.dispose();
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
