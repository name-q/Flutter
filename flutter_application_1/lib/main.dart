import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '状态管理示例',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('状态管理示例')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard(
            context,
            '1. Widget管理自身状态',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SelfManagedPage()),
            ),
          ),
          _buildCard(
            context,
            '2. 父Widget管理子Widget状态',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ParentManagedPage()),
            ),
          ),
          _buildCard(
            context,
            '3. 混合状态管理',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MixedStatePage()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

// 1. Widget管理自身状态
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

// 2. 父Widget管理子Widget的状态
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
      body: Center(
        child: Column(
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

// 3. 混合状态管理
class MixedStatePage extends StatefulWidget {
  const MixedStatePage({super.key});

  @override
  State<MixedStatePage> createState() => _MixedStatePageState();
}

class _MixedStatePageState extends State<MixedStatePage> {
  Color _currentColor = Colors.red;

  void _handleColorChange(Color color) {
    setState(() => _currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('混合状态管理')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '当前颜色: ${_getColorName(_currentColor)}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            MixedBox(onColorChange: _handleColorChange),
          ],
        ),
      ),
    );
  }

  String _getColorName(Color color) {
    if (color == Colors.red) return '红色';
    if (color == Colors.green) return '绿色';
    if (color == Colors.blue) return '蓝色';
    return '未知';
  }
}

class MixedBox extends StatefulWidget {
  final Function(Color) onColorChange;

  const MixedBox({super.key, required this.onColorChange});

  @override
  State<MixedBox> createState() => _MixedBoxState();
}

class _MixedBoxState extends State<MixedBox> {
  Color _color = Colors.red;
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue];
  int _colorIndex = 0;

  void _changeColor() {
    setState(() {
      _colorIndex = (_colorIndex + 1) % _colors.length;
      _color = _colors[_colorIndex];
    });
    widget.onColorChange(_color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _color,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: const Center(
          child: Text(
            '点击切换颜色',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
