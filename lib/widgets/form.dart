import 'package:attendance_app/Dashboard/dashboard.dart';
import 'package:attendance_app/Services/api_call.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // String? _name;
  // String? _password;
  String? token;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        prefixIcon: Icon(
          FontAwesomeIcons.idCard,
          size: 18.0,
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      // onSaved: (String? value) {
      //   _name = value;
      // },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: passController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(
          FontAwesomeIcons.key,
          size: 18.0,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      // onSaved: (String? value) {
      //   _password = value;
      // },
    );
  }

  @override
  void initState() {
    saveTokenToSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildName(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildPassword(),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor, // Background color
              ),
              child: const Text(
                'Login',
              ),
              onPressed: () async {
                checkLogin();
              },
            )
          ],
        ),
      ),
    );
  }

  void checkLogin() async {
    if (_formKey.currentState!.validate()) {
      var body =
          await ApiCall().login(emailController.text, passController.text);
      var token = body["token"];
      // print('token: $token');
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("token", token);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardPage(token: token)),
          (route) => false);

      Fluttertoast.showToast(msg: 'Welcome ', toastLength: Toast.LENGTH_SHORT);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid')),
      );
    }
  }

  void saveTokenToSharedPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("token");
    // print('afterload->$val');
    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardPage(token: val)),
          (route) => false);
    }
  }
}
