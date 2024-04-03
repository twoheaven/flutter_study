import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// 애플리케이션을 구성하는 위젯입니다.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // 설정 컨트롤러를 MaterialApp에 연결합니다.
    //
    // ListenableBuilder 위젯은 설정 컨트롤러의 변경 사항을 감지합니다.
    // 사용자가 설정을 업데이트할 때마다 MaterialApp이 다시 빌드됩니다.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // restorationScopeId를 제공하면 MaterialApp에 의해 생성된 Navigator가
          // 백그라운드에서 실행되는 동안 앱이 종료된 후에 사용자가 앱으로 돌아올 때
          // 네비게이션 스택을 복원할 수 있습니다.
          restorationScopeId: 'app',

          // 생성된 AppLocalizations를 MaterialApp에 제공합니다. 이를 통해
          // 하위 위젯에서 사용자의 로케일에 따라 올바른 번역을 표시할 수 있습니다.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // 영어, 국가 코드 없음
          ],

          // 사용자의 로케일에 따라 올바른 애플리케이션 제목을 구성하기 위해
          // AppLocalizations를 사용합니다.
          //
          // 앱 제목은 localization 디렉토리에 있는 .arb 파일에 정의됩니다.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // 밝은 테마와 어두운 테마를 정의합니다. 그런 다음 사용자의 선호하는
          // ThemeMode (밝은 테마, 어두운 테마 또는 시스템 기본)를 읽어와
          // 올바른 테마를 표시합니다.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // 명명된 경로를 처리하는 함수를 정의하여 Flutter 웹 URL 탐색과 딥 링크를 지원합니다.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
