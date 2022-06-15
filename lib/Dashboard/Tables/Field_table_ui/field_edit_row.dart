import 'package:attendance_app/Services/api_call.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';

class FieldEditView extends StatefulWidget {
  String employeeId;
  String employeeName;
  String designation;
  String mobile;
  String email;
  String market;
  String territory;
  String area;
  String region;
  String zone;
  String token;
  String id;
  Function refresh;

  FieldEditView({
    Key? key,
    required this.employeeId,
    required this.employeeName,
    required this.designation,
    required this.mobile,
    required this.email,
    required this.market,
    required this.territory,
    required this.area,
    required this.region,
    required this.zone,
    required this.token,
    required this.id,
    required this.refresh,
  }) : super(key: key);

  @override
  _FieldEditView createState() => _FieldEditView();
}

class _FieldEditView extends State<FieldEditView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emplopyeeIdController = TextEditingController();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController marketController = TextEditingController();
  TextEditingController territoryController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController zoneController = TextEditingController();

  @override
  void initState() {
    if (widget.employeeId != "") {
      emplopyeeIdController.text = widget.employeeId;
    }
    if (widget.employeeName != "") {
      employeeNameController.text = widget.employeeName;
    }
    if (widget.designation != "") {
      designationController.text = widget.designation;
    }
    if (widget.mobile != "") {
      mobileController.text = widget.mobile;
    }
    if (widget.email != "") {
      emailController.text = widget.email;
    }
    if (widget.market != "") {
      marketController.text = widget.market;
    }
    if (widget.territory != "") {
      territoryController.text = widget.territory;
    }
    if (widget.area != "") {
      areaController.text = widget.area;
    }
    if (widget.region != "") {
      regionController.text = widget.region;
    }
    if (widget.zone != "") {
      zoneController.text = widget.zone;
    }
    super.initState();
  }

  @override
  void dispose() {
    emplopyeeIdController.dispose();
    employeeNameController.dispose();
    designationController.dispose();
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
    return Center(
      child: MaterialButton(
        minWidth: 0.0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: bgColor,
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: SingleChildScrollView(
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
                                      labelText: 'Employee Id',
                                      controller: emplopyeeIdController,
                                      isEdit: true,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Employee Name',
                                      controller: employeeNameController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Designation',
                                      controller: designationController,
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
                                      // color: primaryColor,
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            primaryColor, // Background color
                                      ),
                                      child: const Text(
                                        "Submit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        await ApiCall().singleEmployeeEditRow(
                                            widget.id,
                                            widget.token,
                                            emplopyeeIdController.text,
                                            employeeNameController.text,
                                            designationController.text,
                                            mobileController.text,
                                            emailController.text,
                                            marketController.text,
                                            territoryController.text,
                                            areaController.text,
                                            regionController.text,
                                            zoneController.text);

                                        widget.refresh();

                                        Navigator.pop(context);
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
            },
          );
        },
        child: const Icon(
          Icons.edit,
          color: primaryColor,
        ),
      ),
    );
  }
}

class TextFormPopup extends StatelessWidget {
  final String? labelText;
  TextEditingController controller;
  final bool isEdit;

  TextFormPopup(
      {Key? key, this.labelText, required this.controller, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        readOnly: isEdit,
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
