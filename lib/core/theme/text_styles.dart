import 'package:flutter/material.dart';

class TextStyles {
  static final display = _Display();
  static final headline = _Headline();
  static final title = _Title();
  static final label = _Label();
  static final body = _Body();

  static final fontWeights = _FontWeights();
  static final fontWeightTextStyles = _FontWeightTextStyles();
  static final fontSizes = _FontSizes();
  static final lineHeights = _LineHeights();
  static final letterSpacings = _LetterSpacing();
}

class _FontWeights {
  final thin = FontWeight.w100;
  final extraLight = FontWeight.w200;
  final light = FontWeight.w300;
  final regular = FontWeight.w400;
  final medium = FontWeight.w500;
  final semiBold = FontWeight.w600;
  final bold = FontWeight.w700;
  final extraBold = FontWeight.w800;
  final black = FontWeight.w900;
}

class _FontWeightTextStyles {
  static final fontWeight = _FontWeights();

  final displayLarge = fontWeight.regular;
  final displayMedium = fontWeight.regular;
  final displaySmall = fontWeight.regular;

  final headlineLarge = fontWeight.regular;
  final headlineMedium = fontWeight.regular;
  final headlineSmall = fontWeight.regular;

  final titleLarge = fontWeight.regular;
  final titleMedium = fontWeight.medium;
  final titleSmall = fontWeight.regular;

  final labelLarge = fontWeight.medium;
  final labelLargeProminent = fontWeight.semiBold;
  final labelMedium = fontWeight.medium;
  final labelMediumProminent = fontWeight.semiBold;
  final labelSmall = fontWeight.medium;

  final bodyLarge = fontWeight.regular;
  final bodyMedium = fontWeight.regular;
  final bodySmall = fontWeight.regular;
}

class _FontSizes {
  final double displayLarge = 57;
  final double displayMedium = 45;
  final double displaySmall = 36;

  final double headlineLarge = 32;
  final double headlineMedium = 28;
  final double headlineSmall = 24;

  final double titleLarge = 22;
  final double titleMedium = 16;
  final double titleSmall = 14;

  final double labelLarge = 14;
  final double labelMedium = 12;
  final double labelSmall = 11;

  final double bodyLarge = 16;
  final double bodyMedium = 14;
  final double bodySmall = 12;

// final double titleHero = 72;
// final double titlePage = 48;
// final double subtitle = 32;
// final double heading = 24;
// final double subheading = 20;
// final double body = 16;
// final double bodySmall = 14;
// final double bodyCode = 16;
}

class _LineHeights {
  final double displayLarge = 64;
  final double displayMedium = 52;
  final double displaySmall = 44;

  final double headlineLarge = 40;
  final double headlineMedium = 36;
  final double headlineSmall = 32;

  final double titleLarge = 28;
  final double titleMedium = 24;
  final double titleSmall = 20;

  final double labelLarge = 20;
  final double labelMedium = 16;
  final double labelSmall = 16;

  final double bodyLarge = 24;
  final double bodyMedium = 20;
  final double bodySmall = 16;

// final double titleHero = 1.2;
// final double titlePage = 1.2;
// final double subtitle = 1.2;
// final double heading = 1.2;
// final double subheading = 1.2;
// final double body = 1.4;
// final double bodySmall = 1.4;
// final double bodyCode = 1.0;
}

class _LetterSpacing {
  final double displayLarge = -0.25;
  final double displayMedium = 0;
  final double displaySmall = 0;

  final double headlineLarge = 0;
  final double headlineMedium = 0;
  final double headlineSmall = 0;

  final double titleLarge = 0;
  final double titleMedium = 0.15;
  final double titleSmall = 0.1;

  final double labelLarge = 0.1;
  final double labelMedium = 0.5;
  final double labelSmall = 0.5;

  final double bodyLarge = 0.5;
  final double bodyMedium = 0.25;
  final double bodySmall = 0.4;

// final double titleHero = 0;
// final double titlePage = 0;
// final double subtitle = 0;
// final double heading = 0;
// final double subheading = 0;
// final double body = 0;
// final double bodySmall = 0;
// final double bodyCode = 0;
}

class _Display {
  static final fontWeight = _FontWeightTextStyles();
  static final fontSize = _FontSizes();
  static final lineHeight = _LineHeights();
  static final letterSpacing = _LetterSpacing();

  final large = TextStyle(
    fontSize: fontSize.displayLarge,
    fontWeight: fontWeight.displayLarge,
    height: lineHeight.displayLarge / fontSize.displayLarge,
    letterSpacing: letterSpacing.displayLarge,
  );

  final medium = TextStyle(
    fontSize: fontSize.displayMedium,
    fontWeight: fontWeight.displayMedium,
    height: lineHeight.displayMedium / fontSize.displayMedium,
    letterSpacing: letterSpacing.displayMedium,
  );

  final small = TextStyle(
    fontSize: fontSize.displaySmall,
    fontWeight: fontWeight.displaySmall,
    height: lineHeight.displaySmall / fontSize.displaySmall,
    letterSpacing: letterSpacing.displaySmall,
  );
}

class _Headline {
  static final fontWeight = _FontWeightTextStyles();
  static final fontSize = _FontSizes();
  static final lineHeight = _LineHeights();
  static final letterSpacing = _LetterSpacing();

  final large = TextStyle(
    fontSize: fontSize.headlineLarge,
    fontWeight: fontWeight.headlineLarge,
    height: lineHeight.headlineLarge / fontSize.headlineLarge,
    letterSpacing: letterSpacing.headlineLarge,
  );

  final medium = TextStyle(
    fontSize: fontSize.headlineMedium,
    fontWeight: fontWeight.headlineMedium,
    height: lineHeight.headlineMedium / fontSize.headlineMedium,
    letterSpacing: letterSpacing.headlineMedium,
  );

  final small = TextStyle(
    fontSize: fontSize.headlineSmall,
    fontWeight: fontWeight.headlineSmall,
    height: lineHeight.headlineSmall / fontSize.headlineSmall,
    letterSpacing: letterSpacing.headlineSmall,
  );
}

class _Title {
  static final fontWeight = _FontWeightTextStyles();
  static final fontSize = _FontSizes();
  static final lineHeight = _LineHeights();
  static final letterSpacing = _LetterSpacing();

  final large = TextStyle(
    fontSize: fontSize.titleLarge,
    fontWeight: fontWeight.titleLarge,
    height: lineHeight.titleLarge / fontSize.titleLarge,
    letterSpacing: letterSpacing.titleLarge,
  );

  final medium = TextStyle(
    fontSize: fontSize.titleMedium,
    fontWeight: fontWeight.titleMedium,
    height: lineHeight.titleMedium / fontSize.titleMedium,
    letterSpacing: letterSpacing.titleMedium,
  );

  final small = TextStyle(
    fontSize: fontSize.titleSmall,
    fontWeight: fontWeight.titleSmall,
    height: lineHeight.titleSmall / fontSize.titleSmall,
    letterSpacing: letterSpacing.titleSmall,
  );
}

class _Label {
  static final fontWeight = _FontWeightTextStyles();
  static final fontSize = _FontSizes();
  static final lineHeight = _LineHeights();
  static final letterSpacing = _LetterSpacing();

  final large = TextStyle(
    fontSize: fontSize.labelLarge,
    fontWeight: fontWeight.labelLarge,
    height: lineHeight.labelLarge / fontSize.labelLarge,
    letterSpacing: letterSpacing.labelLarge,
  );

  final largeProminent = TextStyle(
    fontSize: fontSize.labelLarge,
    fontWeight: fontWeight.labelLargeProminent,
    height: lineHeight.labelLarge / fontSize.labelLarge,
    letterSpacing: letterSpacing.labelLarge,
  );

  final medium = TextStyle(
    fontSize: fontSize.labelMedium,
    fontWeight: fontWeight.labelMedium,
    height: lineHeight.labelMedium / fontSize.labelMedium,
    letterSpacing: letterSpacing.labelMedium,
  );

  final mediumProminent = TextStyle(
    fontSize: fontSize.labelMedium,
    fontWeight: fontWeight.labelMediumProminent,
    height: lineHeight.labelMedium / fontSize.labelMedium,
    letterSpacing: letterSpacing.labelMedium,
  );

  final small = TextStyle(
    fontSize: fontSize.labelSmall,
    fontWeight: fontWeight.labelSmall,
    height: lineHeight.labelSmall / fontSize.labelSmall,
    letterSpacing: letterSpacing.labelSmall,
  );
}

class _Body {
  static final fontWeight = _FontWeightTextStyles();
  static final fontSize = _FontSizes();
  static final lineHeight = _LineHeights();
  static final letterSpacing = _LetterSpacing();

  final large = TextStyle(
    fontSize: fontSize.bodyLarge,
    fontWeight: fontWeight.bodyLarge,
    height: lineHeight.bodyLarge / fontSize.bodyLarge,
    letterSpacing: letterSpacing.bodyLarge,
  );

  final medium = TextStyle(
    fontSize: fontSize.bodyMedium,
    fontWeight: fontWeight.bodyMedium,
    height: lineHeight.bodyMedium / fontSize.bodyMedium,
    letterSpacing: letterSpacing.bodyMedium,
  );

  final small = TextStyle(
    fontSize: fontSize.bodySmall,
    fontWeight: fontWeight.bodySmall,
    height: lineHeight.bodySmall / fontSize.bodySmall,
    letterSpacing: letterSpacing.bodySmall,
  );
}
