import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data/category_data.dart';
import 'package:flutter_meal_app/data/meal_data.dart';
import 'package:flutter_meal_app/models/category_model.dart';
import 'package:flutter_meal_app/screens/meal_screen.dart';
import 'package:flutter_meal_app/widgets/category_grid_view_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _categorySelected(BuildContext context, CategoryModel category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
        title: category.title,
        meals: filteredMeals,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final categoryItem in categoryItems)
          CategoryGridViewItem(
            categoryModel: categoryItem,
            categorySelected: () {
              _categorySelected(context, categoryItem);
            },
          )
      ],
    );
  }
}
