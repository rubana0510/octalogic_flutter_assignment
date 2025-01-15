class VehicleType {
  VehicleType({
    required this.data,
    required this.message,
    required this.status,
    required this.applicationCode,
    required this.stack,
  });

  final List<VehicleData> data;
  final String? message;
  final int? status;
  final dynamic applicationCode;
  final dynamic stack;

  factory VehicleType.fromJson(Map<String, dynamic> json){
    return VehicleType(
      data: json["data"] == null ? [] : List<VehicleData>.from(json["data"]!.map((x) => VehicleData.fromJson(x))),
      message: json["message"],
      status: json["status"],
      applicationCode: json["applicationCode"],
      stack: json["stack"],
    );
  }

}

class VehicleData {
  VehicleData({
    required this.id,
    required this.name,
    required this.wheels,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.vehicles,
  });

  final String? id;
  final String? name;
  final int? wheels;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Vehicle> vehicles;

  factory VehicleData.fromJson(Map<String, dynamic> json){
    return VehicleData(
      id: json["id"],
      name: json["name"],
      wheels: json["wheels"],
      type: json["type"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      vehicles: json["vehicles"] == null ? [] : List<Vehicle>.from(json["vehicles"]!.map((x) => Vehicle.fromJson(x))),
    );
  }

}

class Vehicle {
  Vehicle({
    required this.id,
    required this.name,
    required this.vehicleTypeId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String vehicleTypeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Vehicle.fromJson(Map<String, dynamic> json){
    return Vehicle(
      id: json["id"],
      name: json["name"],
      vehicleTypeId: json["vehicleTypeId"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

}
