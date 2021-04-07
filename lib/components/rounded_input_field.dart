import 'package:flutter/material.dart';
import 'package:grocery_store/components/text_field_container.dart';
import 'package:grocery_store/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon ;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        //controller: nameController,
        keyboardType: TextInputType.emailAddress,
        //onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: (value)
        {
          if(value.isEmpty || !value.contains('@'))
          {
            return 'invalid email';
          }
          return null;
        },
        onSaved: (value)
        {
          //_authData['email'] = value;
        },
      ),
    );
  }
}