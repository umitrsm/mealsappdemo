import 'package:flutter/material.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

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
      home: CategorisScreen(),
      routes: {
        // '/':Bu direk home demek 
        '/kategoriler': (ctx) => CategoryMealsScreen(),
      },
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
