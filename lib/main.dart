import 'dart:html' as html;

import 'package:emiliano_cesare_flutter_template/core/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loggy/loggy.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  await setup();

  runApp(const App());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  _initLoggy();
  _initGoogleFonts();

  if (kIsWeb) await webSetup();

  // Notification Initializer
  // oneSignalInitializer();
}

Future<void> webSetup() async {
  setPathUrlStrategy(); // This sets the path strategy
  GoRouter.optionURLReflectsImperativeAPIs =
      true; // This is needed to change the url when using imperative navigation
  html.window.document.onDrop
      .listen((evt) => evt.preventDefault()); // Prevent drag and drop
}

void _initLoggy() {
  Loggy.initLoggy(
    logOptions: const LogOptions(
      LogLevel.all,
      stackTraceLevel: LogLevel.warning,
    ),
    logPrinter: const PrettyPrinter(),
  );
}

void _initGoogleFonts() {
  GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
