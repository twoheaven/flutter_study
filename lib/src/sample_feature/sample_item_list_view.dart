import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// SampleItems의 목록을 표시합니다.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'), // 샘플 항목
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // 설정 아이콘
            onPressed: () {
              // 설정 페이지로 이동합니다. 사용자가 앱을 종료한 후 백그라운드에서 실행되는 경우,
              // 네비게이션 스택이 복원됩니다.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // 대량 항목을 포함하는 목록을 처리하기 위해 ListView.builder 생성자를 사용하는 것이 좋습니다.
      //
      // 모든 위젯을 미리 빌드해야하는 기본 ListView 생성자와 달리 ListView.builder 생성자는
      // 위젯을 스크롤될 때 게으르게 빌드합니다.
      body: ListView.builder(
        // restorationId를 제공하면 사용자가 앱을 종료한 후 돌아왔을 때
        // 스크롤 위치를 복원할 수 있습니다.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text('SampleItem ${item.id}'), // 샘플 항목
            leading: const CircleAvatar(
              // Flutter 로고 이미지를 표시합니다.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // 세부 정보 페이지로 이동합니다. 사용자가 앱을 종료한 후 돌아온 경우,
              // 네비게이션 스택이 복원됩니다.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            }
          );
        },
      ),
    );
  }
}

