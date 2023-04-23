import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_meals2/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
