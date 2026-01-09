import 'package:flutter/material.dart';

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
      body: Column(
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