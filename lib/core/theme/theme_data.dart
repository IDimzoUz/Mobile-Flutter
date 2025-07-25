part of "themes.dart";

const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Colors.white,
  // ios
  statusBarBrightness: Brightness.light,
  // android
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  extensions: const <ThemeExtension<dynamic>>[
    ThemeColors.light,
    ThemeGradients.light,
    ThemeTextStyles.light,
    ThemeCustomShapes.light,
  ],
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
    ),
  ),
  primaryColor: colorLightScheme.primary,
  colorScheme: colorLightScheme,
  dialogBackgroundColor: colorLightScheme.surface,
  scaffoldBackgroundColor: colorLightScheme.surface,
  cardColor: colorLightScheme.surface,
  canvasColor: colorLightScheme.surface,
  shadowColor: const Color(0xFF343434),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: colorLightScheme.primary,
    linearMinHeight: 3,
    linearTrackColor: const Color(0xFF343434),
    circularTrackColor: Colors.white,
  ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
    color: Color(0xFF343434),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: colorLightScheme.surface,
    surfaceTintColor: colorLightScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    interactive: true,
    thumbColor: WidgetStatePropertyAll<Color>(
      ThemeColors.light.main,
    ),
    thickness: const WidgetStatePropertyAll<double>(5),
    minThumbLength: 100,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    elevation: 1,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: Color(0xFFE6E9EF),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF32B141),
    foregroundColor: Colors.white,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    shape: CircleBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => Colors.white,
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colorLightScheme.primary.withOpacity(0.4);
          }
          return colorLightScheme.primary;
        },
      ),
      textStyle: WidgetStatePropertyAll<TextStyle>(
        ThemeTextStyles.light.buttonStyle,
      ),
      elevation: const WidgetStatePropertyAll<double>(0),
      shape: const WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => Colors.black,
      ),
      textStyle: WidgetStatePropertyAll<TextStyle>(
        ThemeTextStyles.light.buttonStyle,
      ),
      elevation: const WidgetStatePropertyAll<double>(0),
      shape: const WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: const OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: Color(0xFFEEF0F2)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: Color(0xFFEEF0F2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: colorLightScheme.primary),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: colorLightScheme.error),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: Color(0xFFEEF0F2)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: colorLightScheme.error),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    showDragHandle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    unselectedItemColor: const Color(0xFF9AA6AC),
    unselectedIconTheme: const IconThemeData(color: Color(0xFF9AA6AC)),
    selectedItemColor: colorLightScheme.primary,
    selectedIconTheme: IconThemeData(color: colorLightScheme.primary),
  ),
  tabBarTheme: TabBarThemeData(
    tabAlignment: TabAlignment.start,
    indicatorColor: colorLightScheme.primary,
    labelColor: const Color(0xFF17171C),
    unselectedLabelColor: const Color(0xFFB3BBCD),
    dividerColor: Colors.transparent,
    overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
    labelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 2.5,
        color: colorLightScheme.primary,
      ),
    ),
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    height: kToolbarHeight,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (Set<WidgetState> states) => const IconThemeData(
        color: Colors.black,
      ),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) => ThemeTextStyles.light.appBarTitle,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: systemUiOverlayStyle,
    iconTheme: const IconThemeData(color: Color(0xFF0B0C0E)),
    shadowColor: const Color(0xFF343434),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w600,
    ),
    toolbarTextStyle: ThemeTextStyles.light.appBarTitle,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: Color.fromRGBO(28, 30, 33, 0.95),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w400,
      fontSize: 34,
    ),

    /// text field title style
    titleMedium: TextStyle(
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
    titleSmall: TextStyle(
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),

    /// list tile title style
    bodyLarge: TextStyle(
      color: Color(0xFF0B0C0E),
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),

    /// list tile subtitle style
    bodyMedium: TextStyle(
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w600,
      fontSize: 15,
    ),
    displayLarge: TextStyle(
      color: Color(0xFF0B0C0E),
    ),
    displayMedium: TextStyle(
      color: Color(0xFF0B0C0E),
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    displaySmall: TextStyle(
      color: Color(0xFF0B0C0E),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  applyElevationOverlayColor: true,
  extensions: const <ThemeExtension<dynamic>>[
    ThemeColors.dark,
    ThemeGradients.dark,
    ThemeTextStyles.dark,
    ThemeCustomShapes.dark,
  ],
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  splashFactory:
      Platform.isAndroid ? InkRipple.splashFactory : NoSplash.splashFactory,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  primaryColor: colorDarkScheme.primary,
  colorScheme: colorDarkScheme,
  dialogBackgroundColor: colorDarkScheme.surface,
  scaffoldBackgroundColor: colorDarkScheme.surface,
  cardColor: colorDarkScheme.surface,
  canvasColor: colorDarkScheme.surface,
  shadowColor: const Color(0xFF343434),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
    linearMinHeight: 2,
    linearTrackColor: Colors.transparent,
    circularTrackColor: Colors.transparent,
  ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
    color: Color(0xFF343434),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: colorDarkScheme.surface,
    surfaceTintColor: colorDarkScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    interactive: true,
    thumbColor: WidgetStatePropertyAll<Color>(
      ThemeColors.light.main,
    ),
    thickness: const WidgetStatePropertyAll<double>(5),
    minThumbLength: 100,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    elevation: 1,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shadowColor: Color(0xFFE6E9EF),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF32B141),
    foregroundColor: Colors.white,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    shape: CircleBorder(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => Colors.white,
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return colorDarkScheme.primary.withOpacity(0.4);
          }
          return colorDarkScheme.primary;
        },
      ),
      textStyle:
          WidgetStatePropertyAll<TextStyle>(ThemeTextStyles.dark.buttonStyle),
      elevation: const WidgetStatePropertyAll<double>(0),
      shape: const WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) => Colors.black,
      ),
      textStyle: WidgetStatePropertyAll<TextStyle>(
        ThemeTextStyles.dark.buttonStyle,
      ),
      elevation: const WidgetStatePropertyAll<double>(0),
      shape: const WidgetStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      fixedSize: const WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    border: const OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: Color(0xFFEEF0F2)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: Color(0xFFEEF0F2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: colorDarkScheme.primary),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: colorDarkScheme.error),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: Color(0xFFEEF0F2)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppUtils.kBorderRadius8,
      borderSide: BorderSide(color: colorDarkScheme.error),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    elevation: 0,
    showDragHandle: true,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: const Color.fromRGBO(28, 30, 33, 0.95),
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: const TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      color: Color(0xFF909090),
      fontWeight: FontWeight.w500,
    ),
    unselectedItemColor: const Color(0xFF909090),
    selectedItemColor: colorDarkScheme.onPrimary,
    selectedIconTheme: IconThemeData(color: colorDarkScheme.primary),
  ),
  tabBarTheme: TabBarThemeData(
    indicatorColor: colorDarkScheme.primary,
    labelColor: Colors.white,
    dividerHeight: 0,
    unselectedLabelColor: const Color(0xFFBFBFBF),
    tabAlignment: TabAlignment.start,
    labelPadding: AppUtils.kPaddingHor6,
    dividerColor: Colors.transparent,
    overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
    labelStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    indicator: TabBarIndicator(
      color: colorDarkScheme.primary,
      radius: 3,
    ),
    indicatorSize: TabBarIndicatorSize.label,
  ),
  navigationBarTheme: NavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    height: kToolbarHeight,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
      (Set<WidgetState> states) => const IconThemeData(
        color: Colors.black,
      ),
    ),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) => ThemeTextStyles.dark.appBarTitle,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: systemUiOverlayStyle,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      fontSize: 15,
      height: 20 / 15,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    shape: ThemeCustomShapes.dark.bottomRectangleBorder,
    toolbarTextStyle: ThemeTextStyles.dark.appBarTitle,
    backgroundColor: const Color.fromRGBO(28, 30, 33, 0.95),
    surfaceTintColor: const Color.fromRGBO(28, 30, 33, 0.95),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    minVerticalPadding: 0,
    horizontalTitleGap: 10,
    contentPadding: AppUtils.kPaddingHor10,
    tileColor: Color(0xFF27292C),
    style: ListTileStyle.list,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    titleTextStyle: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 34,
    ),

    /// text field title style
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),

    /// list tile title style
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),

    /// list tile subtitle style
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 15,
    ),
    displayLarge: TextStyle(
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
    ),
  ),
);
