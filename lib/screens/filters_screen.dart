import 'package:flutter/material.dart';
import '../widgets/side_drawer.dart';

class Filters extends StatefulWidget {
  final Function setFilters;
  final Map<String, Object> availableFilters;
  const Filters(this.setFilters, this.availableFilters, {super.key});

  static const String filtersRoute = '/filters-route';

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    super.initState();

    isGlutenFree = widget.availableFilters['isGlutenFree'] as bool;
    isLactoseFree = widget.availableFilters['isLactoseFree'] as bool;
    isVegan = widget.availableFilters['isVegan'] as bool;
    isVegetarian = widget.availableFilters['isVegetarian'] as bool;
  }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function update,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (value) => update(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'isGlutenFree': isGlutenFree,
                'isVegan': isVegan,
                'isVegetarian': isVegetarian,
                'isLactoseFree': isLactoseFree,
              };
              widget.setFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust your meal selection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                "Gluten-free",
                "Only include gluten-free meals.",
                isGlutenFree,
                (newValue) {
                  setState(
                    () {
                      isGlutenFree = newValue;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                "Vegan",
                "Only include vegan-free meals.",
                isVegan,
                (newValue) {
                  setState(
                    () {
                      isVegan = newValue;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                "Vegetarian",
                "Only include vegetarian meals.",
                isVegetarian,
                (newValue) {
                  setState(
                    () {
                      isVegetarian = newValue;
                    },
                  );
                },
              ),
              buildSwitchListTile(
                "Lactose-free",
                "Only include lactose meals.",
                isLactoseFree,
                (newValue) {
                  setState(
                    () {
                      isLactoseFree = newValue;
                    },
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
