import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal_model.dart';
import 'package:flutter_meal_app/screens/categories_screen.dart';
import 'package:flutter_meal_app/screens/meal_screen.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex = 0;
  var _activeTitle = 'Pick Category';
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorites(Meal meal) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    bool isFavorite = _favoriteMeals.contains(meal);

    setState(() {
      if (isFavorite) {
        _favoriteMeals.remove(meal);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Removed from favorites'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        _favoriteMeals.add(meal);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to favorites'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = CategoriesScreen(
      onToggleFavorites: _toggleFavorites,
    );
  }

  void _itemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 1) {
      setState(() {
        activeScreen = MealScreen(
          meals: _favoriteMeals,
          onToggleFavorites: _toggleFavorites,
        );
        _activeTitle = 'Favorite Meals';
      });
    } else {
      setState(() {
        activeScreen = CategoriesScreen(
          onToggleFavorites: _toggleFavorites,
        );
        _activeTitle = 'Pick Category';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_activeTitle)),
      body: activeScreen,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _itemSelected(index);
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
