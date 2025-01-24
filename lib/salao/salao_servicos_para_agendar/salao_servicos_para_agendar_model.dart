import '/backend/supabase/supabase.dart';
import '/componentes/sem_servico/sem_servico_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/salao/salao_nav_bar_agendamento/salao_nav_bar_agendamento_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'salao_servicos_para_agendar_widget.dart'
    show SalaoServicosParaAgendarWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoServicosParaAgendarModel
    extends FlutterFlowModel<SalaoServicosParaAgendarWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // Model for Salao-NavBar-Agendamento component.
  late SalaoNavBarAgendamentoModel salaoNavBarAgendamentoModel;

  @override
  void initState(BuildContext context) {
    salaoNavBarAgendamentoModel =
        createModel(context, () => SalaoNavBarAgendamentoModel());
  }

  @override
  void dispose() {
    salaoNavBarAgendamentoModel.dispose();
  }
}
