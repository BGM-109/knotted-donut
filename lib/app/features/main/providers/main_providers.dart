import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main_providers.g.dart';

@riverpod
String getMainTopImage(GetMainTopImageRef ref) {
  return "assets/main_background.png";
}




