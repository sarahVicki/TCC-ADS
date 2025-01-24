import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/prof_disponiveis/prof_disponiveis_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'salao_agendar_cliente_widget.dart' show SalaoAgendarClienteWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoAgendarClienteModel
    extends FlutterFlowModel<SalaoAgendarClienteWidget> {
  ///  Local state fields for this page.

  int? diaSemana;

  String? horaInicio;

  String? horaFim;

  String? intervaloInicio;

  String? intervaloFim;

  String? statusDia;

  DateTime? horaClicada;

  List<AgendamentosRow> horasAgendadas = [];
  void addToHorasAgendadas(AgendamentosRow item) => horasAgendadas.add(item);
  void removeFromHorasAgendadas(AgendamentosRow item) =>
      horasAgendadas.remove(item);
  void removeAtIndexFromHorasAgendadas(int index) =>
      horasAgendadas.removeAt(index);
  void insertAtIndexInHorasAgendadas(int index, AgendamentosRow item) =>
      horasAgendadas.insert(index, item);
  void updateHorasAgendadasAtIndex(
          int index, Function(AgendamentosRow) updateFn) =>
      horasAgendadas[index] = updateFn(horasAgendadas[index]);

  DateTime? fimAgendamento;

  List<String> idsProf = [];
  void addToIdsProf(String item) => idsProf.add(item);
  void removeFromIdsProf(String item) => idsProf.remove(item);
  void removeAtIndexFromIdsProf(int index) => idsProf.removeAt(index);
  void insertAtIndexInIdsProf(int index, String item) =>
      idsProf.insert(index, item);
  void updateIdsProfAtIndex(int index, Function(String) updateFn) =>
      idsProf[index] = updateFn(idsProf[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Salao-AgendarCliente widget.
  List<HorariosRow>? horariosSalao;
  // Stores action output result for [Backend Call - Query Rows] action in Salao-AgendarCliente widget.
  List<HorariosRow>? todosHorario;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  Completer<List<ProfissionalRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future buscarHoras(BuildContext context) async {
    List<AgendamentosRow>? horasRetornadas;

    logFirebaseEvent('buscarHoras_backend_call');
    horasRetornadas = await AgendamentosTable().queryRows(
      queryFn: (q) => q
          .gteOrNull(
            'data_agendada',
            supaSerialize<DateTime>(
                functions.horaUTC(calendarSelectedDay!.start)),
          )
          .lteOrNull(
            'data_agendada',
            supaSerialize<DateTime>(
                functions.horaUTC(calendarSelectedDay!.end)),
          )
          .eqOrNull(
            'id_salao',
            widget!.refSalao,
          ),
    );
    logFirebaseEvent('buscarHoras_update_page_state');
    horasAgendadas = horasRetornadas!.toList().cast<AgendamentosRow>();
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
