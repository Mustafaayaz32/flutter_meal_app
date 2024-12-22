import 'package:flutter/material.dart';
import 'package:flutter_meal_app/data/meal_data.dart';
import 'package:flutter_meal_app/models/meal_model.dart';
import 'package:flutter_meal_app/screens/categories_screen.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';
import 'package:flutter_meal_app/screens/meal_screen.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

const initialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenState extends State<TabsScreen> {
  var _selectedIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = initialFilters;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorites: _toggleFavorites,
      availableMeals: availableMeals,
    );

    var activeTitle = 'Pick Category';

    if (_selectedIndex == 1) {
      activePage = MealScreen(
        meals: _favoriteMeals,
        onToggleFavorites: _toggleFavorites,
      );
      activeTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      body: activePage,
      drawer: MainDrawer(
        selectDrawerItem: selectDrawerItem,
      ),
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

  void _itemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void selectDrawerItem(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? initialFilters;
      });
    }
  }
}
