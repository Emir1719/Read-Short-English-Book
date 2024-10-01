import 'package:easy_localization/easy_localization.dart';

final class AppString {
  static final instance = AppString._();

  AppString._();

  factory AppString() => instance;

  static error(String message) => "error.e".tr(namedArgs: {"message": message});
}
