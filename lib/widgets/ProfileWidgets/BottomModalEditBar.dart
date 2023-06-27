import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/profile_buttons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'BottomModalShareTile.dart';

class BottomModalEditBar extends StatelessWidget {
  const BottomModalEditBar({Key? key}) : super(key: key);

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
            child: TextFormField(
              decoration: InputDecoration(
                icon: Icon(MdiIcons.at),
                hintText: "Enter a Unique username",
                labelText: "Username",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Enter a display name",
                labelText: "Display Name",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: ProfileButton(
                onTap: () {},
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