// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFreeSelected = false;
  bool lactoseFreeSelected = false;
  bool vegetarianSelected = false;
  bool veganSelected = false;

  @override
  void initState() {
    super.initState();
    glutenFreeSelected = widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeSelected = widget.currentFilters[Filter.lactoseFree]!;
    vegetarianSelected = widget.currentFilters[Filter.vegetarian]!;
    veganSelected = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Filters',
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop(
            {
              Filter.glutenFree: glutenFreeSelected,
              Filter.lactoseFree: lactoseFreeSelected,
              Filter.vegetarian: vegetarianSelected,
              Filter.vegan: veganSelected,
            },
          );
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeSelected,
              onChanged: (isCheck) {
                setState(() {
                  glutenFreeSelected = isCheck;
                });
              },
              title: const Text('Gluten Free'),
              subtitle: const Text('Gluten free food included.'),
            ),
            SwitchListTile(
              value: lactoseFreeSelected,
              onChanged: (isCheck) {
                setState(() {
                  lactoseFreeSelected = isCheck;
                });
              },
              title: const Text('Lactose Free'),
              subtitle: const Text('Lactose free food included.'),
            ),
            SwitchListTile(
              value: vegetarianSelected,
              onChanged: (isCheck) {
                setState(() {
                  vegetarianSelected = isCheck;
                });
              },
              title: const Text('Vegetarian'),
              subtitle: const Text('Vegetarin food included.'),
            ),
            SwitchListTile(
              value: veganSelected,
              onChanged: (isCheck) {
                setState(() {
                  veganSelected = isCheck;
                });
              },
              title: const Text('Vegan'),
              subtitle: const Text('Vegan food included.'),
            ),
          ],
        ),
      ),
    );
  }
}
