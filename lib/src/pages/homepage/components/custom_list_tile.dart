import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String text;
  Function() onTap;

  CustomListTile({super.key, required this.onTap, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: Icon(icon), title: Text(text), onTap: onTap);
  }
}
