import 'package:flutter/material.dart';

/// 사용자 설정을 저장하고 검색하는 서비스입니다.
///
/// 기본적으로이 클래스는 사용자 설정을 유지하지 않습니다. 사용자 설정을 로컬에 유지하려면 shared_preferences 패키지를 사용하십시오.
/// 웹 서버에 설정을 저장하려면 http 패키지를 사용하십시오.
class SettingsService {
  /// 사용자의 기본 ThemeMode를 로컬 또는 원격 저장소에서로드합니다.
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// 사용자의 기본 ThemeMode를 로컬 또는 원격 저장소에 지속시킵니다.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // 설정을 로컬에 유지하려면 shared_preferences 패키지를 사용하거나
    // 네트워크를 통해 설정을 지속시키려면 http 패키지를 사용하십시오.
  }
}