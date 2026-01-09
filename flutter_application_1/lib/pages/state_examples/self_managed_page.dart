import 'package:flutter/material.dart';

class SelfManagedPage extends StatelessWidget {
  const SelfManagedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget管理自身状态')),
      body: const Center(child: SelfManagedBox()),
    );
  }
}

class SelfManagedBox extends StatefulWidget {
  const SelfManagedBox({super.key});

  @override
  State<SelfManagedBox> createState() => _SelfManagedBoxState();
}

class _SelfManagedBoxState extends State<SelfManagedBox> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isActive = !_isActive),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _isActive ? Colors.green : Colors.grey,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            _isActive ? '激活' : '未激活',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}