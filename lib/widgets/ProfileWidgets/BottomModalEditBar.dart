import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/Profile/user_data.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/profile_buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'EditProfileTextForm.dart';

class BottomModalEditBar extends StatefulWidget {
  const BottomModalEditBar({Key? key}) : super(key: key);

  @override
  State<BottomModalEditBar> createState() => _BottomModalEditBarState();
}

class _BottomModalEditBarState extends State<BottomModalEditBar> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userDisplayNameController = TextEditingController();

  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userDisplayNameKey = GlobalKey<FormState>();

  @override
  void initState() {

    userNameController.text = context.read<UserData>().userName;
    userDisplayNameController.text = context.read<UserData>().userDisplayName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: EditProfileTextForm(
              icon: Icon(MdiIcons.at),
              hintText: "Enter a Unique username",
              labelText: "Username",
              errorMessage: "No Special Characters or Spaces allowed",
              controller: userNameController,
              formKey: userNameKey,
              formatter: RegExp(r'^[a-zA-Z0-9_]+$'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: EditProfileTextForm(
              icon: const Icon(Icons.person),
              hintText: "Enter a display name",
              labelText: "Display Name",
              errorMessage: "No Special Characters allowed",
              controller: userDisplayNameController,
              formKey: userDisplayNameKey,
              formatter: RegExp(r'^[a-zA-Z0-9_ ]+$'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: ProfileButton(
                onTap: () {
                  if (userNameKey.currentState!.validate() && userDisplayNameKey.currentState!.validate()) {
                    context.read<UserData>().UpdateUserName(userNameController.text);
                    context.read<UserData>().UpdateUserDisplayName(userDisplayNameController.text);
                    Navigator.pop(context);
                  }
                },
                text: "Save Changes",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}