import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hortifrutti_app/app/core/theme/app_theme.dart';
import 'package:hortifrutti_app/app/data/providers/api.dart';
import 'package:hortifrutti_app/app/modules/dashboard/binding.dart';
import 'package:hortifrutti_app/app/modules/dashboard/page.dart';
import 'package:intl/intl.dart';

import 'app/routes/pages.dart';
import 'app/routes/routes.dart';

void main() {
  Get.put<Api>(Api());
  Intl.defaultLocale = 'pt_BR';

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.dashboard,
      theme: Apptheme.themeData,
      defaultTransition: Transition.fade,
      initialBinding: DashboardBinding(),
      getPages: AppPages.pages,
      home: const DashboardPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    ),
  );
}
