import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b6939),
      surfaceTint: Color(0xff3b6939),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbcf0b4),
      onPrimaryContainer: Color(0xff235024),
      secondary: Color(0xff815611),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffddb5),
      onSecondaryContainer: Color(0xff643f00),
      tertiary: Color(0xff8f4c32),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdbce),
      onTertiaryContainer: Color(0xff71361e),
      error: Color(0xff904a45),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff73332f),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbfc8ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa1d39a),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff002204),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff235024),
      secondaryFixed: Color(0xffffddb5),
      onSecondaryFixed: Color(0xff2a1800),
      secondaryFixedDim: Color(0xfff6bc70),
      onSecondaryFixedVariant: Color(0xff643f00),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff380d00),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff71361e),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff113f15),
      surfaceTint: Color(0xff3b6939),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4a7847),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4d3000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff916420),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5c260f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa05b40),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e2320),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffa15852),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff0c1213),
      onSurfaceVariant: Color(0xff2f3839),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f70),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa1d39a),
      primaryFixed: Color(0xff4a7847),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff325f31),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff916420),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff754c06),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa05b40),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff83432a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe3e9ea),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd3d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff05340b),
      surfaceTint: Color(0xff3b6939),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff265326),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff402700),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff674100),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4f1c06),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff743820),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511917),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff763631),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e2f),
      outlineVariant: Color(0xff414b4c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa1d39a),
      primaryFixed: Color(0xff265326),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0d3b11),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff674100),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff492d00),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff743820),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff58220c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4babb),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f3),
      surfaceContainer: Color(0xffdee3e5),
      surfaceContainerHigh: Color(0xffcfd5d6),
      surfaceContainerHighest: Color(0xffc2c7c9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa1d39a),
      surfaceTint: Color(0xffa1d39a),
      onPrimary: Color(0xff0a390f),
      primaryContainer: Color(0xff235024),
      onPrimaryContainer: Color(0xffbcf0b4),
      secondary: Color(0xfff6bc70),
      onSecondary: Color(0xff462b00),
      secondaryContainer: Color(0xff643f00),
      onSecondaryContainer: Color(0xffffddb5),
      tertiary: Color(0xffffb59a),
      onTertiary: Color(0xff552009),
      tertiaryContainer: Color(0xff71361e),
      onTertiaryContainer: Color(0xffffdbce),
      error: Color(0xffffb3ac),
      onError: Color(0xff571e1a),
      errorContainer: Color(0xff73332f),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff3b6939),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff002204),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff235024),
      secondaryFixed: Color(0xffffddb5),
      onSecondaryFixed: Color(0xff2a1800),
      secondaryFixedDim: Color(0xfff6bc70),
      onSecondaryFixedVariant: Color(0xff643f00),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff380d00),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff71361e),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb6eaae),
      surfaceTint: Color(0xffa1d39a),
      onPrimary: Color(0xff002d06),
      primaryContainer: Color(0xff6d9c68),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd5a3),
      onSecondary: Color(0xff372100),
      secondaryContainer: Color(0xffba8740),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd3c3),
      onTertiary: Color(0xff471602),
      tertiaryContainer: Color(0xffca7d60),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cd),
      onError: Color(0xff481311),
      errorContainer: Color(0xffcc7b74),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dee0),
      outline: Color(0xffaab4b5),
      outlineVariant: Color(0xff889294),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff255125),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff001602),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff113f15),
      secondaryFixed: Color(0xffffddb5),
      onSecondaryFixed: Color(0xff1c0e00),
      secondaryFixedDim: Color(0xfff6bc70),
      onSecondaryFixedVariant: Color(0xff4d3000),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff260700),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff5c260f),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff3f4647),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191f20),
      surfaceContainer: Color(0xff23292a),
      surfaceContainerHigh: Color(0xff2d3435),
      surfaceContainerHighest: Color(0xff393f40),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9fec1),
      surfaceTint: Color(0xffa1d39a),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9dcf96),
      onPrimaryContainer: Color(0xff000f01),
      secondary: Color(0xffffeddb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfff1b86c),
      onSecondaryContainer: Color(0xff140900),
      tertiary: Color(0xffffece6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb092),
      onTertiaryContainer: Color(0xff1c0400),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea6),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f3),
      outlineVariant: Color(0xffbbc4c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff255125),
      primaryFixed: Color(0xffbcf0b4),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa1d39a),
      onPrimaryFixedVariant: Color(0xff001602),
      secondaryFixed: Color(0xffffddb5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfff6bc70),
      onSecondaryFixedVariant: Color(0xff1c0e00),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff260700),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff4b5152),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2122),
      surfaceContainer: Color(0xff2b3133),
      surfaceContainerHigh: Color(0xff363c3e),
      surfaceContainerHighest: Color(0xff424849),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
