import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/l10n/app_localizations_setup.dart";
import "package:imzo/core/theme/themes.dart";
import "package:imzo/features/docs/blocs/docs/docs_page_bloc.dart";
import "package:imzo/features/history/presentation/bloc/history_bloc/history_bloc.dart";
import "package:imzo/features/profile/blocs/profile_bloc/profile_page_bloc.dart";
import "package:imzo/router/app_routes.dart";
import "package:imzo/features/home/blocs/home_bloc/home_page_bloc.dart";
import "package:imzo/injector_container.dart";


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    unawaited(_firstLaunch());
  }

  Future<void> _firstLaunch() async {
    final link = await appLinks.getInitialLink();
    if (link != null) {
      final url = link.toString();
      final token = url.split('/').last;
    }
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<HistoryBloc>(create: (_) => sl<HistoryBloc>()),
          BlocProvider<DocsPageBloc>(create: (_) => sl<DocsPageBloc>()),
          BlocProvider<ProfilePageBloc>(create: (_) => sl<ProfilePageBloc>()),
          BlocProvider<HomePageBloc>(create: (_) => sl<HomePageBloc>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.options.themeMode,
          locale: context.options.locale,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        ),
      );
}
