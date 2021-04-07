import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_store/Screens/Dashboard/dashboard.dart';
import 'package:grocery_store/Screens/Login/login_screen.dart';
import 'package:grocery_store/Screens/SignUp/components/background.dart';
import 'package:grocery_store/components/already_have_an_account_check.dart';
import 'package:grocery_store/constants.dart';
import 'package:grocery_store/models/authentication.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured'),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  Future<void> _submit() async {
    if(!_formkey.currentState.validate())
    {
      return;
    }
    _formkey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).signUp(
          _authData['email'],
          _authData['password']
      );
      Navigator.push(context,
        MaterialPageRoute(builder:
            (context){
        return Dashboard_Screen();
      },),);
    }catch(error){
      var errorMessage = 'Registration Failed. Please try again.';
      _showErrorDialog(errorMessage);
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),),

            SizedBox(height: size.height * 0.03),

            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height*0.35,),
            SizedBox(height: size.height * 0.03),
            Form(
              key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: kPrimaryColor,
                          ),
                          hintText: "Your email id",
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value)
                        {
                          if(value.isEmpty || !value.contains('@'))
                          {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _authData['email'] = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(Icons.lock, color: kPrimaryColor,),
                          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor,),
                          border: InputBorder.none,
                        ),
                        validator: (value)
                        {
                          if(value.isEmpty || value.length<=5)
                          {
                            return 'Invalid password';
                          }
                          return null;
                        },
                        onSaved: (value){
                          _authData['password'] = value;
                        },
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          icon: Icon(Icons.lock, color: kPrimaryColor,),
                          suffixIcon: Icon(Icons.visibility, color: kPrimaryColor,),
                          border: InputBorder.none,
                        ),
                        validator: (value)
                        {
                          if(value.isEmpty || value != _passwordController.text)
                          {
                            return 'Invalid password';
                          }
                          return null;
                        },
                        onSaved: (value){},
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                          color: kPrimaryColor,
                          onPressed: (){
                            _submit();
                          },
                          child: Text("SIGNUP",
                            style: TextStyle(color: Colors.white),)
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
