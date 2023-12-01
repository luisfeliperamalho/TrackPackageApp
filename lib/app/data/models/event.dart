class Event {
  String? data;
  String? hora;
  String? local;
  String? status;
  // List<Null>? subStatus;

  Event({this.data, this.hora, this.local, this.status});

  Event.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    hora = json['hora'];
    local = json['local'];
    status = json['status'];
    // if (json['subStatus'] != null) {
    //   subStatus = <Null>[];
    //   json['subStatus'].forEach((v) {
    //     subStatus!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['hora'] = hora;
    data['local'] = local;
    data['status'] = status;
    // if (this.subStatus != null) {
    //   data['subStatus'] = this.subStatus!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
