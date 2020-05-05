import 'package:flutter/material.dart';
import 'package:mealsappdemo/models/meal.dart';

class MealItem extends StatelessWidget{
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get ComplexityText {
 switch (complexity){
   case Complexity.Simple:
      return 'Basit';
    break;
    case Complexity.Challenging:
      return 'Uğraştırıcı';
    break;
    case Complexity.Hard:
      return 'Zor';
    break;
    default:
      return 'Bilinmiyor';
 }}
  
  String get AffrorText {
    switch (affordability){
   case Affordability.Affordable:
      return 'Uygun';
    break;
    case Affordability.Luxurious:
      return 'Lüx';
    break;
    case Affordability.Pricey:
      return 'Pahalı';
    break;
    default:
      return 'Bilinmiyor';
  }}
  void selectMeal(BuildContext cnt){
    Navigator.of(cnt).pushNamed(
      '/meal_detail',
      arguments: id,
      

    );
  }
  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
          onTap: () => selectMeal(context),
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
                           width: 330,
                           color: Colors.black54,//işlevsel
                           padding: EdgeInsets.symmetric(
                             vertical: 5,
                             horizontal: 20,),
                           child: Text(title,style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                        ),
                        softWrap: true,//text çok uzunsa ayarlama yap
                        overflow: TextOverflow.fade,//softwrap işe yaramazsa 
                        ),
                         ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.schedule,),
                            SizedBox(width: 6,),
                            Text('$duration ' + 'dk'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.work),
                            SizedBox(width: 6,),
                            Text(ComplexityText),

                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            SizedBox(width: 6,),
                            Text(AffrorText),

                          ],
                        )
                      ],
                      
                    ),
                  )
                ],
              ),
          )
    );
  }
  
}