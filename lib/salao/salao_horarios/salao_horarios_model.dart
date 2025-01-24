import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'salao_horarios_widget.dart' show SalaoHorariosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoHorariosModel extends FlutterFlowModel<SalaoHorariosWidget> {
  ///  Local state fields for this page.

  bool statusSeg = true;

  bool statusTer = true;

  bool statusQua = true;

  bool statusQui = true;

  bool statusSex = true;

  bool statusSab = true;

  bool statusDom = true;

  List<String> listaHoraInicial = ['0', '0', '0', '0', '0', '0', '0'];
  void addToListaHoraInicial(String item) => listaHoraInicial.add(item);
  void removeFromListaHoraInicial(String item) => listaHoraInicial.remove(item);
  void removeAtIndexFromListaHoraInicial(int index) =>
      listaHoraInicial.removeAt(index);
  void insertAtIndexInListaHoraInicial(int index, String item) =>
      listaHoraInicial.insert(index, item);
  void updateListaHoraInicialAtIndex(int index, Function(String) updateFn) =>
      listaHoraInicial[index] = updateFn(listaHoraInicial[index]);

  List<String> listaHoraFinal = ['0', '0', '0', '0', '0', '0', '0'];
  void addToListaHoraFinal(String item) => listaHoraFinal.add(item);
  void removeFromListaHoraFinal(String item) => listaHoraFinal.remove(item);
  void removeAtIndexFromListaHoraFinal(int index) =>
      listaHoraFinal.removeAt(index);
  void insertAtIndexInListaHoraFinal(int index, String item) =>
      listaHoraFinal.insert(index, item);
  void updateListaHoraFinalAtIndex(int index, Function(String) updateFn) =>
      listaHoraFinal[index] = updateFn(listaHoraFinal[index]);

  List<String> listaStatus = [
    'Fechado',
    'Fechado',
    'Fechado',
    'Fechado',
    'Fechado',
    'Fechado',
    'Fechado'
  ];
  void addToListaStatus(String item) => listaStatus.add(item);
  void removeFromListaStatus(String item) => listaStatus.remove(item);
  void removeAtIndexFromListaStatus(int index) => listaStatus.removeAt(index);
  void insertAtIndexInListaStatus(int index, String item) =>
      listaStatus.insert(index, item);
  void updateListaStatusAtIndex(int index, Function(String) updateFn) =>
      listaStatus[index] = updateFn(listaStatus[index]);

  List<String> intervaloInicio = ['0', '0', '0', '0', '0', '0', '0'];
  void addToIntervaloInicio(String item) => intervaloInicio.add(item);
  void removeFromIntervaloInicio(String item) => intervaloInicio.remove(item);
  void removeAtIndexFromIntervaloInicio(int index) =>
      intervaloInicio.removeAt(index);
  void insertAtIndexInIntervaloInicio(int index, String item) =>
      intervaloInicio.insert(index, item);
  void updateIntervaloInicioAtIndex(int index, Function(String) updateFn) =>
      intervaloInicio[index] = updateFn(intervaloInicio[index]);

  List<String> intervaloFinal = ['0', '0', '0', '0', '0', '0', '0'];
  void addToIntervaloFinal(String item) => intervaloFinal.add(item);
  void removeFromIntervaloFinal(String item) => intervaloFinal.remove(item);
  void removeAtIndexFromIntervaloFinal(int index) =>
      intervaloFinal.removeAt(index);
  void insertAtIndexInIntervaloFinal(int index, String item) =>
      intervaloFinal.insert(index, item);
  void updateIntervaloFinalAtIndex(int index, Function(String) updateFn) =>
      intervaloFinal[index] = updateFn(intervaloFinal[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Salao-Horarios widget.
  List<HorariosRow>? horas;
  // State field(s) for DropDown-Dom widget.
  String? dropDownDomValue;
  FormFieldController<String>? dropDownDomValueController;
  // State field(s) for Dom-inicial widget.
  FocusNode? domInicialFocusNode;
  TextEditingController? domInicialTextController;
  String? Function(BuildContext, String?)? domInicialTextControllerValidator;
  // State field(s) for Dom-final widget.
  FocusNode? domFinalFocusNode;
  TextEditingController? domFinalTextController;
  String? Function(BuildContext, String?)? domFinalTextControllerValidator;
  Completer<List<HorariosRow>>? requestCompleter;
  // State field(s) for DropDown-Seg widget.
  String? dropDownSegValue;
  FormFieldController<String>? dropDownSegValueController;
  // State field(s) for Seg-inicial widget.
  FocusNode? segInicialFocusNode;
  TextEditingController? segInicialTextController;
  String? Function(BuildContext, String?)? segInicialTextControllerValidator;
  // State field(s) for Seg-final widget.
  FocusNode? segFinalFocusNode;
  TextEditingController? segFinalTextController;
  String? Function(BuildContext, String?)? segFinalTextControllerValidator;
  // State field(s) for DropDown-Ter widget.
  String? dropDownTerValue;
  FormFieldController<String>? dropDownTerValueController;
  // State field(s) for Ter-inicial widget.
  FocusNode? terInicialFocusNode;
  TextEditingController? terInicialTextController;
  String? Function(BuildContext, String?)? terInicialTextControllerValidator;
  // State field(s) for Ter-final widget.
  FocusNode? terFinalFocusNode;
  TextEditingController? terFinalTextController;
  String? Function(BuildContext, String?)? terFinalTextControllerValidator;
  // State field(s) for DropDown-Qua widget.
  String? dropDownQuaValue;
  FormFieldController<String>? dropDownQuaValueController;
  // State field(s) for Qua-inicial widget.
  FocusNode? quaInicialFocusNode;
  TextEditingController? quaInicialTextController;
  String? Function(BuildContext, String?)? quaInicialTextControllerValidator;
  // State field(s) for Qua-final widget.
  FocusNode? quaFinalFocusNode;
  TextEditingController? quaFinalTextController;
  String? Function(BuildContext, String?)? quaFinalTextControllerValidator;
  // State field(s) for DropDown-Qui widget.
  String? dropDownQuiValue;
  FormFieldController<String>? dropDownQuiValueController;
  // State field(s) for Qui-inicial widget.
  FocusNode? quiInicialFocusNode;
  TextEditingController? quiInicialTextController;
  String? Function(BuildContext, String?)? quiInicialTextControllerValidator;
  // State field(s) for Qui-final widget.
  FocusNode? quiFinalFocusNode;
  TextEditingController? quiFinalTextController;
  String? Function(BuildContext, String?)? quiFinalTextControllerValidator;
  // State field(s) for DropDown-Sex widget.
  String? dropDownSexValue;
  FormFieldController<String>? dropDownSexValueController;
  // State field(s) for Sex-inicial widget.
  FocusNode? sexInicialFocusNode;
  TextEditingController? sexInicialTextController;
  String? Function(BuildContext, String?)? sexInicialTextControllerValidator;
  // State field(s) for Sex-final widget.
  FocusNode? sexFinalFocusNode;
  TextEditingController? sexFinalTextController;
  String? Function(BuildContext, String?)? sexFinalTextControllerValidator;
  // State field(s) for DropDown-Sab widget.
  String? dropDownSabValue;
  FormFieldController<String>? dropDownSabValueController;
  // State field(s) for Sab-inicial widget.
  FocusNode? sabInicialFocusNode;
  TextEditingController? sabInicialTextController;
  String? Function(BuildContext, String?)? sabInicialTextControllerValidator;
  // State field(s) for Sab-final widget.
  FocusNode? sabFinalFocusNode;
  TextEditingController? sabFinalTextController;
  String? Function(BuildContext, String?)? sabFinalTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    domInicialFocusNode?.dispose();
    domInicialTextController?.dispose();

    domFinalFocusNode?.dispose();
    domFinalTextController?.dispose();

    segInicialFocusNode?.dispose();
    segInicialTextController?.dispose();

    segFinalFocusNode?.dispose();
    segFinalTextController?.dispose();

    terInicialFocusNode?.dispose();
    terInicialTextController?.dispose();

    terFinalFocusNode?.dispose();
    terFinalTextController?.dispose();

    quaInicialFocusNode?.dispose();
    quaInicialTextController?.dispose();

    quaFinalFocusNode?.dispose();
    quaFinalTextController?.dispose();

    quiInicialFocusNode?.dispose();
    quiInicialTextController?.dispose();

    quiFinalFocusNode?.dispose();
    quiFinalTextController?.dispose();

    sexInicialFocusNode?.dispose();
    sexInicialTextController?.dispose();

    sexFinalFocusNode?.dispose();
    sexFinalTextController?.dispose();

    sabInicialFocusNode?.dispose();
    sabInicialTextController?.dispose();

    sabFinalFocusNode?.dispose();
    sabFinalTextController?.dispose();
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
