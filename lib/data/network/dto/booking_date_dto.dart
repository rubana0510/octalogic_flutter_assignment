class BookingDetails {
  BookingDetails({
    required this.data,
    required this.message,
    required this.status,
    required this.applicationCode,
    required this.stack,
  });

  final List<Booking> data;
  final String? message;
  final int? status;
  final dynamic applicationCode;
  final dynamic stack;

  factory BookingDetails.fromJson(Map<String, dynamic> json){
    return BookingDetails(
      data: json["data"] == null ? [] : List<Booking>.from(json["data"]!.map((x) => Booking.fromJson(x))),
      message: json["message"],
      status: json["status"],
      applicationCode: json["applicationCode"],
      stack: json["stack"],
    );
  }

}

class Booking {
  Booking({
    required this.id,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? vehicleId;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Booking.fromJson(Map<String, dynamic> json){
    return Booking(
      id: json['id'],
      vehicleId: json['vehicleId'],
      startDate: DateTime.parse(json['startDate']),  // Convert string to DateTime
      endDate: DateTime.parse(json['endDate']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

}
