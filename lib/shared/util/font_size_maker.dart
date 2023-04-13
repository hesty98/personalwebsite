enum ResponsiveFontSize {
  headerLarge,
  headerMedium,
  headerSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  captionLarge,
  captionMedium,
  captionSmall,
}

class FontSizeMaker {
  static int fontResizeFactor = 900;

  static getCorrectFontSize(double width, double smallFont, double bigFont) {
    if (width > fontResizeFactor) return smallFont;
    return bigFont;
  }

  static getFontSize(double width, ResponsiveFontSize size) {
    switch (size) {
      case ResponsiveFontSize.headerLarge:
        return getCorrectFontSize(width, 24, 42);
      case ResponsiveFontSize.headerMedium:
        return getCorrectFontSize(width, 20, 32);
      case ResponsiveFontSize.headerSmall:
        return getCorrectFontSize(width, 16, 22);
      case ResponsiveFontSize.bodyLarge:
        return getCorrectFontSize(width, 24, 18);
      case ResponsiveFontSize.bodyMedium:
        return getCorrectFontSize(width, 20, 14);
      case ResponsiveFontSize.bodySmall:
        return getCorrectFontSize(width, 16, 12);
      case ResponsiveFontSize.captionLarge:
        return getCorrectFontSize(width, 18, 14);
      case ResponsiveFontSize.captionMedium:
        return getCorrectFontSize(width, 14, 12);
      case ResponsiveFontSize.captionSmall:
        return getCorrectFontSize(width, 12, 10);
    }
  }
}
