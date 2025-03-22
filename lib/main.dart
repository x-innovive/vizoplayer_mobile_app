import 'package:flutter/material.dart';
import 'package:vizoplayer/core/resources/app_strings.dart';
import 'package:vizoplayer/infrastructure/navigation/app_nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/themes/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
