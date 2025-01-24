import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'salao_alterar_perfil_widget.dart' show SalaoAlterarPerfilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SalaoAlterarPerfilModel
    extends FlutterFlowModel<SalaoAlterarPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  Completer<List<SalaoRow>>? requestCompleter;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for NomeSalao widget.
  FocusNode? nomeSalaoFocusNode;
  TextEditingController? nomeSalaoTextController;
  String? Function(BuildContext, String?)? nomeSalaoTextControllerValidator;
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
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeSalaoFocusNode?.dispose();
    nomeSalaoTextController?.dispose();

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
