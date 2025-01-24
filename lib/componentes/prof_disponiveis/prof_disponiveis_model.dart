import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'prof_disponiveis_widget.dart' show ProfDisponiveisWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfDisponiveisModel extends FlutterFlowModel<ProfDisponiveisWidget> {
  ///  Local state fields for this component.

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
