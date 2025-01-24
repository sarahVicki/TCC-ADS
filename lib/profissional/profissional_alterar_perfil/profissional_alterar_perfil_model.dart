import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'profissional_alterar_perfil_widget.dart'
    show ProfissionalAlterarPerfilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfissionalAlterarPerfilModel
    extends FlutterFlowModel<ProfissionalAlterarPerfilWidget> {
  ///  Local state fields for this page.

  List<String> especialidadesProf = [];
  void addToEspecialidadesProf(String item) => especialidadesProf.add(item);
  void removeFromEspecialidadesProf(String item) =>
      especialidadesProf.remove(item);
  void removeAtIndexFromEspecialidadesProf(int index) =>
      especialidadesProf.removeAt(index);
  void insertAtIndexInEspecialidadesProf(int index, String item) =>
      especialidadesProf.insert(index, item);
  void updateEspecialidadesProfAtIndex(int index, Function(String) updateFn) =>
      especialidadesProf[index] = updateFn(especialidadesProf[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Completer<List<ProfissionalRow>>? requestCompleter;
  // State field(s) for NomeProf widget.
  FocusNode? nomeProfFocusNode;
  TextEditingController? nomeProfTextController;
  String? Function(BuildContext, String?)? nomeProfTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController;
  List<String>? get checkboxGroupValues => checkboxGroupValueController?.value;
  set checkboxGroupValues(List<String>? v) =>
      checkboxGroupValueController?.value = v;

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for LinkZap widget.
  FocusNode? linkZapFocusNode;
  TextEditingController? linkZapTextController;
  String? Function(BuildContext, String?)? linkZapTextControllerValidator;
  // State field(s) for LinkInsta widget.
  FocusNode? linkInstaFocusNode;
  TextEditingController? linkInstaTextController;
  String? Function(BuildContext, String?)? linkInstaTextControllerValidator;
  // State field(s) for LinkFace widget.
  FocusNode? linkFaceFocusNode;
  TextEditingController? linkFaceTextController;
  String? Function(BuildContext, String?)? linkFaceTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EnderecoRow>? enderecoOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeProfFocusNode?.dispose();
    nomeProfTextController?.dispose();

    linkZapFocusNode?.dispose();
    linkZapTextController?.dispose();

    linkInstaFocusNode?.dispose();
    linkInstaTextController?.dispose();

    linkFaceFocusNode?.dispose();
    linkFaceTextController?.dispose();
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
