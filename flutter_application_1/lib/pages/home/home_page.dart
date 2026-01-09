import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('状态管理示例')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(context, '1. Widget管理自身状态', '/self-managed'),
          _buildCard(context, '2. 父Widget管理子Widget状态', '/parent-managed'),
          _buildCard(context, '3. 混合状态管理', '/mixed-state'),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}