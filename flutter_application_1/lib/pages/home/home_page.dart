import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _returnData = '暂无返回数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter示例')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('状态管理示例', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          _buildCard(context, '1. Widget管理自身状态', '/self-managed'),
          _buildCard(context, '2. 父Widget管理子Widget状态', '/parent-managed'),
          _buildCard(context, '3. 混合状态管理', '/mixed-state'),
          const SizedBox(height: 20),
          const Text('路由传参示例', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: const Text('路由传参（跳转传参 + 返回传参）'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/route-params',
                  arguments: {'title': 'Hello Flutter', 'count': 42},
                );
                if (result != null) {
                  setState(() => _returnData = result.toString());
                }
              },
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('返回数据: $_returnData'),
            ),
          ),
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