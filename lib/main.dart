import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // 사용자 설정을 여러 Flutter 위젯에 연결하는 SettingsController를 설정합니다.
  final settingsController = SettingsController(SettingsService());

  // 앱이 표시될 때 사용자의 기본 테마를 로드합니다.
  // 이렇게하면 앱이 처음 표시될 때 테마 변경이 갑작스럽게 발생하지 않습니다.
  await settingsController.loadSettings();

  // 앱을 실행하고 SettingsController를 전달합니다.
  // 앱은 SettingsController의 변경 사항을 듣고, SettingsView로 전달합니다.
  runApp(MyApp(settingsController: settingsController));
}
