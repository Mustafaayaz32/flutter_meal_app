import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal_model.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final ingredient in meal.ingredients) ...[
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
            const SizedBox(
              height: 16,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            for (final step in meal.steps) ...[
              Text(
                textAlign: TextAlign.center,
                step,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
