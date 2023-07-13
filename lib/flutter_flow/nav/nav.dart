import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/widgets/filterPages/create_tag_page.dart';
import 'package:tag_music_player/timoncode/widgets/filterPages/define_filter_page.dart';
import 'package:tag_music_player/timoncode/widgets/filterPages/filters_page.dart';
import 'package:tag_music_player/timoncode/widgets/filterPages/view_filter_page.dart';
import 'package:tag_music_player/timoncode/widgets/libraryPage/song_library_page.dart';
import 'package:tag_music_player/timoncode/widgets/popupPages/confirm_tag_deletion_popup_page.dart';
import '../flutter_flow_theme.dart';
import 'package:tag_music_player/timoncode/widgets/change_tags/changeSongTagByGroupPage.dart';
import 'package:tag_music_player/timoncode/widgets/change_tags/changeSongTagsIndividually.dart';
import 'package:tag_music_player/timoncode/widgets/change_tags/selectEditableSongTagsPage.dart';
import 'package:tag_music_player/timoncode/widgets/libraryPage/delete_songs_page.dart';
import 'package:tag_music_player/timoncode/widgets/popupPages/edit_tags_popup_page.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => QueuePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => QueuePageWidget(),
        ),
        FFRoute(
          name: 'Queue_Page',
          path: '/queuePage',
          builder: (context, params) => QueuePageWidget(),
        ),
        FFRoute(
          name: 'Filters_Page',
          path: '/filtersPage',
          builder: (context, params) => FiltersPage(),
        ),
        FFRoute(
          name: 'view_filter',
          path: '/viewFilter',
          builder: (context, params) {
            var map = params.state.extra as Map<String, PlaybackFilter>;
            PlaybackFilter filter = map['filter']!;
            return ViewFilterPage(
              filter: filter,
            );
          },
        ),
        FFRoute(
          name: 'tag_weight_page',
          path: '/tagWeightPage',
          builder: (context, params) => TagWeightPageWidget(),
        ),
        FFRoute(
          name: 'edit_tags_popup',
          path: '/editTagsPopup',
          builder: (context, params) => EditTagsPopupPage(),
        ),
        FFRoute(
          name: 'create_tag_page',
          path: '/createTagPage',
          builder: (context, params) {
            if (params.state.extra == null) {
              return CreateTagPage();
            }
            var map = params.state.extra as Map<String, Tag?>;
            Tag? tag = map['tag'];
            return CreateTagPage(
              tag: tag,
            );
          },
        ),
        FFRoute(
          name: 'queue_song_hold_popup',
          path: '/queueSongHoldPopup',
          builder: (context, params) => QueueSongHoldPopupWidget(),
        ),
        FFRoute(
          name: 'queue_edit_filter_page',
          path: '/queueEditFilterPage',
          builder: (context, params) => QueueEditFilterPageWidget(),
        ),
        FFRoute(
          name: 'define_filter_page',
          path: '/defineFilterPage',
          builder: (context, params) {
            if (params.state.extra == null) {
              return DefineFilterPage();
            }
            var map = params.state.extra as Map<String, PlaybackFilter?>;
            PlaybackFilter? pbFilter = map['filter'];
            return DefineFilterPage(
              filter: pbFilter,
            );
          },
        ),
        FFRoute(
          name: 'choose_tag_popup',
          path: '/chooseTagPopup',
          builder: (context, params) => ChooseTagPopupWidget(),
        ),
        FFRoute(
          name: 'confirm_tag_deletion_popup',
          path: '/confirmTagDeletionPopup',
          builder: (context, params) {
            var map = params.state.extra as Map<String, Tag>;
            Tag tag = map['tag']!;
            return ConfirmTagDeletionPopupPage(
              tag: tag,
            );
          },
        ),
        FFRoute(
          name: 'song_library_page',
          path: '/songLibraryPage',
          builder: (context, params) => SongLibraryPage(),
        ),
        FFRoute(
          name: 'add_songs_page',
          path: '/addSongsPage',
          builder: (context, params) => AddSongsPageWidget(),
        ),
        FFRoute(
          name: 'add_song_search_page',
          path: '/addSongSearchPage',
          builder: (context, params) => AddSongSearchPageWidget(),
        ),
        FFRoute(
          name: 'choose_song_tag_page',
          path: '/chooseSongTagPage',
          builder: (context, params) => ChooseSongTagPageWidget(),
        ),
        FFRoute(
          name: 'edit_songs_popup',
          path: '/editSongsPopup',
          builder: (context, params) => EditSongsPopupWidget(),
        ),
        FFRoute(
          name: 'select_editable_song_tags_popup',
          path: '/selectEditableSongTagsPopup',
          builder: (context, params) => SelectEditableSongTagsPage(),
        ),
        FFRoute(
            name: 'change_song_tags_individually_page',
            path: '/changeSongTagsIndividuallyPage',
            builder: (context, params) {
              var map = params.state.extra as Map<String, List<int>>;
              List<int> tagIds = map['tagIds']!;
              return ChangeSongTagsIndividuallyPage(
                tagIds: tagIds,
              );
            }),
        FFRoute(
          name: 'delete_songs_page',
          path: '/deleteSongsPage',
          builder: (context, params) => DeleteSongsPage(),
        ),
        FFRoute(
            name: 'change_songs_tags_by_group_page',
            path: '/changeSongsTagsByGroupPage',
            builder: (context, params) {
              if (params.state.extra == null) {
                return ChangeSongsTagsByGroupPage(
                  filter: SongFilter(),
                );
              }
              var map = params.state.extra as Map<String, SongFilter>;
              SongFilter filter = map['filter']!;
              return ChangeSongsTagsByGroupPage(
                filter: filter,
              );
            }),
        FFRoute(
          name: 'choose_tag_to_delete_popup',
          path: '/chooseTagToDeletePopup',
          builder: (context, params) => ChooseTagToDeletePopupWidget(),
        ),
        FFRoute(
          name: 'add_to_queue_page',
          path: '/addToQueuePage',
          builder: (context, params) => AddToQueuePageWidget(),
        ),
        FFRoute(
          name: 'trim_queue_page',
          path: '/trimQueuePage',
          builder: (context, params) => TrimQueuePageWidget(),
        ),
        FFRoute(
          name: 'control_main_page',
          path: '/controlMainPage',
          builder: (context, params) => ControlMainPageWidget(),
        ),
        FFRoute(
          name: 'control_spotify_account',
          path: '/controlSpotifyAccount',
          builder: (context, params) => ControlSpotifyAccountWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries.where((e) => e.value != null).map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap => extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey) ? extraMap[kTransitionInfoKey] as TransitionInfo : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty => state.allParams.isEmpty || (state.extraMap.length == 1 && state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) => asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value).onError((_, __) => null);
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
    ParamType type, [
    bool isList = false,
  ]) {
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
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.pageParams,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final dynamic pageParams;
  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
