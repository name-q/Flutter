import 'package:flutter/material.dart';

class ParentManagedPage extends StatefulWidget {
  const ParentManagedPage({super.key});

  @override
  State<ParentManagedPage> createState() => _ParentManagedPageState();
}

class _ParentManagedPageState extends State<ParentManagedPage> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('父Widget管理子Widget状态')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ParentManagedBox(isActive: _isActive),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() => _isActive = !_isActive),
            child: Text(_isActive ? '设为未激活' : '设为激活'),
          ),
        ],
      ),
    );
  }
}

class ParentManagedBox extends StatelessWidget {
  final bool isActive;

  const ParentManagedBox({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          isActive ? '激活' : '未激活',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}