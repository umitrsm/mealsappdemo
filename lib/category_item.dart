import 'package:flutter/material.dart';
import './screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget{
  final String title;
  final Color color1;
  final String id;
  CategoryItem(this.id,this.title,this.color1);
  
  void selectCategory(BuildContext cnt){
    Navigator.of(cnt).pushNamed(
      '/kategoriler',
      arguments:{
        'id': id,
        'title' : title,
      },
     
    );
    
  }

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
          onTap: () => selectCategory(context),
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(gradient: LinearGradient(
          colors: [color1.withOpacity(0.1),color1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            child: Column(children: <Widget>[
         
            Text(title,style: Theme.of(context).textTheme.title,),
         // FlatButton(onPressed: () {},child: Text('İşlem'),),
             //FlatButton(onPressed: () {},child: Text('Satış'),)
       
            ],),
          ),
        ),
    );
  }
  
}