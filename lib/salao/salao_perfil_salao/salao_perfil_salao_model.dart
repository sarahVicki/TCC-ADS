import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/confirmacao_excluir/confirmacao_excluir_widget.dart';
import '/componentes/sem_avaliacao/sem_avaliacao_widget.dart';
import '/componentes/sem_profissional/sem_profissional_widget.dart';
import '/componentes/sem_servico/sem_servico_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/salao/salao_atribuir_servicos/salao_atribuir_servicos_widget.dart';
import '/salao/salao_confirmacao_demitir/salao_confirmacao_demitir_widget.dart';
import '/salao/salao_criar_servico/salao_criar_servico_widget.dart';
import '/salao/salao_editar_servico/salao_editar_servico_widget.dart';
import '/salao/salao_nav_bar_perfil/salao_nav_bar_perfil_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'salao_perfil_salao_widget.dart' show SalaoPerfilSalaoWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoPerfilSalaoModel extends FlutterFlowModel<SalaoPerfilSalaoWidget> {
  ///  Local state fields for this page.

  int? diaAtual;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  Completer<List<ServicosRow>>? requestCompleter;
  // Model for Salao-NavBar-Perfil component.
  late SalaoNavBarPerfilModel salaoNavBarPerfilModel;

  @override
  void initState(BuildContext context) {
    salaoNavBarPerfilModel =
        createModel(context, () => SalaoNavBarPerfilModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    salaoNavBarPerfilModel.dispose();
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
