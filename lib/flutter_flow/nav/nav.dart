import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? LoginWidget() : CadastroWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? LoginWidget() : CadastroWidget(),
        ),
        FFRoute(
          name: 'Cliente-PerfilCliente',
          path: '/clientePerfilCliente',
          requireAuth: true,
          builder: (context, params) => ClientePerfilClienteWidget(),
        ),
        FFRoute(
          name: 'Cliente-PerfilProfissional',
          path: '/PerfilProfissional',
          builder: (context, params) => ClientePerfilProfissionalWidget(
            refProfissional: params.getParam(
              'refProfissional',
              ParamType.String,
            ),
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Cliente-ListaAvaliacoes',
          path: '/clienteListaAvaliacoes',
          builder: (context, params) => ClienteListaAvaliacoesWidget(
            refSalao: params.getParam<SalaoRow>(
              'refSalao',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'Cliente-PerfilSalao',
          path: '/clientePerfilSalao',
          builder: (context, params) => ClientePerfilSalaoWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Cliente-Favoritos',
          path: '/clienteFavoritos',
          builder: (context, params) => ClienteFavoritosWidget(),
        ),
        FFRoute(
          name: 'Profissional-Configuracoes',
          path: '/profissionalConfiguracoes',
          builder: (context, params) => ProfissionalConfiguracoesWidget(),
        ),
        FFRoute(
          name: 'Salao-AlterarPerfil',
          path: '/salaoAlterarPerfil',
          builder: (context, params) => SalaoAlterarPerfilWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Cliente-Configuracoes',
          path: '/clienteConfiguracoes',
          builder: (context, params) => ClienteConfiguracoesWidget(),
        ),
        FFRoute(
          name: 'AgendarComSalao',
          path: '/agendarComSalao',
          builder: (context, params) => AgendarComSalaoWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Salao-Configuracoes',
          path: '/Salao-Configuracoes',
          builder: (context, params) => SalaoConfiguracoesWidget(),
        ),
        FFRoute(
          name: 'Salao-Horarios',
          path: '/Salao-Horarios',
          builder: (context, params) => SalaoHorariosWidget(),
        ),
        FFRoute(
          name: 'Profissional-Horarios',
          path: '/Profissional-Horarios',
          builder: (context, params) => ProfissionalHorariosWidget(),
        ),
        FFRoute(
          name: 'EncontrarSalao',
          path: '/encontrarSalao',
          builder: (context, params) => EncontrarSalaoWidget(),
        ),
        FFRoute(
          name: 'Cadastro',
          path: '/cadastro',
          builder: (context, params) => CadastroWidget(),
        ),
        FFRoute(
          name: 'Profissional-perfil',
          path: '/profissionalPerfil',
          builder: (context, params) => ProfissionalPerfilWidget(),
        ),
        FFRoute(
          name: 'Cliente-ListaProfissionais',
          path: '/clienteListaProfissionais',
          builder: (context, params) => ClienteListaProfissionaisWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'notificacoesProfissional',
          path: '/notificacoesProfissional',
          builder: (context, params) => NotificacoesProfissionalWidget(),
        ),
        FFRoute(
          name: 'searchProfissionais',
          path: '/searchProfissionais',
          builder: (context, params) => SearchProfissionaisWidget(),
        ),
        FFRoute(
          name: 'Cliente-MinhasAvaliacoes',
          path: '/clienteMinhasAvaliacoes',
          builder: (context, params) => ClienteMinhasAvaliacoesWidget(),
        ),
        FFRoute(
          name: 'Profissional-AlterarPerfil',
          path: '/profissionalAlterarPerfil',
          builder: (context, params) => ProfissionalAlterarPerfilWidget(),
        ),
        FFRoute(
          name: 'Cliente-ServicosAgendados',
          path: '/clienteServicosAgendados',
          builder: (context, params) => ClienteServicosAgendadosWidget(),
        ),
        FFRoute(
          name: 'Salao-ConfirmarPresenca',
          path: '/salaoConfirmarPresenca',
          builder: (context, params) => SalaoConfirmarPresencaWidget(),
        ),
        FFRoute(
          name: 'Cliente-Historico',
          path: '/Cliente-Historico',
          builder: (context, params) => ClienteHistoricoWidget(),
        ),
        FFRoute(
          name: 'Cliente-Avaliacao-Salao',
          path: '/Cliente-Avaliacao-Salao',
          builder: (context, params) => ClienteAvaliacaoSalaoWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
            refProf: params.getParam(
              'refProf',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
            refAgendamento: params.getParam(
              'refAgendamento',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Profissional-Calendario',
          path: '/calendarioProfissional',
          builder: (context, params) => ProfissionalCalendarioWidget(),
        ),
        FFRoute(
          name: 'Cliente-Avaliacao-Prof',
          path: '/Cliente-Avaliacao-Prof',
          builder: (context, params) => ClienteAvaliacaoProfWidget(
            refProf: params.getParam(
              'refProf',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
            refAgendamento: params.getParam(
              'refAgendamento',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Salao-Calendario',
          path: '/calendarioSalao',
          builder: (context, params) => SalaoCalendarioWidget(),
        ),
        FFRoute(
          name: 'Cliente-ListAva-Salao',
          path: '/clienteListAvaSalao',
          builder: (context, params) => ClienteListAvaSalaoWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Salao-PerfilSalao',
          path: '/salaoPerfilSalao',
          builder: (context, params) => SalaoPerfilSalaoWidget(),
        ),
        FFRoute(
          name: 'Profissional-CompletePerfil',
          path: '/CompletePerfil',
          builder: (context, params) => ProfissionalCompletePerfilWidget(),
        ),
        FFRoute(
          name: 'Salao-CompletePerfil',
          path: '/Salao-CompletePerfil',
          builder: (context, params) => SalaoCompletePerfilWidget(),
        ),
        FFRoute(
          name: 'AgendarComProf',
          path: '/agendarComProf',
          builder: (context, params) => AgendarComProfWidget(
            refProf: params.getParam(
              'refProf',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Cliente-ListaProfissionaisCopy',
          path: '/clienteListaProfissionaisCopy',
          builder: (context, params) => ClienteListaProfissionaisCopyWidget(),
        ),
        FFRoute(
          name: 'prof-agendarClienteComSalao',
          path: '/prof-agendarClienteComSalao',
          builder: (context, params) => ProfAgendarClienteComSalaoWidget(
            refProf: params.getParam(
              'refProf',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Prof-servicosParaAgendar',
          path: '/profServicosParaAgendar',
          builder: (context, params) => ProfServicosParaAgendarWidget(
            refProf: params.getParam(
              'refProf',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Salao-servicosParaAgendar',
          path: '/salaoServicosParaAgendar',
          builder: (context, params) => SalaoServicosParaAgendarWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Salao-AgendarCliente',
          path: '/salaoAgendarCliente',
          builder: (context, params) => SalaoAgendarClienteWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EsqueciSenha',
          path: '/esqueciSenha',
          builder: (context, params) => EsqueciSenhaWidget(),
        ),
        FFRoute(
          name: 'Prof-ConfirmarPresenca',
          path: '/profConfirmarPresenca',
          builder: (context, params) => ProfConfirmarPresencaWidget(),
        ),
        FFRoute(
          name: 'EncontrarSalaoCopy',
          path: '/encontrarSalaoCopy',
          builder: (context, params) => EncontrarSalaoCopyWidget(),
        ),
        FFRoute(
          name: 'Prof-DashBoard',
          path: '/profDashBoard',
          builder: (context, params) => ProfDashBoardWidget(),
        ),
        FFRoute(
          name: 'Salao-DashBoard',
          path: '/salaoDashBoard',
          builder: (context, params) => SalaoDashBoardWidget(),
        ),
        FFRoute(
          name: 'searchProfissionaisCopy',
          path: '/searchProfissionaisCopy',
          builder: (context, params) => SearchProfissionaisCopyWidget(),
        ),
        FFRoute(
          name: 'Salao-informacoes',
          path: '/salaoInformacoes',
          builder: (context, params) => SalaoInformacoesWidget(
            refSalao: params.getParam(
              'refSalao',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'prof-agendarClienteSemSalao',
          path: '/prof-agendarClienteSemSalao',
          builder: (context, params) => ProfAgendarClienteSemSalaoWidget(
            refProf: params.getParam(
              'refProf',
              ParamType.String,
            ),
            refServico: params.getParam(
              'refServico',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/cadastro';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).tan,
                      child: Center(
                        child: Image.asset(
                          'assets/images/2775994.png',
                          width: 150.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
