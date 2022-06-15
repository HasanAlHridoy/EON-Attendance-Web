import 'package:attendance_app/Services/api_call.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditView extends StatefulWidget {
  String poiID;
  String poiType;
  String union;
  String thana;
  String district;
  String division;
  String market;
  String territory;
  String area;
  String region;
  String zone;
  String lat;
  String long;
  //for api call
  String token;
  String id;
  Function refresh;
  EditView({
    Key? key,
    required this.poiID,
    required this.poiType,
    required this.union,
    required this.thana,
    required this.district,
    required this.division,
    required this.market,
    required this.territory,
    required this.area,
    required this.region,
    required this.zone,
    required this.lat,
    required this.long,
    //for api call
    required this.token,
    required this.id,
    required this.refresh,
  }) : super(key: key);
  @override
  _EditView createState() => _EditView();
}

class _EditView extends State<EditView> {
  final _formKey = GlobalKey<FormState>();
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
  void initState() {
    if (widget.poiID != "") {
      poiIdController.text = widget.poiID;
    }
    if (widget.poiType != "") {
      poiTypeController.text = widget.poiType;
    }
    if (widget.union != "") {
      unionController.text = widget.union;
    }
    if (widget.thana != "") {
      thanaController.text = widget.thana;
    }
    if (widget.district != "") {
      districtController.text = widget.district;
    }
    if (widget.division != "") {
      divisionController.text = widget.division;
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
    if (widget.lat != "") {
      latController.text = widget.lat;
    }
    if (widget.long != "") {
      longController.text = widget.long;
    }
    super.initState();
  }

  // @override
  // void dispose() {
  //   poiIdController.dispose();
  //   poiTypeController.dispose();
  //   unionController.dispose();
  //   thanaController.dispose();
  //   districtController.dispose();
  //   divisionController.dispose();
  //   marketController.dispose();
  //   territoryController.dispose();
  //   areaController.dispose();
  //   regionController.dispose();
  //   zoneController.dispose();
  //   latController.dispose();
  //   longController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 12.0,
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
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
                                      labelText: 'PoiId',
                                      controller: poiIdController,
                                      isEdit: true,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'PoiType',
                                      controller: poiTypeController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Union',
                                      controller: unionController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Thana',
                                      controller: thanaController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'District',
                                      controller: districtController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Division',
                                      controller: divisionController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Market',
                                      controller: marketController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Territory',
                                      controller: territoryController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Area',
                                      controller: areaController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Region',
                                      controller: regionController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'zone',
                                      controller: zoneController,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Lat',
                                      controller: latController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormPopup(
                                      labelText: 'Long',
                                      controller: longController,
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
                                        primary: Colors.red,
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
                                        primary: primaryColor,
                                      ),
                                      child: const Text(
                                        "Submit",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        await ApiCall().singlePoiEditRow(
                                          widget.id,
                                          widget.token,
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

                                        Fluttertoast.showToast(
                                            msg: 'Edit Successful',
                                            toastLength: Toast.LENGTH_SHORT,
                                            webPosition: "center");
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
            });
      },
      child: const Icon(
        Icons.edit,
        color: primaryColor,
      ),
    );
  }
}

class TextFormPopup extends StatelessWidget {
  final String? labelText;
  TextEditingController? controller;
  final bool isEdit;

  TextFormPopup(
      {Key? key, this.labelText, this.controller, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        readOnly: isEdit,
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
