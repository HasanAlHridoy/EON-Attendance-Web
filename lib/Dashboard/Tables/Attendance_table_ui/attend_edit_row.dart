import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';

class AttendEditView extends StatefulWidget {
  const AttendEditView({Key? key}) : super(key: key);

  @override
  _AttendEditView createState() => _AttendEditView();
}

class _AttendEditView extends State<AttendEditView> {
  final _formKey = GlobalKey<FormState>();

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
                                  children: const [
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'EmployeeId',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'PoiId',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'Detail',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'POILatLong',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'FirstDate',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'submitDate',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'SubmitTime',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'Name',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'Distance',
                                      ),
                                    ),
                                    Expanded(
                                      child: TextFormPopup(
                                        labelText: 'FaceRecognition',
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
                                          primary:
                                              Colors.red, // Background color
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
                                          primary:
                                              primaryColor, // Background color
                                        ),
                                        child: const Text(
                                          "Submit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {},
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
              });
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

  const TextFormPopup({Key? key, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
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
