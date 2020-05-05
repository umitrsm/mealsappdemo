import 'package:flutter/material.dart';
import 'package:mealsappdemo/models/meal.dart';
import 'package:mealsappdemo/screens/btabs_Screen.dart';
import 'package:mealsappdemo/screens/filtersScreen.dart';
import 'package:mealsappdemo/screens/meal_detail_screen.dart';
import 'package:mealsappdemo/screens/tabs_Screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/tabs_Screen.dart';
import './dummy_data.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>_filters = {//YETKİLERİ BÖYLE AYARLAYACAKSIN
    'gluten' : false,
    'laktoz' : false,
    'vegan'  : false,
    'vegeterian' : false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
  void _setFilters(Map<String,bool> filterData){
      setState(() {
        _filters = filterData;
        _availableMeals = DUMMY_MEALS.where((meal){
          if(_filters['gluten']&& !meal.isGlutenFree){
            return false;
          }
          if(_filters['laktoz'] && !meal.isLactoseFree){
            return false;
          }
          if(_filters['vegan'] && !meal.isVegan){
            return false;
          }
          if(_filters['vegeterian'] && !meal.isVegetarian){
            return false;
          }
          return true;
        }).toList();
      });
  }
  void _toogleFavori (String mealId){
   final _existIndex= 
   _favoriteMeal.indexWhere((meal) => meal.id == mealId);
   if (_existIndex >= 0){
     setState(() {
       _favoriteMeal.removeAt(_existIndex);
     });
   }else {
     setState(() {
       _favoriteMeal.add(
         DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId),
         );
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
        body1:TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1)
        ),
        body2:TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1)
        ),
        title: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        )
        ),
      ),
      home: BtabsScreen(_favoriteMeal),
      routes: {
        // '/':Bu direk home demek 
        '/kategoriler': (ctx) => CategoryMealsScreen(_availableMeals),
        '/meal_detail': (ctx) => MealDetailScreen(_toogleFavori),
        '/filterScreen' : (ctx) => FilterScreen(_filters,_setFilters),
        
      },
     // onGenerateRoute: (settings){
       // return MaterialPageRoute(builder: (ctx) => CategorisScreen());
//EGER ROUTE A ULASAMAZSAN CategoriesScreen e git demek
     // },
     //onUnknownRoute da bilinmeyen ROUTE DA 'THIS PAGE IS NOT EXİST' gibi birşey yapıp hatadan kurtulmak için kullanılabilir
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
          ],
        ),
      ),
    
    );
  }
}
