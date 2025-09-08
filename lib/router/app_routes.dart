// import "package:chuck_interceptor/chuck_interceptor.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:imzo/core/connectivity/network_info.dart";
import "package:imzo/core/local_source/local_source.dart";
import "package:imzo/features/auth/data/login/login_user_response.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/auth/presentation/otp/otp_page.dart";
import "package:imzo/features/auth/presentation/pages/auth_page.dart";
import "package:imzo/features/auth/presentation/public_oferta/public_offer_page.dart";
import "package:imzo/features/docs/blocs/create_formalization/create_formalization_bloc.dart";
import "package:imzo/features/docs/blocs/create_formalization_detail/create_formalization_detail_bloc.dart";
import "package:imzo/features/docs/blocs/formalization/formalization_bloc.dart";
import "package:imzo/features/docs/blocs/my_paid/my_paid_bloc.dart";
import "package:imzo/features/docs/blocs/select_lang_docs/select_lang_docs_bloc.dart";
import "package:imzo/features/docs/blocs/select_payment_verify/select_payment_verify_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/docs/presentation/create_formalization/create_formalization_page.dart";
import "package:imzo/features/docs/presentation/create_formalization_detail/create_formalization_detail_page.dart";
import "package:imzo/features/docs/presentation/create_otp/create_otp_page.dart";
import "package:imzo/features/docs/presentation/formalization/formalization_page.dart";
import "package:imzo/features/docs/presentation/my_paid/my_paid_page.dart";
import "package:imzo/features/docs/presentation/select_lang_docs/select_lang_docs_page.dart";
import "package:imzo/features/docs/presentation/select_payment_verify/select_payment_verify_page.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_bloc.dart";
import "package:imzo/features/history/presentation/bloc/history_bloc/history_bloc.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";
import "package:imzo/features/history/presentation/pages/contract_detail_for_me/contract_detail_for_me_page.dart";
import "package:imzo/features/history/presentation/pages/contract_detail_my_created/contract_detail_my_creator_page.dart";
import "package:imzo/features/history/presentation/pages/history_detail/history_detail_page.dart";
import "package:imzo/features/history/presentation/pages/history_page.dart";
import "package:imzo/features/home/blocs/home_bloc/home_page_bloc.dart";
import "package:imzo/features/home/blocs/notification_bloc/notification_bloc.dart";
import "package:imzo/features/home/model/news_response.dart";
import "package:imzo/features/home/presentation/home_page.dart";
import "package:imzo/features/home/presentation/news_detail/news_detail_page.dart";
import "package:imzo/features/home/presentation/notification/notification_page.dart";
import "package:imzo/features/main/presentation/bloc/main_bloc.dart";
import "package:imzo/features/main/presentation/pages/main_page.dart";
import "package:imzo/features/others/presentation/pages/internet_connection/internet_connection_page.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/splash/splash_page.dart";
import "package:imzo/features/profile/blocs/history_balance_bloc/history_balance_bloc.dart";
import "package:imzo/features/profile/blocs/identification_bloc/identification_bloc.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
import "package:imzo/features/profile/presentation/edit_profile/edit_profile_page.dart";
import "package:imzo/features/profile/presentation/identification/identification_page.dart";
import "package:imzo/injector_container.dart";
import "package:package_info_plus/package_info_plus.dart";

import "../features/profile/presentation/history_balans/history_balans_page.dart";
part "name_routes.dart";

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final PackageInfo packageInfo = sl<PackageInfo>();
final NetworkInfo networkInfo = sl<NetworkInfo>();
final LocalSource localSource = sl<LocalSource>();

// final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.initial,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.noInternet,
      name: Routes.noInternet,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const InternetConnectionPage(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (
        _,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) => BlocProvider<MainBloc>(
        key: state.pageKey,
        create: (_) => sl<MainBloc>(),
        child: MainPage(
          key: state.pageKey,
          navigationShell: navigationShell,
        ),
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.explore,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.explore,
              name: Routes.explore,
              builder: (_, __) =>
                 BlocProvider<HomePageBloc>(
                 create: (_) => sl<HomePageBloc>(),
                   child: const HomePage(),
                 ),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.history,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.history,
              name: Routes.history,
              builder: (_, __) => BlocProvider<HistoryBloc>(
                  create: (_)=>sl<HistoryBloc>(),
                  child: const HistoryPage()),
            ),
          ],
        ),
      ],
    ),




    /// Auth
    GoRoute(
      path: Routes.auth,
      name: Routes.auth,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider<AuthBloc>(
        create: (_) => sl<AuthBloc>(),
        child: const AuthPage(),
      ),
    ),

    GoRoute(
      path: Routes.languagePage,
      name: Routes.languagePage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const LanguagePage(),
    ),

    GoRoute(
      path: Routes.selectLangDocs,
      name: Routes.selectLangDocs,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<SelectLangDocsBloc>(
              create: (_) => sl<SelectLangDocsBloc>(),
              child: SelectLangDocsPage(id: state.extra! as int)
          )
      ),
    ),

    GoRoute(
      path: Routes.formalizationPage,
      name: Routes.formalizationPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<FormalizationBloc>(
            create: (_) => sl<FormalizationBloc>(),
            child: FormalizationPage(contractIDModel: state.extra! as ContractIDModel)
          )
      ),
    ),

    GoRoute(
      path: Routes.createFormalizationPage,
      name: Routes.createFormalizationPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<CreateFormalizationBloc>(
            create: (_) => sl<CreateFormalizationBloc>(),
            child: CreateFormalizationPage(contractIDModel: state.extra! as ContractIDModel)
          )
      ),
    ),

    GoRoute(
      path: Routes.createFormalizationDetailPage,
      name: Routes.createFormalizationDetailPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<CreateFormalizationDetailBloc>(
              create: (_) => sl<CreateFormalizationDetailBloc>(),
              child: CreateFormalizationDetailPage(response: state.extra! as CreateContractsResponse)
          )
      ),
    ),


    GoRoute(
      path: Routes.newsDetailPage,
      name: Routes.newsDetailPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: NewsDetailPage(newsDetail: state.extra! as NewsResponse)
      ),
    ),


    GoRoute(
      path: Routes.myPaid,
      name: Routes.myPaid,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<MyPaidBloc>(
              create: (_) => sl<MyPaidBloc>(),
              child: MyPaidPage(paidModel: state.extra! as PaidModel)
          )
      ),
    ),

    GoRoute(
      path: Routes.selectPaymentVerifyPage,
      name: Routes.selectPaymentVerifyPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<SelectPaymentVerifyBloc>(
              create: (_) => sl<SelectPaymentVerifyBloc>(),
              child: SelectPaymentVerifyPage(response: state.extra! as CreateContractsResponse)
          )
      ),

    ),

    GoRoute(
      path: Routes.createOtpPage,
      name: Routes.createOtpPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<OtpBloc>(
            create: (_) => sl<OtpBloc>(),
            child: CreateOtpPage(createContractsResponse: state.extra! as CreateContractsResponse)
          )
      ),
    ),

    GoRoute(
      path: Routes.historyBalansPage,
      name: Routes.historyBalansPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider<HistoryBalanceBloc>(
            create: (_) => sl<HistoryBalanceBloc>(),
            child: const HistoryBalansPage()
        )
    ),


    GoRoute(
      path: Routes.otpPage,
      name: Routes.otpPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<OtpBloc>(
              create: (_) => sl<OtpBloc>(),
              child: OtpPage(data: state.extra! as LoginResponse)
          )
      ),
    ),

    GoRoute(
      path: Routes.publicOfferPage,
      name: Routes.publicOfferPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const PublicOfferPage(),
    ),

    GoRoute(
      path: Routes.identificationPage,
      name: Routes.identificationPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider<IdentificationBloc>(
        create: (_) => sl<IdentificationBloc>(),
        child: const IdentificationPage()
      )
    ),

    GoRoute(
      path: Routes.notificationPage,
      name: Routes.notificationPage,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => BlocProvider<NotificationBloc>(
        create: (_) => sl<NotificationBloc>(),
        child: const NotificationPage()
      )
    ),

    GoRoute(
      path: Routes.historyDetailPage,
      name: Routes.historyDetailPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: HistoryDetailPage(dataResponse: state.extra! as ForMeHistoryResponse)
      ),
    ),

    GoRoute(
      path: Routes.editProfilePage,
      name: Routes.editProfilePage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: EditProfilePage(data: state.extra! as UserMeResponse)
      ),
    ),

    GoRoute(
      path: Routes.contractDetailForMePage,
      name: Routes.contractDetailForMePage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<ContractDetailBloc>(
              create: (_) => sl<ContractDetailBloc>(),
              child: ContractDetailForMePage(dataResponse: state.extra! as ForMeHistoryResponse)
          )
      ),
    ),

    GoRoute(
      path: Routes.contractDetailMyCreatorPage,
      name: Routes.contractDetailMyCreatorPage,
      parentNavigatorKey: rootNavigatorKey,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: BlocProvider<ContractDetailBloc>(
              create: (_) => sl<ContractDetailBloc>(),
              child: ContractDetailMyCreatorPage(dataResponse: state.extra! as ForMeHistoryResponse)
          )
      ),
    ),



  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      transitionsBuilder: (_, a1, a2, child) => SlideTransition(
        position: t1.animate(a1),
        child: child,
      ),
    );
Tween<Offset> t1 = Tween<Offset>(
  begin: const Offset(1, 0),
  end: Offset.zero,
);