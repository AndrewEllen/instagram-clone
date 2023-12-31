import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/Profile/user_data.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/profile_buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'edit_profile_text_form.dart';

class BottomModalEditBar extends StatefulWidget {
  const BottomModalEditBar({Key? key}) : super(key: key);

  @override
  State<BottomModalEditBar> createState() => _BottomModalEditBarState();
}

class _BottomModalEditBarState extends State<BottomModalEditBar> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userDisplayNameController = TextEditingController();
  final TextEditingController pronounsController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userDisplayNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> pronounsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> bioKey = GlobalKey<FormState>();

  @override
  void initState() {
    userNameController.text = context.read<UserData>().userName;
    userDisplayNameController.text = context.read<UserData>().userDisplayName;
    pronounsController.text = context.read<UserData>().pronouns;
    bioController.text = context.read<UserData>().bio;

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
              minTextLength: 1,
              maxTextLength: 25,
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
              minTextLength: 1,
              maxTextLength: 25,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: EditProfileTextForm(
              icon: const Icon(Icons.info_outline),
              hintText: "Enter your pronouns",
              labelText: "Pronouns",
              errorMessage: "No Special Characters allowed",
              controller: pronounsController,
              formKey: pronounsKey,
              formatter: RegExp(r'^[a-zA-Z/ ]+$'),
              minTextLength: 0,
              maxTextLength: 25,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: EditProfileTextForm(
              icon: const Icon(Icons.info),
              hintText: "Enter your bio",
              labelText: "Bio",
              errorMessage: "No Special Characters allowed",
              controller: bioController,
              formKey: bioKey,
              formatter: RegExp(r'^(?:[a-zA-Z]|\P{L})+$', unicode: true),
              minTextLength: 0,
              maxTextLength: 150,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: ProfileButton(
              onTap: () {
                if (userNameKey.currentState!.validate() &&
                    userDisplayNameKey.currentState!.validate() &&
                    pronounsKey.currentState!.validate() &&
                    bioKey.currentState!.validate()) {
                  context.read<UserData>().updateUserName(userNameController.text);
                  context.read<UserData>().updateUserDisplayName(userDisplayNameController.text);
                  context.read<UserData>().updatePronouns(pronounsController.text);
                  context.read<UserData>().updateBio(bioController.text);
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
