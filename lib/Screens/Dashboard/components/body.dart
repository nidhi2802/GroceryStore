import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:grocery_store/models/appProvider.dart';
import 'horizontal_listview.dart';
import 'products.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  Widget image_carousel = new Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [Image.asset("assets/images/vegetables.jpg"),
        Image.asset("assets/images/grocery.png"),
        Image.asset("assets/images/dairy.png"),
        Image.asset("assets/images/pulses.jpg"),
        Image.asset("assets/images/spices.jpg"),
        Image.asset("assets/images/snacks.png"),],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 5.0,
      indicatorBgPadding: 0.1,
      dotBgColor: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {

   final appProvider = Provider.of<AppProvider>(context);

    return Column(
      children: <Widget>[
        image_carousel,

        new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text('Categories', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
        ),
        //Horizontal List View
        HorizontalList(),

        Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Recent Products', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
            ),

           //Text(appProvider.products.length.toString(), style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),

          ],
        ),
        //new Padding(
          //padding: const EdgeInsets.all(8.0),

          //child: new Text('Recent Products', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
        //),

        Container(
          height: 350,
          child: Products(),
        ),

      ],
    );
  }
}
