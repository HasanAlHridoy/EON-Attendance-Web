import 'package:attendance_app/Services/api_call.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FieldPopupView extends StatefulWidget {
  Function refresh;
  String token;
  FieldPopupView({Key? key, required this.token, required this.refresh})
      : super(key: key);
  @override
  _FieldPopupView createState() => _FieldPopupView();
}

class _FieldPopupView extends State<FieldPopupView> {
  final _formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  // ScrollController controller = ScrollController();

  //controllers

  TextEditingController cidController = TextEditingController();
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController marketController = TextEditingController();
  TextEditingController territoryController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController zoneController = TextEditingController();

  @override
  void dispose() {
    cidController.dispose();
    employeeIdController.dispose();
    employeeNameController.dispose();
    designationController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    emailController.dispose();
    marketController.dispose();
    territoryController.dispose();
    areaController.dispose();
    regionController.dispose();
    zoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgColor,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'CID',
                            controller: cidController,
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Employee ID',
                            controller: employeeIdController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Employee Name',
                            controller: employeeNameController,
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Designation',
                            controller: designationController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Password',
                            controller: passwordController,
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Mobile Number',
                            controller: mobileController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Email',
                            controller: emailController,
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Market',
                            controller: marketController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Territory',
                            controller: territoryController,
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Area',
                            controller: areaController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Region',
                            controller: regionController,
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            labelText: 'Zone',
                            controller: zoneController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red, // Background color
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor, // Background color
                            ),
                            child: const Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (cidController.text != '' &&
                                  employeeIdController.text != '' &&
                                  employeeNameController.text != '' &&
                                  designationController.text != '' &&
                                  passwordController.text != '' &&
                                  mobileController.text != '' &&
                                  emailController.text != '' &&
                                  marketController.text != '' &&
                                  territoryController.text != '' &&
                                  areaController.text != '' &&
                                  regionController.text != '' &&
                                  zoneController.text != '') {
                                await ApiCall().singleFieldForceAddRow(
                                  widget.token,
                                  cidController.text,
                                  employeeIdController.text,
                                  employeeNameController.text,
                                  designationController.text,
                                  passwordController.text,
                                  mobileController.text,
                                  emailController.text,
                                  marketController.text,
                                  territoryController.text,
                                  areaController.text,
                                  regionController.text,
                                  zoneController.text,
                                );
                                widget.refresh();

                                Navigator.pop(context);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please Enter All Fields',
                                    toastLength: Toast.LENGTH_SHORT,
                                    webPosition: "center");
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormPopup extends StatelessWidget {
  final String? labelText;
  TextEditingController controller;

  TextFormPopup({Key? key, this.labelText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
