import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Pages/beverages.dart';
import 'package:grocery_store/Screens/Pages/dairy.dart';
import 'package:grocery_store/Screens/Pages/foodgrains.dart';
import 'package:grocery_store/Screens/Pages/fruits_vegetables.dart';
import 'package:grocery_store/Screens/Pages/household.dart';
import 'package:grocery_store/Screens/Pages/hygiene.dart';
import 'package:grocery_store/Screens/Pages/snacks.dart';
import 'package:grocery_store/constants.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/icons/grains.jpg',
            image_caption: 'Foodgrains',
          ),
          Category(
            image_location: 'assets/icons/fruits.jpg',
            image_caption: 'Fruits & Vegetables',
          ),
          Category(
            image_location: 'assets/icons/Dairy.jpg',
            image_caption: 'Dairy Products',
          ),
          Category(
            image_location: 'assets/icons/Beverages.jpg',
            image_caption: 'Beverages',
          ),
          Category(
            image_location: 'assets/icons/housecleaning.jpg',
            image_caption: 'Household Cleaning',
          ),
          Category(
            image_location: 'assets/icons/Hygiene.jpg',
            image_caption: 'Hygiene',
          ),
          Category(
            image_location: 'assets/icons/snacks.jpg',
            image_caption: 'Snacks',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_caption, this.image_location});

  void pageRoute(String caption, BuildContext context){
    if(caption=='Foodgrains'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Foodgrains()));
    }

    if(caption=='Fruits & Vegetables'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Fruits()));
    }

    if(caption=='Dairy Products'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Dairy()));
    }

    if(caption=='Beverages'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Beverages()));
    }

    if(caption=='Household Cleaning'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Household()));
    }

    if(caption=='Hygiene'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Hygiene()));
    }

    if(caption=='Snacks'){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new Snacks()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.2),
      child: InkWell(
        onTap: (){
          pageRoute(image_caption, context);
        },
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,),
            subtitle: Container(
              alignment: Alignment.topLeft,
              child: Text(image_caption, style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: kPrimaryColor),),
            ),
          ),
        ),
      ),
    );
  }
}