import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/resources/app_strings.dart';
import 'infrastructure/navigation/app_nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setScreenOrientation();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.darkTheme,
      title: AppStrings.appTitle,
      themeMode: ThemeMode.light,
      routerConfig: AppNav.goRouter,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: AppNav.scaffoldMessengerKey,
    );
  }
}

Future<void> setScreenOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

//  Future<void> _updateImage(ImageProvider provider) async {
//     final ColorScheme newColorScheme;
//     if (widget.loadColorScheme != null) {
//       newColorScheme = await widget.loadColorScheme!(
//         provider,
//         isLight ? Brightness.light : Brightness.dark,
//       );
//     } else {
//       newColorScheme = await ColorScheme.fromImageProvider(
//         provider: provider,
//         brightness: isLight ? Brightness.light : Brightness.dark,
//       );
//     }
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       selectedImage = DynamicColorExample.images.indexOf(provider);
//       currentColorScheme = newColorScheme;
//     });
//   }
