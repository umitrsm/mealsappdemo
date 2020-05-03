import 'package:flutter/material.dart';
import 'package:mealsappdemo/category_item.dart';
import '../dummy_data.dart';
import '../category_item.dart';

class CategorisScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App Demo'),
      ),

      body: Center(
      child:GridView(//.builder ile dinamik liste yapılır
      padding: const EdgeInsets.all(5),
      children: DUMMY_CATEGORIES.map((catData)=> CategoryItem(catData.id,catData.title, catData.color)).toList(),
      gridDelegate: 
      SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio:  0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,),
        ) 
    ),); 
  }

  
}