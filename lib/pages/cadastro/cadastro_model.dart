import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for nomeCliente widget.
  FocusNode? nomeClienteFocusNode;
  TextEditingController? nomeClienteTextController;
  String? Function(BuildContext, String?)? nomeClienteTextControllerValidator;
  // State field(s) for emailCliente widget.
  FocusNode? emailClienteFocusNode;
  TextEditingController? emailClienteTextController;
  String? Function(BuildContext, String?)? emailClienteTextControllerValidator;
  // State field(s) for senhaCliente widget.
  FocusNode? senhaClienteFocusNode;
  TextEditingController? senhaClienteTextController;
  late bool senhaClienteVisibility;
  String? Function(BuildContext, String?)? senhaClienteTextControllerValidator;
  // State field(s) for confirmaSenhaCliente widget.
  FocusNode? confirmaSenhaClienteFocusNode;
  TextEditingController? confirmaSenhaClienteTextController;
  late bool confirmaSenhaClienteVisibility;
  String? Function(BuildContext, String?)?
      confirmaSenhaClienteTextControllerValidator;
  // State field(s) for nomeSalao widget.
  FocusNode? nomeSalaoFocusNode;
  TextEditingController? nomeSalaoTextController;
  String? Function(BuildContext, String?)? nomeSalaoTextControllerValidator;
  // State field(s) for emailSalao widget.
  FocusNode? emailSalaoFocusNode;
  TextEditingController? emailSalaoTextController;
  String? Function(BuildContext, String?)? emailSalaoTextControllerValidator;
  // State field(s) for senhaSalao widget.
  FocusNode? senhaSalaoFocusNode;
  TextEditingController? senhaSalaoTextController;
  late bool senhaSalaoVisibility;
  String? Function(BuildContext, String?)? senhaSalaoTextControllerValidator;
  // State field(s) for confirmaSenhaSalao widget.
  FocusNode? confirmaSenhaSalaoFocusNode;
  TextEditingController? confirmaSenhaSalaoTextController;
  late bool confirmaSenhaSalaoVisibility;
  String? Function(BuildContext, String?)?
      confirmaSenhaSalaoTextControllerValidator;
  // State field(s) for nomeProfissional widget.
  FocusNode? nomeProfissionalFocusNode;
  TextEditingController? nomeProfissionalTextController;
  String? Function(BuildContext, String?)?
      nomeProfissionalTextControllerValidator;
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
  // State field(s) for confirmaSenhaProf widget.
  FocusNode? confirmaSenhaProfFocusNode;
  TextEditingController? confirmaSenhaProfTextController;
  late bool confirmaSenhaProfVisibility;
  String? Function(BuildContext, String?)?
      confirmaSenhaProfTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaClienteVisibility = false;
    confirmaSenhaClienteVisibility = false;
    senhaSalaoVisibility = false;
    confirmaSenhaSalaoVisibility = false;
    senhaProfissionalVisibility = false;
    confirmaSenhaProfVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeClienteFocusNode?.dispose();
    nomeClienteTextController?.dispose();

    emailClienteFocusNode?.dispose();
    emailClienteTextController?.dispose();

    senhaClienteFocusNode?.dispose();
    senhaClienteTextController?.dispose();

    confirmaSenhaClienteFocusNode?.dispose();
    confirmaSenhaClienteTextController?.dispose();

    nomeSalaoFocusNode?.dispose();
    nomeSalaoTextController?.dispose();

    emailSalaoFocusNode?.dispose();
    emailSalaoTextController?.dispose();

    senhaSalaoFocusNode?.dispose();
    senhaSalaoTextController?.dispose();

    confirmaSenhaSalaoFocusNode?.dispose();
    confirmaSenhaSalaoTextController?.dispose();

    nomeProfissionalFocusNode?.dispose();
    nomeProfissionalTextController?.dispose();

    emailProfissionalFocusNode?.dispose();
    emailProfissionalTextController?.dispose();

    senhaProfissionalFocusNode?.dispose();
    senhaProfissionalTextController?.dispose();

    confirmaSenhaProfFocusNode?.dispose();
    confirmaSenhaProfTextController?.dispose();
  }
}
