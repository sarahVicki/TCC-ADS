import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/confirmacao_excluir/confirmacao_excluir_widget.dart';
import '/componentes/sem_avaliacao/sem_avaliacao_widget.dart';
import '/componentes/sem_servico/sem_servico_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/profissional/prof_criar_servico/prof_criar_servico_widget.dart';
import '/profissional/prof_editar_servico/prof_editar_servico_widget.dart';
import '/profissional/profissional_nav_bar_perfil/profissional_nav_bar_perfil_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'profissional_perfil_widget.dart' show ProfissionalPerfilWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfissionalPerfilModel
    extends FlutterFlowModel<ProfissionalPerfilWidget> {
  ///  Local state fields for this page.

  int? diaAtual;

  bool statusHorario = false;

  List<String> especialidades = [];
  void addToEspecialidades(String item) => especialidades.add(item);
  void removeFromEspecialidades(String item) => especialidades.remove(item);
  void removeAtIndexFromEspecialidades(int index) =>
      especialidades.removeAt(index);
  void insertAtIndexInEspecialidades(int index, String item) =>
      especialidades.insert(index, item);
  void updateEspecialidadesAtIndex(int index, Function(String) updateFn) =>
      especialidades[index] = updateFn(especialidades[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  Completer<List<ServicosRow>>? requestCompleter;
  // Model for Profissional-NavBar-Perfil component.
  late ProfissionalNavBarPerfilModel profissionalNavBarPerfilModel;

  @override
  void initState(BuildContext context) {
    profissionalNavBarPerfilModel =
        createModel(context, () => ProfissionalNavBarPerfilModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    profissionalNavBarPerfilModel.dispose();
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
