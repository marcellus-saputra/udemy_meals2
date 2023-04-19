import 'package:flutter/material.dart';

import 'package:udemy_meals2/widgets/category_card.dart';
import '../data/dummy_data.dart';
import 'meals.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });
  static const routeName = '/categories';

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final meals =
        dummyMeals.where((meal) => meal.categories.contains(category.id));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: meals.toList(),
        onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryCard(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
