import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal_model.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorites,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorites;

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no meal...',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting another category.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );

    if (widget.meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: widget.meals[index],
          onToggleFavorites: widget.onToggleFavorites,
        ),
      );
    }

    if (widget.title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: content,
    );
  }
}
