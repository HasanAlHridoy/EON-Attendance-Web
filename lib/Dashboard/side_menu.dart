import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:attendance_app/login.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  Function? setString;
  SideMenu({Key? key, this.setString}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  File _file = File("zz");
  Uint8List webImage = Uint8List(10);

  uploadImage() async {
    var permissionStatus = Permission.mediaLibrary;

    // MOBILE
    if (!kIsWeb && await permissionStatus.isGranted) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);

        setState(() {
          _file = selected;
        });
      } else {
        const Text("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      // print('tuh');
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = File("a");
          webImage = f;
        });
      } else {
        const Text("No file selected");
      }
    } else {
      const Text("Permission not granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        children: [
          SizedBox(
            height: 220,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: secondaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Badge(
                    badgeContent: IconButton(
                      icon: const Icon(Icons.add_a_photo_outlined),
                      color: Colors.white54,
                      onPressed: () async {
                        uploadImage();
                      },
                    ),
                    badgeColor: const Color(0xff212332),
                    position: BadgePosition.bottomEnd(),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (_file.path == "zz")
                              ? const AssetImage("images/bg.jpg")
                              : (kIsWeb)
                                  ? Image.memory(webImage).image
                                  : Image.file(_file).image,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Company Name[CID]",
                    style: TextStyle(color: Colors.white54),
                  )
                ],
              ),
            ),
          ),
          DrawListTile(
            setString: widget.setString!,
            title: "POI Table",
            icon: FontAwesomeIcons.addressBook,
          ),
          DrawListTile(
            setString: widget.setString!,
            title: "Field Force",
            icon: FontAwesomeIcons.userGroup,
          ),
          DrawListTile(
            setString: widget.setString!,
            title: "Attendance table",
            icon: FontAwesomeIcons.house,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            },
            icon: const Icon(Icons.login),
            label: const Text(
              "Logout",
            ),
          ),
        ],
      ),
    );
  }
}

class DrawListTile extends StatefulWidget {
  final String title;
  final IconData? icon;
  final Function setString;

  DrawListTile({
    Key? key,
    required this.title,
    this.icon,
    required this.setString,
  }) : super(key: key);

  @override
  State<DrawListTile> createState() => _DrawListTileState();
}

class _DrawListTileState extends State<DrawListTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
        onTap: () {
          widget.title == "POI Table"
              ? widget.setString("POI Table")
              : widget.title == "Field Force"
                  ? widget.setString("Field Force")
                  : widget.setString("Attendance table");
        },
        leading: Icon(widget.icon, size: 18, color: Colors.white54),
        horizontalTitleGap: 0.0,
      ),
    );
  }
}
