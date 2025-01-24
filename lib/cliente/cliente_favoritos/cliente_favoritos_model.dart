import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/sem_favoritos/sem_favoritos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cliente_favoritos_widget.dart' show ClienteFavoritosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClienteFavoritosModel extends FlutterFlowModel<ClienteFavoritosWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Cliente-Favoritos widget.
  List<FavoritosRow>? buscaFavoritos;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritos;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
