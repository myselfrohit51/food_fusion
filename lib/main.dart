import 'package:flutter/material.dart';
import 'package:food_fusion/dummy_data.dart';
import 'package:food_fusion/screens/categories_screen.dart';
import 'package:food_fusion/screens/category_meals_screen.dart';
import 'package:food_fusion/screens/filters_screen.dart';
import 'package:food_fusion/screens/meal_detail_screen.dart';
import 'package:food_fusion/screens/tabs_screen.dart';

import 'models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
    };
    List<Meal> _availableMeals = DUMMY_MEALS;
    List<Meal> _favoritedMeals=[];
    void _setFilters(Map<String, bool> filterData) {
      setState(() {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where((meal) {
          if (_filters['gluten']! && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose']! && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan']! && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian']! && !meal.isVegetarian) {
            return false;
          }
          return true;
        }).toList();
      });
    }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodFusion',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      home: TabsScreen(),
      //initialRoute: '/',
      routes: {
        //'/':(ctx)=>TabsScreen(),
        '/category-meals': (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routenm: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodFusion'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
