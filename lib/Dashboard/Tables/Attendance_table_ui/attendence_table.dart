import 'package:attendance_app/Models/attendance_data.dart';
import 'package:attendance_app/dashboard/Tables/attendance_table_ui/attend_edit_row.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:attendance_app/dummy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Services/api_call.dart';

List<AttendanceDataModel> data = [];

class AttendenceTableData extends StatefulWidget {
  String token;
  AttendenceTableData({Key? key, required this.token}) : super(key: key);
  @override
  State<AttendenceTableData> createState() => _AttendenceTableDataState();
}

class _AttendenceTableDataState extends State<AttendenceTableData> {
  ScrollController scrollController = ScrollController();
  String rowsPerPage = '10';
  var pageNumber = "1";

  Refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCall().getAllAttendance(widget.token, rowsPerPage, pageNumber),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("loading......"),
          );
        } else if (snapshot.hasData) {
          print('showing snapshot ${snapshot.data}');
          data = snapshot.data as List<AttendanceDataModel>;

          return SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              child: Theme(
                data: Theme.of(context).copyWith(
                  cardColor: secondaryColor,
                  textTheme: const TextTheme(
                    headline6: TextStyle(color: Colors.white),
                    bodyText2: TextStyle(color: Colors.white),
                    caption: TextStyle(color: Colors.white),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            onChanged: (val) {
                              rowsPerPage = val;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: '',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            onChanged: (val) {
                              pageNumber = val;
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Text("Fetch Data")),
                      ],
                    ),
                    PaginatedDataTable(
                      rowsPerPage: 10,
                      // onRowsPerPageChanged: (value) {
                      //   var rowsPerPage1 = value ?? 0;
                      //   setState(() {
                      //     rowsPerPage = rowsPerPage1.toString();
                      //   });
                      // },
                      columns: Datacolumn(context),
                      source: TableRow(
                          attendanceData: data,
                          token: widget.token,
                          refresh: Refresh),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Text('Something is wrong');
        }
      },
    );
  }

  List<DataColumn> Datacolumn(BuildContext context) {
    return <DataColumn>[
      DataColumn(
          label: Text(
        "CID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Employee ID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "POI Id",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Detail",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "POI Lat,Long",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      // DataColumn(
      //     label: Text(
      //   "FIrst Date",
      //   style: Theme.of(context).textTheme.subtitle2,
      // )),
      DataColumn(
          label: Text(
        "Submit Date",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Submit Time",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Name",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      // DataColumn(
      //     label: Text(
      //   "Email",
      //   style: Theme.of(context).textTheme.subtitle2,
      // )),
      DataColumn(
          label: Text(
        "Mobile",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Distance",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Face Recognition",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Action",
        style: Theme.of(context).textTheme.subtitle2,
      )),
    ];
  }
}

class TableRow extends DataTableSource {
  List<AttendanceDataModel> attendanceData;

  String token;
  Function refresh;

  TableRow(
      {required this.attendanceData,
      required this.token,
      required this.refresh});

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Center(child: Text(attendanceData[index].cid))),
      DataCell(Center(child: Text(attendanceData[index].employeeId))),
      DataCell(Center(child: Text('${demoRecentFiles[index].name}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].poiType}'))),
      DataCell(Center(
          child: Text(
              '${attendanceData[index].lat}, ${attendanceData[index].long}'))),
      // DataCell(Center(child: Text('${demoRecentFiles[index].thana}'))),
      DataCell(Center(child: Text(attendanceData[index].attendanceDate))),
      DataCell(Center(child: Text('${demoRecentFiles[index].division}'))),
      DataCell(Center(child: Text(attendanceData[index].employeeName))),
      // DataCell(Center(child: Text(attendanceData[index].))),
      DataCell(Center(child: Text(attendanceData[index].mobile))),
      DataCell(Center(child: Text(attendanceData[index].distance))),
      DataCell(Center(child: Text('${demoRecentFiles[index].latLong}'))),
      DataCell(Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AttendEditView(),
            // AttendanceDeleteView(),
          ],
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => attendanceData.length;

  @override
  int get selectedRowCount => 0;
}
