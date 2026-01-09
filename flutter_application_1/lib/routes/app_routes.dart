import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/state_examples/self_managed_page.dart';
import '../pages/state_examples/parent_managed_page.dart';
import '../pages/state_examples/mixed_state_page.dart';
import '../pages/route_examples/route_params_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(),
    '/self-managed': (context) => const SelfManagedPage(),
    '/parent-managed': (context) => const ParentManagedPage(),
    '/mixed-state': (context) => const MixedStatePage(),
    '/route-params': (context) {
      // todo这种强拆agrs 再忽略其类型推导 有问题 能否拆ts那种安全写法？
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      return RouteParamsPage(
        title: args['title'],
        count: args['count'],
      );
    },
  };
}