import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'editar_avaliacao_widget.dart' show EditarAvaliacaoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarAvaliacaoModel extends FlutterFlowModel<EditarAvaliacaoWidget> {
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
