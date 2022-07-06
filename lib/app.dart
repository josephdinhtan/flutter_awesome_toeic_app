import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'core_ui/extensions/extensions.dart';
import 'package:get_it/get_it.dart';

import 'core_ui/constants/app_strings.dart';
import 'core_ui/theme/theme.dart';
import 'core_utils/core_utils.dart';
import 'presentation/router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = GetIt.I.get<AppRouter>();

  late ValueNotifier<ThemeSettings> settings;

  @override
  void initState() {
    super.initState();
    settings = ValueNotifier(ThemeSettings(
      themeColor: getApplicationThemeColor(),
      themeMode: getApplicationThemeMode(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return ThemeProvider(
        darkDynamic: null,
        lightDynamic: null,
        settings: settings,
        child: NotificationListener<ThemeSettingChange>(
          onNotification: (notification) {
            settings.value = notification.settings;
            return true;
          },
          child: ValueListenableBuilder<ThemeSettings>(
            valueListenable: settings,
            builder: (context, value, _) {
              final theme = ThemeProvider.of(context);
              return LayoutBuilder(builder: (context, constraints) {
                return ScreenUtilInit(
                  // designSize: constraints.isTablet
                  //     ? const Size(800, 1280)
                  //     : const Size(360, 690),
                  designSize: const Size(360, 690),
                  builder: (BuildContext context, Widget? child) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: AppStrings.appTitle,
                      // theme:
                      //     GetIt.I.get<AppTheme>(param1: ThemeMode.light).themeData,
                      // darkTheme:
                      //     GetIt.I.get<AppTheme>(param1: ThemeMode.dark).themeData,
                      // themeMode: state is HomeScreenThemeModeChange
                      //     ? state.themeMode
                      //     : ThemeMode.light,
                      theme: theme.light(settings.value.themeColor.color),
                      darkTheme: theme.dark(settings.value.themeColor.color),
                      themeMode: theme.themeMode(),
                      initialRoute: AppRouter.home,
                      onGenerateRoute: _appRouter.onGenerateRoute,
                    );
                  },
                );
              });
            },
          ),
        ),
      );
    });
  }
}
