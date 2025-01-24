import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cliente_avaliacao_salao_widget.dart' show ClienteAvaliacaoSalaoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClienteAvaliacaoSalaoModel
    extends FlutterFlowModel<ClienteAvaliacaoSalaoWidget> {
  ///  Local state fields for this page.

  String? imagem =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg';

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingSalao widget.
  double? ratingSalaoValue;
  // State field(s) for TextFieldSalao widget.
  FocusNode? textFieldSalaoFocusNode;
  TextEditingController? textFieldSalaoTextController;
  String? Function(BuildContext, String?)?
      textFieldSalaoTextControllerValidator;
  // State field(s) for RatingProf widget.
  double? ratingProfValue;
  // State field(s) for TextFieldProf widget.
  FocusNode? textFieldProfFocusNode;
  TextEditingController? textFieldProfTextController;
  String? Function(BuildContext, String?)? textFieldProfTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSalaoFocusNode?.dispose();
    textFieldSalaoTextController?.dispose();

    textFieldProfFocusNode?.dispose();
    textFieldProfTextController?.dispose();
  }
}
