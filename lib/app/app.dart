import 'package:arc_phone_dex/app/app_lifecycle.dart';
import 'package:arc_phone_dex/src/features/home/view/screen/home_screen.dart';
import 'package:arc_phone_dex/src/features/splash/view/screen/splash_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'app_route.dart';

class ArcPhoneDex extends StatelessWidget {
  const ArcPhoneDex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: ProviderScope(
        child: Consumer(
          builder: (context, ref, child) {
            // final settings = ref.watch(settingsProvider);

            return PlatformApp.router(
              title: 'ArcPhone Dex',
              // locale: settings.locale,
              routeInformationParser: _router.routeInformationParser,
              routerDelegate: _router.routerDelegate,
              scrollBehavior: const ScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown,
                },
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', "US"),
                Locale('pt', "BR"),
              ],
            );
          },
        ),
      ),
    );
  }
}
