import 'package:attendance_app/Dashboard/dashboard_screen.dart';
import 'package:attendance_app/Dashboard/side_menu.dart';
import 'package:attendance_app/widgets/responsive_login.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final String token;

  const DashboardPage({Key? key, required this.token}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String which_button = '';

  @override
  void initState() {
    super.initState();
    which_button = 'POI Table';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // appBar: Responsive.isMobile(context)?
      // AppBar()
      // appBar: AppBar(title: Text("Hello")),
      drawer: Drawer(
        child: SideMenu(
          setString: (String value) {
            setState(() {
              which_button = value;
            });
          },
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ResponsiveWidget.isLargeScreen(context))
            Expanded(
              child: SizedBox(
                child: SideMenu(
                  setString: (String value) {
                    setState(() {
                      which_button = value;
                    });
                  },
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child: DashboardScreen(
                which_button: which_button, token: widget.token),
          )
        ],
      ),
    );
  }
}
