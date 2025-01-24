import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
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
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cliente_perfil_profissional_widget.dart'
    show ClientePerfilProfissionalWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientePerfilProfissionalModel
    extends FlutterFlowModel<ClientePerfilProfissionalWidget> {
  ///  Local state fields for this page.

  int? diaAtual;

  bool statusHorario = false;

  List<FavoritosRow> listaFavoritos = [];
  void addToListaFavoritos(FavoritosRow item) => listaFavoritos.add(item);
  void removeFromListaFavoritos(FavoritosRow item) =>
      listaFavoritos.remove(item);
  void removeAtIndexFromListaFavoritos(int index) =>
      listaFavoritos.removeAt(index);
  void insertAtIndexInListaFavoritos(int index, FavoritosRow item) =>
      listaFavoritos.insert(index, item);
  void updateListaFavoritosAtIndex(
          int index, Function(FavoritosRow) updateFn) =>
      listaFavoritos[index] = updateFn(listaFavoritos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Cliente-PerfilProfissional widget.
  List<FavoritosRow>? loadProfFav;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritosProf;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritosProf;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
