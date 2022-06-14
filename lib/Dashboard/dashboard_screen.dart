import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:attendance_app/Models/employee_data.dart';
import 'package:attendance_app/Models/poi_data.dart';
import 'package:attendance_app/Services/api_call.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:attendance_app/widgets/responsive_login.dart';
import 'package:attendance_app/Services/constants.dart';

import 'Tables/Attendance_table_ui/attendance_add_row.dart';
import 'Tables/Attendance_table_ui/attendence_table.dart';
import 'Tables/Field_table_ui/field_force.dart';
import 'Tables/Field_table_ui/filed_add_row.dart';
import 'Tables/Poi_table_ui/poi_add_row.dart';
import 'Tables/Poi_table_ui/poi_table.dart';

class DashboardScreen extends StatefulWidget {
  String? which_button = '';
  String token;
  DashboardScreen({Key? key, this.which_button, required this.token})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // List<dynamic> usersFiltered = [];
  // TextEditingController controller = TextEditingController();
  // String _searchResult = '';

  String uploadFilename = "";
  Uint8List? csvFile;

  Refresh() {
    setState(() {});
  }

  @override
  void initState() {
    // print('dash screen is carrying the token: ${widget.token}');

    super.initState();
  }

  //Download CSv
  List<PoiDataModel> getList = [];
  List<EmployeeDataModel> getFieldForceList = [];
  // List<EmployeeDataModel> getemployeeList = [];

  getFieldCSV(getFieldForceList) {
    // print(getFieldForceList[0].employeeName);
    // print('inside download function ->${widget.which_button}');

    List<List<dynamic>> rows = [];

    for (int i = 0; i < getFieldForceList.length; i++) {
      List<dynamic> row = [];
      row.add(getFieldForceList[i].cid);
      row.add(getFieldForceList[i].employeeId);
      row.add(getFieldForceList[i].employeeName);
      row.add(getFieldForceList[i].designation);
      row.add(getFieldForceList[i].mobile);
      row.add(getFieldForceList[i].email);
      row.add(getFieldForceList[i].market);
      row.add(getFieldForceList[i].territory);
      row.add(getFieldForceList[i].area);
      row.add(getFieldForceList[i].region);
      row.add(getFieldForceList[i].zone);
      rows.add(row);
      // print(rows);
    }
    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'cid,employeeId,employeeName,designation,mobile,email,market,territory,area,region,zone\n' +
            csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'file.csv'
      ..style.display = 'none'
      ..click();
  }

  getCsv(getList) {
    // print(getList[0].market);

    List<List<dynamic>> rows = [];

    for (int i = 0; i < getList.length; i++) {
//row refer to each column of a row in csv file and rows refer to each row in a file
      List<dynamic> row = [];
      row.add(getList[i].poiId);
      row.add(getList[i].poiType);
      row.add(getList[i].union);
      row.add(getList[i].thana);
      row.add(getList[i].district);
      row.add(getList[i].division);
      row.add(getList[i].market);
      row.add(getList[i].territory);
      row.add(getList[i].area);
      row.add(getList[i].region);
      row.add(getList[i].zone);
      row.add(getList[i].lat);
      row.add(getList[i].long);
      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'poiId,poiType,union,thana,district,division,market,territory,area,region,zone,lat,long\n' +
            csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'file.csv'
      ..style.display = 'none'
      ..click();
  }

  /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ++++++++++++++++++++++++++++++++++++++++POI Batch Upload FUNCTION+++++++++++++++++++++++++++++++++++++++++++++
  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

  batchUploadPoi() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (results == null) {
      return "File is not selected";
    } else {
      csvFile = results.files.first.bytes;
      //print(csvFile);

      // print(imgFile);

      uploadFilename = results.files.first.name;

      if (csvFile != null && uploadFilename != '' && widget.token != '') {
        ApiCall().sendFilePoi(csvFile, uploadFilename, widget.token);
      }
    }
  }

  /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  +++++++++++++++++++++++++++++++++++++Field Forced Batch Upload FUNCTION+++++++++++++++++++++++++++++++++++
  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

  batchUploadFieldForce() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (results == null) {
      return "file is empty";
    } else {
      csvFile = results.files.first.bytes;
      //print(csvFile);

      // print(imgFile);

      uploadFilename = results.files.first.name;

      if (csvFile != null && uploadFilename != '' && widget.token != '') {
        ApiCall().sendFileFieldForce(csvFile, uploadFilename, widget.token);
      }
    }
  }

  batchUploadEmployeePoi() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (results == null) {
      return "file is empty";
    } else {
      csvFile = results.files.first.bytes;
      //print(csvFile);

      // print(imgFile);

      uploadFilename = results.files.first.name;

      if (csvFile != null && uploadFilename != '' && widget.token != '') {
        ApiCall().sendEmployeePoi(csvFile, uploadFilename, widget.token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<String> items = ['POI Id', 'POI type', 'User id'];
    // String? selectedItem = 'POI Id';
    // print('after setState ${widget.which_button}');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defultPadding),
        child: Column(
          children: [
            Row(
              children: [
                if (!ResponsiveWidget.isLargeScreen(context))
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                if (ResponsiveWidget.isLargeScreen(context))
                  Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Spacer(flex: ResponsiveWidget.isLargeScreen(context) ? 2 : 1),
                // if (Responsive.isDesktop(context))
                //   DropdownButton<String>(
                //     value: selectedItem,
                //     items: items
                //         .map(
                //           (item) => DropdownMenuItem<String>(
                //             value: item,
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(
                //                 item,
                //                 style: Theme.of(context).textTheme.subtitle2,
                //               ),
                //             ),
                //           ),
                //         )
                //         .toList(),
                //     onChanged: (item) => setState(() => selectedItem = item),
                //   ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                    child: TextField(
                  // controller: controller,
                  // onChanged: (value) {
                  //   {
                  //     setState(() {
                  //       _searchResult = value;
                  //       usersFiltered = demoRecentFiles
                  //           .where((fileinfo) =>
                  //               fileinfo.cid.contains(_searchResult) ||
                  //               fileinfo.poiId.contains(_searchResult))
                  //           .toList();
                  //     });
                  //   }
                  // },
                  decoration: InputDecoration(
                    hintText: "Search Field",
                    fillColor: secondaryColor,
                    filled: true,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none),
                    suffixIcon: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      onTap: () {},
                      child: const Icon(Icons.search),
                    ),
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: defultPadding,
            ),
            Row(
              children: [
                Text(
                  widget.which_button.toString(),
                  style: ResponsiveWidget.isSmallScreen(context)
                      ? Theme.of(context).textTheme.subtitle1
                      : Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  width: 14,
                ),

// ***********************************************************************************
// **********************ADD ROW UI**********************************
// *************************************************************************
// *************************************************************************

                widget.which_button == "POI Table"
                    ? ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PopupView(
                                  token: widget.token,
                                  refresh: Refresh,
                                );
                              });
                        },
                        child: const Text(
                          " + Add Row",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    : widget.which_button == "Field Force"
                        ? ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FieldPopupView(
                                      token: widget.token,
                                      refresh: Refresh,
                                    );
                                  });
                            },
                            child: const Text(
                              " + Add Row",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        : AttendancePopupView(),

                // Row(
                //   children: [
                //     TextFormField(
                //       style: const TextStyle(color: Colors.white),
                //       // decoration: InputDecoration(labelText: ),
                //     ),
                //     TextFormField(),
                //   ],
                // ),
                // TextFormField(
                //   stl
                // ),
                const Spacer(),
                // SizedBox(
                //   width: 70,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: '',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 10),
                // SizedBox(
                //   width: 70,
                //   child: TextField(
                //     onChanged: (val){

                //     },
                //     decoration: InputDecoration(
                //       labelText: '',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 10),

                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {});
                //     },
                //     child: const Text("Fetch Data")),
                // *************************************************************************
                // **********************BATCH POI UPLOAD UI**********************************
                // *************************************************************************
                // *************************************************************************

                widget.which_button == 'Field Force'
                    ? ResponsiveWidget.isSmallScreen(context)
                        ? SizedBox(
                            width: 75.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                  // maximumSize: const Size(150, 50),
                                ),
                                onPressed: () async {
                                  await batchUploadEmployeePoi();
                                  setState(() {});
                                },
                                child: const Icon(Icons.file_copy),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                ),
                                onPressed: () async {
                                  // print('big ${widget.which_button}');
                                  await batchUploadEmployeePoi();
                                  setState(() {});
                                },
                                icon: const Icon(Icons.file_copy),
                                label: const Text("POI Upload"),
                              ),
                            ),
                          )
                    : const SizedBox(
                        width: 8,
                      ),

                // *************************************************************************
                // **********************BATCH EMPLOYEE UPLOAD UI**********************************
                // *************************************************************************
                // *************************************************************************

                ResponsiveWidget.isSmallScreen(context)
                    ? SizedBox(
                        width: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            // maximumSize: const Size(150, 50),
                          ),
                          onPressed: () async {
                            if (widget.which_button == 'POI Table') {
                              await batchUploadPoi();
                              setState(() {});
                            } else if (widget.which_button == 'Field Force') {
                              await batchUploadFieldForce();
                              setState(() {});
                            }
                          },
                          child: const Icon(Icons.file_copy),
                        ),
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: () async {
                          if (widget.which_button == 'POI Table') {
                            // print('big ${widget.which_button}');
                            await batchUploadPoi();
                            setState(() {});
                          } else if (widget.which_button == 'Field Force') {
                            // print('big ${widget.which_button}');
                            await batchUploadFieldForce();
                            setState(() {});
                          } else {}
                          //setState(() {});
                        },
                        icon: const Icon(Icons.file_copy),
                        label: const Text("Batch Upload"),
                      ),
                const SizedBox(
                  width: 8,
                ),

                // *************************************************************************
                // ***************************DOWNLOAD UI********************************************
                // *************************************************************************
                // *************************************************************************

                ResponsiveWidget.isSmallScreen(context)
                    ? SizedBox(
                        width: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.download),
                        ),
                      )
                    : ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: () {
                          if (widget.which_button == 'POI Table') {
                            getCsv(getList);
                          } else if (widget.which_button == 'Field Force') {
                            getFieldCSV(getFieldForceList);
                          }
                        },
                        icon: const Icon(Icons.download),
                        label: const Text("Download"),
                      )
              ],
            ),

            const SizedBox(
              height: defultPadding,
            ),

            // *************************************************************************
            // ***************************TABLE UI ********************************************
            // *************************************************************************
            // *************************************************************************

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: widget.which_button == "Attendance table"
                    ? AttendenceTableData(
                        token: widget.token,
                      )
                    : widget.which_button == "Field Force"
                        ? FieldForceData(
                            token: widget.token,
                            getFieldForceList: (value) async {
                              getFieldForceList = value;
                            },
                            getList: getList,
                          )
                        : PoiTableData(
                            token: widget.token,
                            getList: (value) async {
                              getList = value;
                            },
                          ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      result.files.first.bytes;
      // print(resultBytes);
      setState(() {});
    } else {
      throw "error";
      // User canceled the picker
    }
  }
}
