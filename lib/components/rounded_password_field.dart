import 'package:flutter/material.dart';
import 'package:grocery_store/components/text_field_container.dart';
import 'package:grocery_store/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
      obscureText: true,
      //controller: pwdController,
        //onChanged: onChanged,
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
            return 'invalid password';
          }
          return null;
        },
    ),);
  }
}