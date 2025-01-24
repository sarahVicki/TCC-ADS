import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'profissional_horarios_widget.dart' show ProfissionalHorariosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfissionalHorariosModel
    extends FlutterFlowModel<ProfissionalHorariosWidget> {
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

  List<String> localTrabalho = ['0', '0', '0', '0', '0', '0', '0'];
  void addToLocalTrabalho(String item) => localTrabalho.add(item);
  void removeFromLocalTrabalho(String item) => localTrabalho.remove(item);
  void removeAtIndexFromLocalTrabalho(int index) =>
      localTrabalho.removeAt(index);
  void insertAtIndexInLocalTrabalho(int index, String item) =>
      localTrabalho.insert(index, item);
  void updateLocalTrabalhoAtIndex(int index, Function(String) updateFn) =>
      localTrabalho[index] = updateFn(localTrabalho[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Profissional-Horarios widget.
  List<HorariosRow>? horasProf;
  // State field(s) for DropDown-Dom widget.
  String? dropDownDomValue;
  FormFieldController<String>? dropDownDomValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for Dom-inicial widget.
  FocusNode? domInicialFocusNode;
  TextEditingController? domInicialTextController;
  String? Function(BuildContext, String?)? domInicialTextControllerValidator;
  // State field(s) for Dom-final widget.
  FocusNode? domFinalFocusNode;
  TextEditingController? domFinalTextController;
  String? Function(BuildContext, String?)? domFinalTextControllerValidator;
  // State field(s) for Dom-inter-inicial widget.
  FocusNode? domInterInicialFocusNode;
  TextEditingController? domInterInicialTextController;
  String? Function(BuildContext, String?)?
      domInterInicialTextControllerValidator;
  // State field(s) for Dom-inter-final widget.
  FocusNode? domInterFinalFocusNode;
  TextEditingController? domInterFinalTextController;
  String? Function(BuildContext, String?)? domInterFinalTextControllerValidator;
  Completer<List<HorariosRow>>? requestCompleter;
  // State field(s) for DropDown-Seg widget.
  String? dropDownSegValue;
  FormFieldController<String>? dropDownSegValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for Seg-inicial widget.
  FocusNode? segInicialFocusNode;
  TextEditingController? segInicialTextController;
  String? Function(BuildContext, String?)? segInicialTextControllerValidator;
  // State field(s) for Seg-final widget.
  FocusNode? segFinalFocusNode;
  TextEditingController? segFinalTextController;
  String? Function(BuildContext, String?)? segFinalTextControllerValidator;
  // State field(s) for Seg-inter-inicial widget.
  FocusNode? segInterInicialFocusNode;
  TextEditingController? segInterInicialTextController;
  String? Function(BuildContext, String?)?
      segInterInicialTextControllerValidator;
  // State field(s) for Seg-inter-final widget.
  FocusNode? segInterFinalFocusNode;
  TextEditingController? segInterFinalTextController;
  String? Function(BuildContext, String?)? segInterFinalTextControllerValidator;
  // State field(s) for DropDown-Ter widget.
  String? dropDownTerValue;
  FormFieldController<String>? dropDownTerValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // State field(s) for Ter-inicial widget.
  FocusNode? terInicialFocusNode;
  TextEditingController? terInicialTextController;
  String? Function(BuildContext, String?)? terInicialTextControllerValidator;
  // State field(s) for Ter-final widget.
  FocusNode? terFinalFocusNode;
  TextEditingController? terFinalTextController;
  String? Function(BuildContext, String?)? terFinalTextControllerValidator;
  // State field(s) for Ter-inter-inicial widget.
  FocusNode? terInterInicialFocusNode;
  TextEditingController? terInterInicialTextController;
  String? Function(BuildContext, String?)?
      terInterInicialTextControllerValidator;
  // State field(s) for Ter-inter-final widget.
  FocusNode? terInterFinalFocusNode;
  TextEditingController? terInterFinalTextController;
  String? Function(BuildContext, String?)? terInterFinalTextControllerValidator;
  // State field(s) for DropDown-Qua widget.
  String? dropDownQuaValue;
  FormFieldController<String>? dropDownQuaValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;
  // State field(s) for Qua-inicial widget.
  FocusNode? quaInicialFocusNode;
  TextEditingController? quaInicialTextController;
  String? Function(BuildContext, String?)? quaInicialTextControllerValidator;
  // State field(s) for Qua-final widget.
  FocusNode? quaFinalFocusNode;
  TextEditingController? quaFinalTextController;
  String? Function(BuildContext, String?)? quaFinalTextControllerValidator;
  // State field(s) for Qua-inter-inicial widget.
  FocusNode? quaInterInicialFocusNode;
  TextEditingController? quaInterInicialTextController;
  String? Function(BuildContext, String?)?
      quaInterInicialTextControllerValidator;
  // State field(s) for Qua-inter-final widget.
  FocusNode? quaInterFinalFocusNode;
  TextEditingController? quaInterFinalTextController;
  String? Function(BuildContext, String?)? quaInterFinalTextControllerValidator;
  // State field(s) for DropDown-Qui widget.
  String? dropDownQuiValue;
  FormFieldController<String>? dropDownQuiValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController5;
  // State field(s) for Qui-inicial widget.
  FocusNode? quiInicialFocusNode;
  TextEditingController? quiInicialTextController;
  String? Function(BuildContext, String?)? quiInicialTextControllerValidator;
  // State field(s) for Qui-final widget.
  FocusNode? quiFinalFocusNode;
  TextEditingController? quiFinalTextController;
  String? Function(BuildContext, String?)? quiFinalTextControllerValidator;
  // State field(s) for Qui-inter-inicial widget.
  FocusNode? quiInterInicialFocusNode;
  TextEditingController? quiInterInicialTextController;
  String? Function(BuildContext, String?)?
      quiInterInicialTextControllerValidator;
  // State field(s) for Qui-inter-final widget.
  FocusNode? quiInterFinalFocusNode;
  TextEditingController? quiInterFinalTextController;
  String? Function(BuildContext, String?)? quiInterFinalTextControllerValidator;
  // State field(s) for DropDown-Sex widget.
  String? dropDownSexValue;
  FormFieldController<String>? dropDownSexValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController6;
  // State field(s) for Sex-inicial widget.
  FocusNode? sexInicialFocusNode;
  TextEditingController? sexInicialTextController;
  String? Function(BuildContext, String?)? sexInicialTextControllerValidator;
  // State field(s) for Sex-final widget.
  FocusNode? sexFinalFocusNode;
  TextEditingController? sexFinalTextController;
  String? Function(BuildContext, String?)? sexFinalTextControllerValidator;
  // State field(s) for Sex-inter-inicial widget.
  FocusNode? sexInterInicialFocusNode;
  TextEditingController? sexInterInicialTextController;
  String? Function(BuildContext, String?)?
      sexInterInicialTextControllerValidator;
  // State field(s) for Sex-inter-final widget.
  FocusNode? sexInterFinalFocusNode;
  TextEditingController? sexInterFinalTextController;
  String? Function(BuildContext, String?)? sexInterFinalTextControllerValidator;
  // State field(s) for DropDown-Sab widget.
  String? dropDownSabValue;
  FormFieldController<String>? dropDownSabValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController7;
  // State field(s) for Sab-inicial widget.
  FocusNode? sabInicialFocusNode;
  TextEditingController? sabInicialTextController;
  String? Function(BuildContext, String?)? sabInicialTextControllerValidator;
  // State field(s) for Sab-final widget.
  FocusNode? sabFinalFocusNode;
  TextEditingController? sabFinalTextController;
  String? Function(BuildContext, String?)? sabFinalTextControllerValidator;
  // State field(s) for Sab-inter-inicial widget.
  FocusNode? sabInterInicialFocusNode;
  TextEditingController? sabInterInicialTextController;
  String? Function(BuildContext, String?)?
      sabInterInicialTextControllerValidator;
  // State field(s) for Sab-inter-final widget.
  FocusNode? sabInterFinalFocusNode;
  TextEditingController? sabInterFinalTextController;
  String? Function(BuildContext, String?)? sabInterFinalTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    domInicialFocusNode?.dispose();
    domInicialTextController?.dispose();

    domFinalFocusNode?.dispose();
    domFinalTextController?.dispose();

    domInterInicialFocusNode?.dispose();
    domInterInicialTextController?.dispose();

    domInterFinalFocusNode?.dispose();
    domInterFinalTextController?.dispose();

    segInicialFocusNode?.dispose();
    segInicialTextController?.dispose();

    segFinalFocusNode?.dispose();
    segFinalTextController?.dispose();

    segInterInicialFocusNode?.dispose();
    segInterInicialTextController?.dispose();

    segInterFinalFocusNode?.dispose();
    segInterFinalTextController?.dispose();

    terInicialFocusNode?.dispose();
    terInicialTextController?.dispose();

    terFinalFocusNode?.dispose();
    terFinalTextController?.dispose();

    terInterInicialFocusNode?.dispose();
    terInterInicialTextController?.dispose();

    terInterFinalFocusNode?.dispose();
    terInterFinalTextController?.dispose();

    quaInicialFocusNode?.dispose();
    quaInicialTextController?.dispose();

    quaFinalFocusNode?.dispose();
    quaFinalTextController?.dispose();

    quaInterInicialFocusNode?.dispose();
    quaInterInicialTextController?.dispose();

    quaInterFinalFocusNode?.dispose();
    quaInterFinalTextController?.dispose();

    quiInicialFocusNode?.dispose();
    quiInicialTextController?.dispose();

    quiFinalFocusNode?.dispose();
    quiFinalTextController?.dispose();

    quiInterInicialFocusNode?.dispose();
    quiInterInicialTextController?.dispose();

    quiInterFinalFocusNode?.dispose();
    quiInterFinalTextController?.dispose();

    sexInicialFocusNode?.dispose();
    sexInicialTextController?.dispose();

    sexFinalFocusNode?.dispose();
    sexFinalTextController?.dispose();

    sexInterInicialFocusNode?.dispose();
    sexInterInicialTextController?.dispose();

    sexInterFinalFocusNode?.dispose();
    sexInterFinalTextController?.dispose();

    sabInicialFocusNode?.dispose();
    sabInicialTextController?.dispose();

    sabFinalFocusNode?.dispose();
    sabFinalTextController?.dispose();

    sabInterInicialFocusNode?.dispose();
    sabInterInicialTextController?.dispose();

    sabInterFinalFocusNode?.dispose();
    sabInterFinalTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
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

  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
  String? get radioButtonValue5 => radioButtonValueController5?.value;
  String? get radioButtonValue6 => radioButtonValueController6?.value;
  String? get radioButtonValue7 => radioButtonValueController7?.value;
}
