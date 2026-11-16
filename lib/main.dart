import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(const AtelierRunwayApp());
}

Color _withAlpha(Color color, double opacity) {
  return color.withAlpha((opacity.clamp(0.0, 1.0) * 255).round());
}

class AtelierRunwayApp extends StatelessWidget {
  const AtelierRunwayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ATELIER // RUNWAY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37),
          secondary: Color(0xFFF3E5AB),
          surface: Color(0xFF14141C),
        ),
        useMaterial3: true,
      ),
      home: const AtelierGameScreen(),
    );
  }
}

// ============================================================================
// DATA MODELS
// ============================================================================

enum GarmentCategory { hair, top, bottom, dress, shoes, accessory }

class RunwayTheme {
  final String id;
  final String title;
  final String city;
  final String brief;
  final List<String> targetTags;
  final Color accentColor;
  final List<Color> stageColors;

  const RunwayTheme({
    required this.id,
    required this.title,
    required this.city,
    required this.brief,
    required this.targetTags,
    required this.accentColor,
    required this.stageColors,
  });
}

class WardrobeItem {
  final String id;
  final String name;
  final GarmentCategory category;
  final List<String> tags;
  final Color primaryColor;
  final Color secondaryColor;
  final int price;
  final String styleCode;
  bool isUnlocked;

  WardrobeItem({
    required this.id,
    required this.name,
    required this.category,
    required this.tags,
    required this.primaryColor,
    required this.secondaryColor,
    required this.price,
    required this.styleCode,
    this.isUnlocked = true,
  });
}

class LookbookIssue {
  final int issueNumber;
  final String themeTitle;
  final String city;
  final int score;
  final int stars;
  final Color accentColor;
  final List<String> garmentNames;

  const LookbookIssue({
    required this.issueNumber,
    required this.themeTitle,
    required this.city,
    required this.score,
    required this.stars,
    required this.accentColor,
    required this.garmentNames,
  });
}

// ============================================================================
// MAIN GAME SCREEN
// ============================================================================

class AtelierGameScreen extends StatefulWidget {
  const AtelierGameScreen({super.key});

  @override
  State<AtelierGameScreen> createState() => _AtelierGameScreenState();
}

class _AtelierGameScreenState extends State<AtelierGame
