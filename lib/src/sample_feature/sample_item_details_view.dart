import 'package:flutter/material.dart';

/// 샘플 항목에 대한 상세 정보를 표시합니다.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'), // 항목 세부 정보
      ),
      body: const Center(
        child: Text('More Information Here'), // 여기에 더 많은 정보
      ),
    );
  }
}