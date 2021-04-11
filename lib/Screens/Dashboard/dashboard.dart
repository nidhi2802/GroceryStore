import 'package:flutter/material.dart';
import 'package:grocery_store/Screens/Dashboard/components/body.dart';
import 'package:grocery_store/Screens/Pages/cart.dart';
import 'package:grocery_store/constants.dart';

class Dashboard_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text(
          'My Grocery Store',
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
                accountName: Text('Nidhi Gajjar'),
                accountEmail: Text('18it033@charusat.edu.in'),
                currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ))),
                decoration: new BoxDecoration(
                  color: kPrimaryLightColor,
                )),
            //body
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Dashboard_Screen()));
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: kPrimaryLightColor),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: kPrimaryLightColor),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket_rounded,
                    color: kPrimaryLightColor),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('My Cart'),
                leading: Icon(Icons.shopping_cart, color: kPrimaryLightColor),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help_rounded, color: kPrimaryLightColor),
              ),
            ),
          ],
        ),
      ),
      body: Dashboard(),
    );
  }
}
