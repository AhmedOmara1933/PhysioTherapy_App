class PatientModel {
  final int id;
  final String name;
  final String number;
  final String date;
  final String doctor;
  final String History;
  final String passport;

  PatientModel({
     required this.id,
      required this.name,
      required this.passport,
      required this.number,
      required this.doctor,
      required this.date,
      required this.History});

 factory PatientModel.fromJson(Map<String,dynamic> json)=>PatientModel(
      id: json["id"],
      name: json["name"],
      passport: json["passport"],
      number: json["numberOfPatient"],
      doctor: json["doctor"],
      date: json["date"],
      History: json["history"]);
}
