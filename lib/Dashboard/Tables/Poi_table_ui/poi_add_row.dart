import 'package:attendance_app/Services/api_call.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupView extends StatefulWidget {
  String token;
  Function refresh;
  PopupView({Key? key, required this.token, required this.refresh})
      : super(key: key);

  @override
  _PopupView createState() => _PopupView();
}

class _PopupView extends State<PopupView> {
  final _formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  // ScrollController controller = ScrollController();
  //Conreollers
  TextEditingController cidController = TextEditingController();
  TextEditingController poiIdController = TextEditingController();
  TextEditingController poiTypeController = TextEditingController();
  TextEditingController unionController = TextEditingController();
  TextEditingController thanaController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController marketController = TextEditingController();
  TextEditingController territoryController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController zoneController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

  @override
  void dispose() {
    cidController.dispose();
    poiIdController.dispose();
    poiTypeController.dispose();
    unionController.dispose();
    thanaController.dispose();
    districtController.dispose();
    divisionController.dispose();
    marketController.dispose();
    territoryController.dispose();
    areaController.dispose();
    regionController.dispose();
    zoneController.dispose();
    latController.dispose();
    longController.dispose();
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
          controller: scrollController,
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
                            controller: cidController,
                            labelText: 'CID',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: poiIdController,
                            labelText: 'PoiId',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            controller: poiTypeController,
                            labelText: 'PoiType',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: unionController,
                            labelText: 'Union',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            controller: thanaController,
                            labelText: 'Thana',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: districtController,
                            labelText: 'District',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            controller: divisionController,
                            labelText: 'Division',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: marketController,
                            labelText: 'Market',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            controller: territoryController,
                            labelText: 'Territory',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: areaController,
                            labelText: 'Area',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            controller: regionController,
                            labelText: 'Region',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: zoneController,
                            labelText: 'zone',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormPopup(
                            controller: latController,
                            labelText: 'Lat',
                          ),
                        ),
                        Expanded(
                          child: TextFormPopup(
                            controller: longController,
                            labelText: 'Long',
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
                                  poiIdController.text != '' &&
                                  poiTypeController.text != '' &&
                                  unionController.text != '' &&
                                  thanaController.text != '' &&
                                  districtController.text != '' &&
                                  divisionController.text != '' &&
                                  marketController.text != '' &&
                                  territoryController.text != '' &&
                                  areaController.text != '' &&
                                  regionController.text != '' &&
                                  zoneController.text != '' &&
                                  latController.text != '' &&
                                  longController.text != '') {
                                await ApiCall().singlePoiAddRow(
                                  widget.token,
                                  cidController.text,
                                  poiIdController.text,
                                  poiTypeController.text,
                                  unionController.text,
                                  thanaController.text,
                                  districtController.text,
                                  divisionController.text,
                                  marketController.text,
                                  territoryController.text,
                                  areaController.text,
                                  regionController.text,
                                  zoneController.text,
                                  latController.text,
                                  longController.text,
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
  TextEditingController? controller;

  TextFormPopup({Key? key, this.labelText, this.controller}) : super(key: key);

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
