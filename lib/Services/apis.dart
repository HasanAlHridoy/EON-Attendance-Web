class ApiList {
  static const String _ip = '54.169.245.229';
  static const String _port = '7000';

  static String login = 'http://$_ip:$_port/api/v1/company/companyLogin';

  // static String getPoi = 'http://$_ip:$_port/api/v1/poi/poi';

  static String csvUploadPoi = 'http://$_ip:$_port/api/v1/poi/';

  static String csvUploadFieldForce = 'http://$_ip:$_port/api/v1/user/';

  static String csvUploadEmployeePoi = 'http://$_ip:$_port/api/v1/poiUser';

  static String singlePoiAddApi =
      'http://$_ip:$_port/api/v1/poi/single-poi-entry';

  static String singleEmployeeAddApi =
      'http://$_ip:$_port/api/v1/user/register';

  static String employeePoiAddApi(String id) =>
      'http://$_ip:$_port/api/v1/user/employee-poi-add/$id';

  static String getPoi(String rowsPerPage, String pageNumber) =>
      'http://$_ip:$_port/api/v1/poi/poi/$rowsPerPage/$pageNumber';

  static String getEmployee(String rowsPerPage, String pageNumber) =>
      'http://$_ip:$_port/api/v1/user/employee/$rowsPerPage/$pageNumber';

  static String getAttendance(String rowsPerPage, String pageNumber) =>
      'http://$_ip:$_port/api/v1/attendance/all-attendance/$rowsPerPage/$pageNumber';

  static String singlePoiEdit(String poiId) =>
      'http://$_ip:$_port/api/v1/poi/update-poi-entry/$poiId';

  static String singleEmployeeEdit(String id) =>
      'http://$_ip:$_port/api/v1/user/employee/$id';

  static String singlePoiDelete(String id) =>
      'http://$_ip:$_port/api/v1/poi/single-poi-delete/$id';

  static String singleEmployeeDelete(String id) =>
      'http://$_ip:$_port/api/v1/user/employee/$id';

  // static String getMyTeams(String id) => 'http://$_ip:$_port/myteams/$id';

  // static String getMemberDetails(String id) => 'http://$_ip:$_port/myteams/$id';
}
