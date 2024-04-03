import 'package:flutter/material.dart';

import 'settings_service.dart';

/// 여러 위젯이 상호 작용하여 사용자 설정을 읽거나 업데이트하거나 사용자 설정 변경을 청취할 수있는 클래스입니다.
///
/// 컨트롤러는 데이터 서비스를 Flutter 위젯에 연결합니다. SettingsController는 사용자 설정을 저장하고 검색하는 데 SettingsService를 사용합니다.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // 직접 사용되지 않도록 SettingsService를 비공개 변수로 만듭니다.
  final SettingsService _settingsService;

  // 직접 업데이트되지 않도록 ThemeMode를 비공개 변수로 만듭니다. 변경 사항을 SettingsService와 함께 지속시키지 않으면 변경하지 않습니다.
  late ThemeMode _themeMode;

  // 위젯이 사용자의 기본 ThemeMode를 읽을 수 있도록 허용합니다.
  ThemeMode get themeMode => _themeMode;

  /// 사용자의 설정을 SettingsService에서로드합니다. 로컬 데이터베이스 또는 인터넷에서 로드 될 수 있습니다. 컨트롤러는 설정을 서비스에서로드 할 수 있다는 것만 압니다.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();

    // 중요! 변경 사항이 발생했음을 청취자에게 알립니다.
    notifyListeners();
  }

  /// 사용자의 선택에 따라 ThemeMode를 업데이트하고 지속시킵니다.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // 새 ThemeMode와 이전 ThemeMode가 동일한 경우 아무 작업도 수행하지 않습니다.
    if (newThemeMode == _themeMode) return;

    // 그렇지 않으면, 새 ThemeMode를 메모리에 저장합니다.
    _themeMode = newThemeMode;

    // 중요! 변경 사항이 발생했음을 청취자에게 알립니다.
    notifyListeners();

    // 설정을 로컬 데이터베이스 또는 인터넷에 지속시킵니다. SettingService를 사용합니다.
    await _settingsService.updateThemeMode(newThemeMode);
  }
}
