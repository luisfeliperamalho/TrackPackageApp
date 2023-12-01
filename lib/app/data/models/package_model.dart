import 'package:track_package_app/app/data/models/event.dart';

class Package {
  String? codigo;
  String? host;
  List<Event>? eventos;
  double? time;
  int? quantidade;
  String? servico;
  String? ultimo;

  Package(
      {this.codigo,
      this.host,
      this.eventos,
      this.time,
      this.quantidade,
      this.servico,
      this.ultimo});

  Package.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    host = json['host'];
    if (json['eventos'] != null) {
      eventos = <Event>[];
      json['eventos'].forEach((v) {
        eventos!.add(Event.fromJson(v));
      });
    }
    time = json['time'];
    quantidade = json['quantidade'];
    servico = json['servico'];
    ultimo = json['ultimo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['codigo'] = codigo;
    data['host'] = host;
    if (eventos != null) {
      data['eventos'] = eventos!.map((v) => v.toJson()).toList();
    }
    data['time'] = time;
    data['quantidade'] = quantidade;
    data['servico'] = servico;
    data['ultimo'] = ultimo;
    return data;
  }
}
