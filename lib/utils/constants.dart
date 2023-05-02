class Urls {
  static const String kBASEURL = "http://192.168.224.151:5000";
  static const String kADMINSIGNIN = "$kBASEURL/admin/signin";
  static const String kGetDashboardData = "$kBASEURL/admin/";
  static const String kGetUserData = "$kBASEURL/admin/users";
  static const String kGetVendorData = "$kBASEURL/admin/vm";
  static const String kGetSportsData = "$kBASEURL/admin/sports";
  static const String kGetVenueData = "$kBASEURL/admin/turf";
  static const String kBlockUsers = "$kBASEURL/admin/users/blockStatus";
  static const String kBlockVendors = "$kBASEURL/admin/vm/blockStatus";
  static const String kBlockSports = "$kBASEURL/admin/sports";
  static const String kBlockVenue = "$kBASEURL/admin/turf/block";
  static const String kApproveVenue = "$kBASEURL/admin/turf/approve";
  static const String kVendorStatus = "$kBASEURL/admin/vm/status";
  static const String kRejectVenue = "$kBASEURL/admin/turf/";// should pass id as query params
}

class InvalidRespons {
  static const kADMININVALIDRESPONSE = 100;
  static const kNOINTERNET = 101;
  static const kINVALIDFORMAT = 102;
  static const kUNKNOWNERROR = 103;
  static const kTIMEOUT = 104;
}
