import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core_ui/constants/app_strings.dart';
import 'core_ui/themes/theme.dart';
import 'main.dart';
import 'presentation/router/app_router.dart';
import 'view_model/home_screen_cubit/home_screen_cubit.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = GetIt.I.get<AppRouter>();

  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink,
    themeMode: ThemeMode.system,
  ));

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) => GetIt.I.get<HomeScreenCubit>()
        ..changeTheme(userSettingsThemeMode), // need change follow data base
      child: DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
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
                  theme: theme.light(settings.value.sourceColor),
                  darkTheme: theme.dark(settings.value.sourceColor),
                  themeMode: theme.themeMode(),
                  initialRoute: AppRouter.home,
                  onGenerateRoute: _appRouter.onGenerateRoute,
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
