 import 'package:flutter/material.dart';
import 'package:mealsappdemo/category_item.dart';
import 'package:mealsappdemo/models/category.dart';

import '../models/meal.dart';
import '../meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/kategoriler';
   final List<Meal> avaiblableMeals;

  const CategoryMealsScreen(this.avaiblableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
    String categoryTitle;
    List<Meal> displayedMeals;
    var _loadedInitData = false;

    void didChangeDependencies(){
      if(!_loadedInitData){
         final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
         categoryTitle = routeArgs['title'];
         final categoryId = routeArgs['is'];
         displayedMeals = widget.avaiblableMeals.where((meal){
           return meal.categories.contains(categoryId);
         }).toList();
         _loadedInitData = true;
      }
      super.didChangeDependencies();
    }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
     final categoryMeals = widget.avaiblableMeals.where((meal){
    return meal.categories.contains(categoryId);
  }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(id: categoryMeals[index].id,title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability);
      }, itemCount: categoryMeals.length ,
      ),
      
    );
  }
}