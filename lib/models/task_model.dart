class TaskModel {
  String? task;
  String? patient;
  String? status;
  String? date;
  String? shift;

  TaskModel({this.task, this.patient, this.status, this.date, this.shift});

  TaskModel.fromJson(Map<String, dynamic> json) {
    task = json['task'];
    patient = json['patient'];
    status = json['status'];
    date = json['date'];
    shift = json['shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['task'] = task;
    data['patient'] = patient;
    data['shift'] = shift;
    data['status'] = status;
    return data;
  }
}
