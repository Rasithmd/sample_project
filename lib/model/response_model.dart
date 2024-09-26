class Response {
  String count;
  String message;
  List<AllVehicleMake> results;

  Response({
    required this.count,
    required this.message,
    required this.results,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        count: json["Count"].toString(),
        message: json["Message"].toString(),
        results: List<AllVehicleMake>.from(
            json["Results"].map((x) => AllVehicleMake.fromJson(x))),
      );
}

class Results {
  List<dynamic> allVehicleMakes;

  Results({
    required this.allVehicleMakes,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        allVehicleMakes:
            List<dynamic>.from(json["AllVehicleMakes"].map((x) => (x))),
      );

  Map<String, dynamic> toJson() => {
        "AllVehicleMakes":
            List<dynamic>.from(allVehicleMakes.map((x) => x.toJson())),
      };
}

class AllVehicleMake {
  String makeId;
  String makeName;

  AllVehicleMake({
    required this.makeId,
    required this.makeName,
  });

  factory AllVehicleMake.fromJson(Map<String, dynamic> json) => AllVehicleMake(
        makeId: json['Make_ID'].toString(),
        makeName: json['Make_Name'].toString(),
      );

  Map<String, dynamic> toJson() => {
        "Make_ID": makeId,
        "Make_Name": makeName,
      };
}
