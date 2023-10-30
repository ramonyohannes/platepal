import 'package:flutter/material.dart';
import '../widgets/side_drawer.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  static const String filtersRoute = '/filters-route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: const SideDrawer(),
    );
  }
}
