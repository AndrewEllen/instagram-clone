import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class EditProfileTextForm extends StatefulWidget {
  const EditProfileTextForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.formKey,
    required this.icon,
    required this.formatter,
    required this.errorMessage,
    required this.maxTextLength,
    required this.minTextLength,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final String errorMessage;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final Icon icon;
  final RegExp formatter;
  final int maxTextLength;
  final int minTextLength;

  @override
  State<EditProfileTextForm> createState() => _EditProfileTextFormState();
}

class _EditProfileTextFormState extends State<EditProfileTextForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          cursorColor: appSecondaryColour,
          decoration: InputDecoration(
              focusColor: appSecondaryColour,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                color: appSecondaryColour,
              )),
              icon: widget.icon,
              hintText: widget.hintText,
              labelText: widget.labelText,
          ),
          maxLength: widget.maxTextLength,
          validator: (String? value) {
            if (value!.length >= widget.minTextLength && value.length <= widget.maxTextLength) {
              if (widget.formatter.hasMatch(value)) {
                return null;
              }
              return widget.errorMessage;
            }
            return "${value.length}/${widget.maxTextLength}";
          }),
    );
  }
}
