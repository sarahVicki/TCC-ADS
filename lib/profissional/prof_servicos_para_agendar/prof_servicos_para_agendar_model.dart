import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/profissional/profissional_nav_bar_agendamento/profissional_nav_bar_agendamento_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'prof_servicos_para_agendar_widget.dart'
    show ProfServicosParaAgendarWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfServicosParaAgendarModel
    extends FlutterFlowModel<ProfServicosParaAgendarWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for Profissional-NavBar-Agendamento component.
  late ProfissionalNavBarAgendamentoModel profissionalNavBarAgendamentoModel;

  @override
  void initState(BuildContext context) {
    profissionalNavBarAgendamentoModel =
        createModel(context, () => ProfissionalNavBarAgendamentoModel());
  }

  @override
  void dispose() {
    profissionalNavBarAgendamentoModel.dispose();
  }
}
