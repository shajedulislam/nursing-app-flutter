class ShiftModel {
  String? date;
  String? shiftType;

  ShiftModel({this.date, this.shiftType});

  ShiftModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    shiftType = json['shift_type'];
  }
}
