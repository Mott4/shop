import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final FocusNode focusNode;
  final FocusScope? onFieldSubmitted;
  final Function()? onSaved;
  final dynamic validator;
  final int? maxLines;

  CustomTextForm({
    super.key,
    this.textInputAction,
    required this.controller,
    required this.decoration,
    this.keyboardType,
    required this.onFieldSubmitted,
    required this.onSaved,
    required this.validator,
    required this.focusNode,
    this.maxLines,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      key: _formKey,
      controller: controller,
      decoration: InputDecoration(labelText: ''),
      maxLines: maxLines,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      onSaved: onSaved,
    );
  }
}


// TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Nome',
//                   labelStyle: TextStyle(color: Colors.black),
//                 ),
//                 textInputAction: TextInputAction.next,
//                 onFieldSubmitted: (_) {
//                   FocusScope.of(context).requestFocus(_priceFocus);
//                 },
//                 onSaved: (name) => _formData['name'] = name ?? '',
//                 validator: (_name) {
//                   final name = _name ?? '';

//                   if (name.trim().isEmpty) {
//                     return 'Nome é obrigatório';
//                   }

//                   return null;
//                 },
//               ),