class Urls {
  static const String kBASEURL = "http://192.168.224.151:5000";
  static const String kADMINSIGNIN = "$kBASEURL/admin/signin";
  static const String kGetDashboardData = "$kBASEURL/admin/";
  static const String kGetUserData = "$kBASEURL/admin/users";
  static const String kGetVendorData = "$kBASEURL/admin/vm";
  static const String kBlockUsers = "$kBASEURL/admin/users/blockStatus";
  static const String kBlockVendors = "$kBASEURL/admin/vm/blockStatus";
}

class InvalidRespons {
  static const kADMININVALIDRESPONSE = 100;
  static const kNOINTERNET = 101;
  static const kINVALIDFORMAT = 102;
  static const kUNKNOWNERROR = 103;
  static const kTIMEOUT = 104;
}
