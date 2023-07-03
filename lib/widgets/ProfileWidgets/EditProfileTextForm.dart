import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class EditProfileTextForm extends StatefulWidget {
  EditProfileTextForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.formKey,
    required this.icon,
    required this.formatter,
    required this.errorMessage,
  }) : super(key: key);

  late String hintText;
  late String labelText;
  late String errorMessage;
  late TextEditingController controller;
  late GlobalKey<FormState> formKey;
  late Icon icon;
  late RegExp formatter;

  @override
  State<EditProfileTextForm> createState() => _EditProfileTextFormState();
}

class _EditProfileTextFormState extends State<EditProfileTextForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
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
          validator: (String? value) {
            if (value!.isNotEmpty && value.length <= 25) {
              if (widget.formatter.hasMatch(value)) {
                return null;
              }
              return widget.errorMessage;
            }
            return "Value must be between 1 and 25 characters";
          }),
    );
  }
}
