import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal_model.dart';
import 'package:flutter_meal_app/screens/meal_detail.dart';
import 'package:flutter_meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  void _mealSelected(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetail(meal: meal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      elevation: 2,
      child: InkWell(
        onTap: () {
          _mealSelected(context, meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // Very long text ...,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MealItemTrait(
                          title: '${meal.duration} mins',
                          iconData: Icons.lock_clock_outlined,
                        ),
                        MealItemTrait(
                          title:
                              '${meal.complexity.name[0].toUpperCase()}${meal.complexity.name.substring(1).toLowerCase()}',
                          iconData: Icons.lock_clock_outlined,
                        ),
                        MealItemTrait(
                          title:
                              '${meal.affordability.name[0].toUpperCase()}${meal.affordability.name.substring(1).toLowerCase()}',
                          iconData: Icons.money_off,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
