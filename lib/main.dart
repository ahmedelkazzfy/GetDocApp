import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalassiss/core/routing/routes.dart';
import 'package:medicalassiss/core/routing/routes_name.dart';
import 'package:medicalassiss/core/languagechanger/controller/language_change_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String? languageCode =
      sp.getString('language_code'); // Use nullable type
  try {
    await dotenv.load(fileName: ".env");
    await Supabase.initialize(
      url: dotenv.env["SUPABASE_PROJECT_URL"].toString(),
      anonKey: dotenv.env["SUPABASE_API_KEY"].toString(),
    );
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(MyApp(
    locale: languageCode ??
        'en', // Provide a default language code, e.g., 'en' for English
  ));
}

enum Language { english, arabic }

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChangeController()),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          if (locale.isEmpty) {
            provider.changeLanguage(const Locale('en'));
          }
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            child: Builder(
              builder: (_) => MaterialApp(
                builder: (context, widget) {
                  final mediaQueryData = MediaQuery.of(context);
                  final scaledMediaQueryData = mediaQueryData.copyWith(
                    textScaler: TextScaler.noScaling,
                  );
                  return MediaQuery(
                    data: scaledMediaQueryData,
                    child: widget!,
                  );
                },
                debugShowCheckedModeBanner: false,
                title: 'Mediacal-Assisstant',
                theme: ThemeData(
                  scaffoldBackgroundColor:
                      const Color.fromARGB(255, 248, 248, 248),
                  appBarTheme: const AppBarTheme(
                    color: Color.fromARGB(255, 247, 242, 242),
                  ),
                  progressIndicatorTheme: const ProgressIndicatorThemeData(
                    color:
                        Colors.orange, // Set circular progress color to orange
                  ),
                  useMaterial3: true,
                ),
                locale: locale == ''
                    ? const Locale('en')
                    : provider.appLocale ?? const Locale('en'),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English
                  Locale('ar'), // Arabic
                ],
                // home: const SplashScreen(),
                initialRoute: RoutesName.splash,
                onGenerateRoute: Routes.generateRoute,
              ),
            ),
          );
        },
      ),
    );
  }
}
