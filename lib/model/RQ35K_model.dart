class PT_RQ35K {
  int No;
  String Projector;
  String Projector_Serial_Number;
  String IP_Address;
  String Light_source_hours;
  String Projector_hours;
  String Main_SW_ver;
  List<dynamic> Card;
  String Country_of_Loan;
  String Date_Import;
  String? Note;
  String? Status;


  PT_RQ35K({
    required this.No,
    required this.Projector,
    required this.Projector_Serial_Number,
    required this.IP_Address,
    required this.Light_source_hours,
    required this.Projector_hours,
    required this.Main_SW_ver,
    required this.Card,
    required this.Country_of_Loan,
    required this.Date_Import,
  });

}
