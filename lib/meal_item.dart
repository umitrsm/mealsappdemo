import 'package:flutter/material.dart';
import 'package:mealsappdemo/models/meal.dart';

class MealItem extends StatelessWidget{
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  void selectMeal(){

  }
  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
          onTap: selectMeal,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), ),
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(//sadece üst tarafta border istedik onun için
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),),
                          child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),
                      ),
                      Positioned(//Stack in içinde kullanılabiliyor
                        bottom: 20,
                        right: 10,
                         child: Container(
                           width: 220,
                           color: Colors.black54,//işlevsel
                           child: Text(title,style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                        ),
                        softWrap: true,//text çok uzunsa ayarlama yap
                        overflow: TextOverflow.fade,//softwrap işe yaramazsa 
                        ),
                         ),
                      ),
                    ],
                  )
                ],
              ),
          )
    );
  }
  
}