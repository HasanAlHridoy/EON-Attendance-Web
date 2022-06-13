import 'package:attendance_app/dashboard/Tables/attendance_table_ui/attend_edit_row.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:attendance_app/dummy.dart';
import 'package:flutter/material.dart';

class AttendenceTableData extends StatefulWidget {
  @override
  State<AttendenceTableData> createState() => _AttendenceTableDataState();
}

class _AttendenceTableDataState extends State<AttendenceTableData> {
  var tableRow = new TableRow();
  ScrollController scrollController = ScrollController();
  int rowsPerPage = 5;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Theme(
          data: Theme.of(context).copyWith(
            cardColor: secondaryColor,
            textTheme: const TextTheme(
              headline6: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white),
            ),
          ),
          child: PaginatedDataTable(
            // dragStartBehavior: DragStartBehavior.start,
            // header: Text("Attendance Table"),
            rowsPerPage: rowsPerPage,
            // columnSpacing: 15,
            // rowsPerPage: _rowsPerPage == 0 ? 10 : _rowsPerPage,
            availableRowsPerPage: <int>[5, 8, 10],
            onRowsPerPageChanged: (r) {
              print(r);
              rowsPerPage = r ?? 0;
              setState(() {});
            },
            columns: Datacolumn(context),
            source: tableRow,
            // initialFirstRowIndex: 0,
            // headingRowHeight: 0,
          ),
        ),
      ),
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
      DataColumn(
          label: Text(
        "FIrst Date",
        style: Theme.of(context).textTheme.subtitle2,
      )),
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
      DataColumn(
          label: Text(
        "Email",
        style: Theme.of(context).textTheme.subtitle2,
      )),
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
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Center(child: Text(demoRecentFiles[index].cid))),
      DataCell(Center(child: Text(demoRecentFiles[index].poiId))),
      DataCell(Center(child: Text('${demoRecentFiles[index].name}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].poiType}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].union}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].thana}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].district}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].division}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].market}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].territory}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].area}'))),
      DataCell(Center(child: Text('${demoRecentFiles[index].region}'))),
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
  int get rowCount => demoRecentFiles.length.toInt();

  @override
  int get selectedRowCount => 0;
}
