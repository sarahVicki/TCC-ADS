import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailCliente widget.
  FocusNode? emailClienteFocusNode;
  TextEditingController? emailClienteTextController;
  String? Function(BuildContext, String?)? emailClienteTextControllerValidator;
  // State field(s) for senhaCliente widget.
  FocusNode? senhaClienteFocusNode;
  TextEditingController? senhaClienteTextController;
  late bool senhaClienteVisibility;
  String? Function(BuildContext, String?)? senhaClienteTextControllerValidator;
  // State field(s) for emailSalao widget.
  FocusNode? emailSalaoFocusNode;
  TextEditingController? emailSalaoTextController;
  String? Function(BuildContext, String?)? emailSalaoTextControllerValidator;
  // State field(s) for senhaSalao widget.
  FocusNode? senhaSalaoFocusNode;
  TextEditingController? senhaSalaoTextController;
  late bool senhaSalaoVisibility;
  String? Function(BuildContext, String?)? senhaSalaoTextControllerValidator;
  // State field(s) for emailProfissional widget.
  FocusNode? emailProfissionalFocusNode;
  TextEditingController? emailProfissionalTextController;
  String? Function(BuildContext, String?)?
      emailProfissionalTextControllerValidator;
  // State field(s) for senhaProfissional widget.
  FocusNode? senhaProfissionalFocusNode;
  TextEditingController? senhaProfissionalTextController;
  late bool senhaProfissionalVisibility;
  String? Function(BuildContext, String?)?
      senhaProfissionalTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaClienteVisibility = false;
    senhaSalaoVisibility = false;
    senhaProfissionalVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailClienteFocusNode?.dispose();
    emailClienteTextController?.dispose();

    senhaClienteFocusNode?.dispose();
    senhaClienteTextController?.dispose();

    emailSalaoFocusNode?.dispose();
    emailSalaoTextController?.dispose();

    senhaSalaoFocusNode?.dispose();
    senhaSalaoTextController?.dispose();

    emailProfissionalFocusNode?.dispose();
    emailProfissionalTextController?.dispose();

    senhaProfissionalFocusNode?.dispose();
    senhaProfissionalTextController?.dispose();
  }
}
