import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'esqueci_senha_widget.dart' show EsqueciSenhaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EsqueciSenhaModel extends FlutterFlowModel<EsqueciSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailRecuperacao widget.
  FocusNode? emailRecuperacaoFocusNode;
  TextEditingController? emailRecuperacaoTextController;
  String? Function(BuildContext, String?)?
      emailRecuperacaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailRecuperacaoFocusNode?.dispose();
    emailRecuperacaoTextController?.dispose();
  }
}
