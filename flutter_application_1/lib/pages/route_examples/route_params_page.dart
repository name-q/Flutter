import 'package:flutter/material.dart';

class RouteParamsPage extends StatelessWidget {
  final String title;
  final int count;

  const RouteParamsPage({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('路由传参示例')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('接收到的标题: $title', style: const TextStyle(fontSize: 18)),
            Text('接收到的数字: $count', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '返回的数据: ${DateTime.now()}');
              },
              child: const Text('返回数据'),
            ),
          ],
        ),
      ),
    );
  }
}