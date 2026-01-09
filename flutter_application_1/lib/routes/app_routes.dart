import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/state_examples/self_managed_page.dart';
import '../pages/state_examples/parent_managed_page.dart';
import '../pages/state_examples/mixed_state_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
    '/self-managed': (context) => const SelfManagedPage(),
    '/parent-managed': (context) => const ParentManagedPage(),
    '/mixed-state': (context) => const MixedStatePage(),
  };
}