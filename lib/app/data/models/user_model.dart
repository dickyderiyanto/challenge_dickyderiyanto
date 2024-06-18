import 'dart:convert';

class User {
  final int status;
  final String message;
  final Data data;
  final Links links;

  User({
    required this.status,
    required this.message,
    required this.data,
    required this.links,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
        links: Links.fromMap(json["links"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
        "links": links.toMap(),
      };
}

class Data {
  final String name;
  final String email;
  final dynamic emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String phoneNumber;
  final String profilePicture;
  final String role;
  final dynamic placeOfBirth;
  final DateTime dateOfBirth;
  final dynamic description;
  final String gender;
  final dynamic strNumber;
  final dynamic deletedAt;
  final dynamic csPhoneNumber;
  final int height;
  final int weight;
  final String fcmToken;
  final dynamic clinicBranchId;
  final dynamic icountClinicBusinessPartnerId;
  final dynamic csOfficeNumber;
  final dynamic queueNumber;
  final bool isReady;
  final bool isAllProduct;
  final dynamic customerServiceId;
  final dynamic activeDates;
  final String countryCode;
  final int totalClinicTransaction;
  final int totalOnlineStoreTransaction;
  final int totalAmountClinicTransaction;
  final int totalAmountOnlineStoreTransaction;
  final String status;

  Data({
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.phoneNumber,
    required this.profilePicture,
    required this.role,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.description,
    required this.gender,
    required this.strNumber,
    required this.deletedAt,
    required this.csPhoneNumber,
    required this.height,
    required this.weight,
    required this.fcmToken,
    required this.clinicBranchId,
    required this.icountClinicBusinessPartnerId,
    required this.csOfficeNumber,
    required this.queueNumber,
    required this.isReady,
    required this.isAllProduct,
    required this.customerServiceId,
    required this.activeDates,
    required this.countryCode,
    required this.totalClinicTransaction,
    required this.totalOnlineStoreTransaction,
    required this.totalAmountClinicTransaction,
    required this.totalAmountOnlineStoreTransaction,
    required this.status,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
        phoneNumber: json["phone_number"],
        profilePicture: json["profile_picture"],
        role: json["role"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        description: json["description"],
        gender: json["gender"],
        strNumber: json["str_number"],
        deletedAt: json["deleted_at"],
        csPhoneNumber: json["cs_phone_number"],
        height: json["height"],
        weight: json["weight"],
        fcmToken: json["fcm_token"],
        clinicBranchId: json["clinic_branch_id"],
        icountClinicBusinessPartnerId:
            json["icount_clinic_business_partner_id"],
        csOfficeNumber: json["cs_office_number"],
        queueNumber: json["queue_number"],
        isReady: json["is_ready"],
        isAllProduct: json["is_all_product"],
        customerServiceId: json["customer_service_id"],
        activeDates: json["active_dates"],
        countryCode: json["country_code"],
        totalClinicTransaction: json["total_clinic_transaction"],
        totalOnlineStoreTransaction: json["total_online_store_transaction"],
        totalAmountClinicTransaction: json["total_amount_clinic_transaction"],
        totalAmountOnlineStoreTransaction:
            json["total_amount_online_store_transaction"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
        "phone_number": phoneNumber,
        "profile_picture": profilePicture,
        "role": role,
        "place_of_birth": placeOfBirth,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "description": description,
        "gender": gender,
        "str_number": strNumber,
        "deleted_at": deletedAt,
        "cs_phone_number": csPhoneNumber,
        "height": height,
        "weight": weight,
        "fcm_token": fcmToken,
        "clinic_branch_id": clinicBranchId,
        "icount_clinic_business_partner_id": icountClinicBusinessPartnerId,
        "cs_office_number": csOfficeNumber,
        "queue_number": queueNumber,
        "is_ready": isReady,
        "is_all_product": isAllProduct,
        "customer_service_id": customerServiceId,
        "active_dates": activeDates,
        "country_code": countryCode,
        "total_clinic_transaction": totalClinicTransaction,
        "total_online_store_transaction": totalOnlineStoreTransaction,
        "total_amount_clinic_transaction": totalAmountClinicTransaction,
        "total_amount_online_store_transaction":
            totalAmountOnlineStoreTransaction,
        "status": status,
      };
}

class Links {
  final String apiUrl;
  final String apiUrlVersion;
  final String imageUrl;

  Links({
    required this.apiUrl,
    required this.apiUrlVersion,
    required this.imageUrl,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        apiUrl: json["api_url"],
        apiUrlVersion: json["api_url_version"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_url": apiUrl,
        "api_url_version": apiUrlVersion,
        "image_url": imageUrl,
      };
}
