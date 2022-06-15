import 'dart:convert';
import 'package:attendance_app/Models/attendance_data.dart';
import 'package:attendance_app/Models/employee_data.dart';
import 'package:attendance_app/Models/poi_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:attendance_app/Services/apis.dart';

class ApiCall {
  Future login(String email, String password) async {
    if (email != '' && password != '') {
      final response = await http.post(
        Uri.parse(ApiList.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}),
      );
      // print('apicall--->');
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      }
    }

    return "Null";
  }

  // get All POI LIST
  List<PoiDataModel> poiIdList = [];

  Future getAllPoi(String token, String rowsPerPage, String pageNumber) async {
    // print('getallpoiapi is getting token or not->${token}');

    final response = await http.get(
        Uri.parse(ApiList.getPoi(rowsPerPage, pageNumber)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      List<PoiDataModel> poiIdList = poiDataModelFromJson(response.body);

      // print("getpoi $poiIdList");

      return poiIdList;
    } else {
      print("message failed");
    }
  }

  //CSV upload
  sendFilePoi(file, uploadFilename, token) {
    var url = Uri.parse(ApiList.csvUploadPoi);
    var request = http.MultipartRequest("POST", url);

    request.files.add(http.MultipartFile.fromBytes('file', file,
        filename: "$uploadFilename"));

    request.headers.addAll({"Authorization": "Bearer $token"});

    request.send().then((response) {
      // print("test");
      // print(response.statusCode);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Successfully Uploaded ',
            toastLength: Toast.LENGTH_SHORT,
            webPosition: "center");
      }
    });
  }

  // Single Poi Add Row
  Future singlePoiAddRow(
    String token,
    String cid,
    poiId,
    poiType,
    union,
    thana,
    district,
    division,
    market,
    territory,
    area,
    region,
    zone,
    lat,
    long,
  ) async {
    final response = await http.post(
      Uri.parse(ApiList.singlePoiAddApi),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        "cid": cid,
        "poiId": poiId,
        "poiType": poiType,
        "union": union,
        "thana": thana,
        "district": district,
        "division": division,
        "market": market,
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
        "lat": lat,
        "long": long,
      }),
    );
    // print('apicall--->');
    // print(response.statusCode);
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      Fluttertoast.showToast(
          msg: 'Successfully Submitted ',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
      return data;
    } else {
      Fluttertoast.showToast(
          msg: 'Failed',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
    }

    return "Null";
  }

  //Edit Single Row
  Future singlePoiEditRow(
    String id,
    String token,
    poiId,
    poiType,
    union,
    thana,
    district,
    division,
    market,
    territory,
    area,
    region,
    zone,
    lat,
    long,
  ) async {
    final response = await http.post(
      Uri.parse(ApiList.singlePoiEdit(id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        "poiId": poiId,
        "poiType": poiType,
        "union": union,
        "thana": thana,
        "district": district,
        "division": division,
        "market": market,
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
        "lat": lat,
        "long": long,
      }),
    );
    // print('apicall--->');
    // print(response.statusCode);
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      return data;
    }
    return "Null";
  }

  Future singlePoiDelete(String token, String id) async {
    print('singlepoidelteapi is getting token or not->$token');

    final response = await http.delete(Uri.parse(ApiList.singlePoiDelete(id)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 201) {
      var data = json.decode(response.body);

      return data;
    }
  }
//  *************************************************************************************************
//  *************************************************************************************************
//  *************************************EMPLOYEE FIELD FORCE****************************************
//  *************************************************************************************************
//  *************************************************************************************************

  List<EmployeeDataModel> employeeList = [];
  Future getAllEmployee(
      String token, String rowsPerPage, String pageNumber) async {
    // print('getallempapi is getting token or not->${token}');
    // print('getallempapi is getting rowsPerPage or not->${rowsPerPage}');
    // print('getallempapi is getting pageNumber or not->${pageNumber}');

    final response = await http.get(
        Uri.parse(ApiList.getEmployee(rowsPerPage, pageNumber)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });
    // print(response.body.toString());
    if (response.statusCode == 200) {
      List<EmployeeDataModel> employeeIdList =
          employeeDataModelFromJson(response.body);

      print('employee list print-> ${employeeIdList}');

      return employeeIdList;
    } else {
      // print("employee list  failed");
    }
  }

  //CSV upload
  sendFileFieldForce(file, uploadFilename, token) {
    var url = Uri.parse(ApiList.csvUploadFieldForce);
    var request = http.MultipartRequest("POST", url);

    request.files.add(http.MultipartFile.fromBytes('file', file,
        filename: "$uploadFilename"));

    request.headers.addAll({"Authorization": "Bearer $token"});

    request.send().then((response) {
      // print("test");
      // print(response.statusCode);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Successfully Uploaded ',
            toastLength: Toast.LENGTH_SHORT,
            webPosition: "center");
      }
    });
  }

  //CSV upload
  sendEmployeePoi(file, uploadFilename, token) {
    var url = Uri.parse(ApiList.csvUploadEmployeePoi);
    var request = http.MultipartRequest("POST", url);

    request.files.add(http.MultipartFile.fromBytes('file', file,
        filename: "$uploadFilename"));

    request.headers.addAll({"Authorization": "Bearer $token"});

    request.send().then((response) {
      // print("test");
      // print(response.statusCode);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Successfully Uploaded ',
            toastLength: Toast.LENGTH_SHORT,
            webPosition: "center");
      }
    });
  }

// Field Force Edit Button
  Future singleEmployeeEditRow(
    String id,
    String token,
    employeeId,
    employeeName,
    designation,
    mobile,
    email,
    market,
    territory,
    area,
    region,
    zone,
  ) async {
    final response = await http.put(
      Uri.parse(ApiList.singleEmployeeEdit(id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        "employeeId": employeeId,
        "employeeName": employeeName,
        "designation": designation,
        "mobile": mobile,
        "email": email,
        "market": market,
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
      }),
    );
    // print('apicall--->');
    // print(response.statusCode);
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      return data;
    }
    return "Null";
  }

  Future singleEmployeeDelete(String token, String id) async {
    print('singlepoidelteapi is getting token or not->$token');

    final response = await http.delete(
        Uri.parse(ApiList.singleEmployeeDelete(id)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 201) {
      var data = json.decode(response.body);

      return data;
    } else {
      return " Erorr";
    }
  }

  // Single Field Force Add Row
  Future singleFieldForceAddRow(
    String token,
    String cid,
    employeeId,
    employeeName,
    designation,
    password,
    mobileNumber,
    email,
    market,
    territory,
    area,
    region,
    zone,
  ) async {
    final response = await http.post(
      Uri.parse(ApiList.singleEmployeeAddApi),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        "cid": cid,
        "employeeId": employeeId,
        "employeeName": employeeName,
        "designation": designation,
        "password": password,
        "mobile": mobileNumber,
        "email": email,
        "market": market,
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
      }),
    );
    // print('apicall--->');
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Fluttertoast.showToast(
          msg: 'Successfully Submitted ',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
      return data;
    } else {
      Fluttertoast.showToast(
          msg: 'Failed',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
    }

    return "Null";
  }

  // Single Employee Poi Add Row
  Future singleEmployeePoiAddRow(
    String id,
    String token,
    String poiId,
  ) async {
    final response = await http.post(
      Uri.parse(ApiList.employeePoiAddApi(id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        "poiId": poiId,
      }),
    );
    // print('apicall--->');
    // print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Fluttertoast.showToast(
          msg: 'Successfully Submitted ',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
      return data;
    } else {
      Fluttertoast.showToast(
          msg: 'Failed',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
    }

    return "Null";
  }

  List<AttendanceDataModel> attendanceList = [];

  Future getAllAttendance(
      String token, String rowsPerPage, String pageNumber) async {
    // print('getAllAttendance is getting token or not->${token}');

    final response = await http.get(
        Uri.parse(ApiList.getAttendance(rowsPerPage, pageNumber)),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      List<AttendanceDataModel> attendanceList =
          attendanceDataModelFromJson(response.body);

      // print('attendanceList print-> ${attendanceList}');

      return attendanceList;
    } else {
      print("message failed");
    }
  }
}
