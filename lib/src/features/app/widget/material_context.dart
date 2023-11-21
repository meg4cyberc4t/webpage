import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webpage/src/features/landing/widget/landing_screen.dart';

/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
class MaterialContext extends StatefulWidget {
  const MaterialContext({super.key});

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> {
  @override
  Widget build(final BuildContext context) => MaterialApp(
        restorationScopeId: 'application',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.from(
          colorScheme: const ColorScheme.dark(),
          textTheme: GoogleFonts.ubuntuCondensedTextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
            decorationColor: Colors.white,
          ),
          useMaterial3: true,
        ),
        home: const LandingScreenWidget(),
      );
}
