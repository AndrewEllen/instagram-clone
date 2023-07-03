import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../MainAppWidgets/BottomModalShareTile.dart';

class ShareModalScreen extends StatelessWidget {
  ShareModalScreen({Key? key}) : super(key: key);

  final List<BottomModalShareTile> modalTileList = [
    BottomModalShareTile(
      icon: const Icon(
        Icons.discord,
      ),
      onTap: () {},
      label: "Discord",
    ),
    BottomModalShareTile(
      icon: Icon(
        MdiIcons.twitter,
      ),
      onTap: () {},
      label: "Twitter",
    ),
    BottomModalShareTile(
      icon: const Icon(
        Icons.facebook,
      ),
      onTap: () {},
      label: "Facebook",
    ),
    BottomModalShareTile(
      icon: Icon(
        MdiIcons.instagram,
      ),
      onTap: () {},
      label: "Instagram",
    ),
    BottomModalShareTile(
      icon: Icon(
        MdiIcons.whatsapp,
      ),
      onTap: () {},
      label: "Whatsapp",
    ),
    BottomModalShareTile(
      icon: Icon(
        MdiIcons.facebookMessenger,
      ),
      onTap: () {},
      label: "Messenger",
    ),
    BottomModalShareTile(
      icon: const Icon(
        Icons.messenger,
      ),
      onTap: () {},
      label: "SMS",
    ),
    BottomModalShareTile(
      icon: const Icon(
        Icons.email,
      ),
      onTap: () {},
      label: "Email",
    ),
    BottomModalShareTile(
      icon: const Icon(
        Icons.link,
      ),
      onTap: () {},
      label: "Copy",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: Center(
                    child: Text(
                        "Share to User $index"
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: 90,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: appTertiaryColour,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 8.0,
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: modalTileList,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
