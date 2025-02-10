class AppImage {
  static const String _picturePath = "assets/image/";
  static const String _iconPath = "assets/image/icon/";

  // images
  static String get auth => "${_picturePath}auth.jpg";
  static String get account => "${_picturePath}account.png";

  // icons
  static String get exit => "${_iconPath}exit.png";

  static String getCategoryPath(String categoryName) {
    return "assets/image/category_icon/$categoryName";
  }
}
