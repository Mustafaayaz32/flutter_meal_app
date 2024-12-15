import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/category_model.dart';

class CategoryGridViewItem extends StatelessWidget {
  const CategoryGridViewItem({
    super.key,
    required this.categoryModel,
    required this.categorySelected,
  });

  final CategoryModel categoryModel;
  final void Function() categorySelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: categorySelected,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                categoryModel.color.withOpacity(0.55),
                categoryModel.color.withOpacity(0.90),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          categoryModel.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
