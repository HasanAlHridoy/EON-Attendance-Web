import 'package:attendance_app/Dashboard/Tables/Poi_table_ui/poi_delete_row.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/Dashboard/Tables/Poi_table_ui/poi_edit_row.dart';
import 'package:attendance_app/Models/poi_data.dart';
import 'package:attendance_app/Services/constants.dart';

import '../../../Services/api_call.dart';

List<PoiDataModel> data = [];

class PoiTableData extends StatefulWidget {
  Function(List<PoiDataModel>) getList;
  String token;
  PoiTableData({Key? key, required this.token, required this.getList})
      : super(key: key);

  @override
  State<PoiTableData> createState() => _PoiTableDataState();
}

class _PoiTableDataState extends State<PoiTableData> {
  ScrollController scrollController = ScrollController();
  // int rowsPerPage = 5;
  String rowsPerPage = '10';

  var pageNumber = "1";
  // @override
  // void initState() {

  //   print('ki ki run korbo ${widget.token}');

  //   super.initState();
  // }
  List<int> row123 = [5, 8, 10];
  Refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCall().getAllPoi(widget.token, rowsPerPage, pageNumber),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("loading......"),
          );
        } else if (snapshot.hasData) {
          // print('showing snapshot ${snapshot.data}');
          data = snapshot.data as List<PoiDataModel>;
          widget.getList(data);
          // print('getting getlist ${data}');
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
                child: PaginatedDataTable(
                  availableRowsPerPage: row123,
                  // dragStartBehavior: DragStartBehavior.start,
                  rowsPerPage: int.parse(rowsPerPage),
                  onRowsPerPageChanged: (value) {
                    var rowsPerPage1 = value ?? 0;
                    setState(() {
                      rowsPerPage = rowsPerPage1.toString();
                    });
                  },

                  columns: Datacolumn(context),

                  source: TableRow(
                      poiData: data, token: widget.token, refresh: Refresh),

                  // initialFirstRowIndex: 0,
                  // headingRowHeight: 0,
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
        "POI ID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
        label: Text(
          "POI Type",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Union",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Thana",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "District",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Division",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Market",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Territory",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Area",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Region",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Zone",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Lat & Long",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Action",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    ];
  }
}

class TableRow extends DataTableSource {
  List<PoiDataModel> poiData;
  // String<PoiTableData> allData;
  String token;
  Function refresh;

  // void Refresh() {}
  TableRow({required this.poiData, required this.token, required this.refresh});
  @override
  DataRow? getRow(int index) {
    var poiID = (poiData[index].poiId);
    var poiType = (poiData[index].poiType);
    var union = (poiData[index].union);
    var thana = (poiData[index].thana);
    var district = (poiData[index].district);
    var division = (poiData[index].division);
    var market = (poiData[index].market);
    var territory = (poiData[index].territory);
    var area = (poiData[index].area);
    var region = (poiData[index].region);
    var zone = (poiData[index].zone);
    var lat = (poiData[index].lat);
    var long = (poiData[index].long);
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Center(child: Text((poiData[index].poiId)))),
        DataCell(Center(child: Text(poiData[index].poiType))),
        DataCell(Center(child: Text(poiData[index].union))),
        DataCell(Center(child: Text(poiData[index].thana))),
        DataCell(Center(child: Text(poiData[index].district))),
        DataCell(Center(child: Text(poiData[index].division))),
        DataCell(Center(child: Text(poiData[index].market))),
        DataCell(Center(child: Text(poiData[index].territory))),
        DataCell(Center(child: Text(poiData[index].area))),
        DataCell(Center(child: Text(poiData[index].region))),
        DataCell(Center(child: Text(poiData[index].zone))),
        DataCell(Center(
            child: Text('${poiData[index].lat},${poiData[index].long}'))),
        // DataCell(Center(child: Text(poiData[index].long))),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EditView(
                  poiID: poiID,
                  poiType: poiType,
                  union: union,
                  thana: thana,
                  district: district,
                  division: division,
                  market: market,
                  territory: territory,
                  area: area,
                  region: region,
                  zone: zone,
                  lat: lat,
                  long: long,
                  refresh: refresh,
                  id: poiData[index].id,
                  token: token),

              PoiDeleteView(
                refresh: refresh,
                id: poiData[index].id,
                token: token,
              )
              // IconButton(
              //   onPressed: () {
              //     print("Delete");
              //   },
              //   icon: Icon(
              //     Icons.delete,
              //     color: Colors.red,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  get rowCount => poiData.length;

  @override
  int get selectedRowCount => 0;
}
