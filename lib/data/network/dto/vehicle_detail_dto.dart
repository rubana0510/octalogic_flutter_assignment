class VehicleDetails {
  VehicleDetails({
    required this.data,
    required this.message,
    required this.status,
    required this.applicationCode,
    required this.stack,
  });

  final Details? data;
  final String? message;
  final int? status;
  final dynamic applicationCode;
  final dynamic stack;

  factory VehicleDetails.fromJson(Map<String, dynamic> json){
    return VehicleDetails(
      data: json["data"] == null ? null : Details.fromJson(json["data"]),
      message: json["message"],
      status: json["status"],
      applicationCode: json["applicationCode"],
      stack: json["stack"],
    );
  }

}

class Details {
  Details({
    required this.id,
    required this.name,
    required this.vehicleTypeId,
    //required this.createdAt,
   // required this.updatedAt,
    required this.image,
  });

  final String id;
  final String name;
  final String vehicleTypeId;
  //final DateTime? createdAt;
 // final DateTime? updatedAt;
  final Image image;

  factory Details.fromJson(Map<String, dynamic> json) {

    return Details(
      id: json['data']['id'] ?? '0',  // Default value if null
      name: json['data']['name'] ?? '',  // Default value if null
      vehicleTypeId: json['data']['vehicleTypeId'] ?? 'Unknown',  // Default value if null
    //  createdAt: json['data']['createdAt'] ?? 'Unknown',  // Default value if null
     // updatedAt: json['data']['updatedAt'] ?? 'Unknown',  // Default value if null
      image: Image.fromJson(json['data']['image'] ?? {}),  // Provide fallback if null
    );
  }

}

class Image {
  Image({
    required this.key,
    required this.publicUrl,
  });

  final String? key;
  final String publicUrl;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      key: json["key"],
      publicUrl: json["publicURL"],
    );
  }

}
