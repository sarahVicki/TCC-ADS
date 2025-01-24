import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/sem_avaliacao/sem_avaliacao_widget.dart';
import '/componentes/sem_profissional/sem_profissional_widget.dart';
import '/componentes/sem_servico/sem_servico_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cliente_perfil_salao_widget.dart' show ClientePerfilSalaoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClientePerfilSalaoModel
    extends FlutterFlowModel<ClientePerfilSalaoWidget> {
  ///  Local state fields for this page.

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

  int? diaAtual;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Cliente-PerfilSalao widget.
  List<FavoritosRow>? loadFav;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritos;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
