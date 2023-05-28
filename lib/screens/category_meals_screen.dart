import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_fusion/dummy_data.dart';
import 'package:food_fusion/widgets/meal_item.dart';

import '../models/meals.dart';

class CategoryMealScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData=false;
  void initState(){

    super.initState();
  }
  void didChangeDependencies(){
    if(_loadedInitData==false)
      {
        final Map<String, String>? routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
        categoryTitle = routeArgs?['title'] ?? 'Default title';
        final categoryId = routeArgs?['id'] ?? 'Default ID';
        displayedMeals= widget.availableMeals.where(
              (meal) {
            return meal.categories.contains(categoryId);
          },
        ).toList();
        _loadedInitData=true;
      }

    super.didChangeDependencies();
  }
  void _removedMeal(String mealId)
  {
    setState(() {
      displayedMeals.removeWhere((element) => element.id==mealId);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
            removeItem: _removedMeal,);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
