import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/core/router/router.dart' as router;
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:buon_appetito/features/home/presentation/bloc/home_bloc.dart';
import 'package:buon_appetito/features/home/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependencies/injection_dependencies.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: MaterialColor(
            mainColor.value,
            <int, Color>{
              50: Color(mainColor.value),
              100: Color(mainColor.value),
              200: Color(mainColor.value),
              300: Color(mainColor.value),
              400: Color(mainColor.value),
              500: Color(mainColor.value),
              600: Color(mainColor.value),
              700: Color(mainColor.value),
              800: Color(mainColor.value),
              900: Color(mainColor.value),
            },
          ),
        ),
        onGenerateRoute: router.Router.generateRoute,
        home: const SplashPage(),
      ),
    );
  }
}
