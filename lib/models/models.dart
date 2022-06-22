import 'package:cloud_firestore/cloud_firestore.dart';

class BaseData {
  String landlordID;
  String? tenantID;
  String houseCode;
  DateTime? dateCreated;
  String? status;

  BaseData({
    required this.landlordID,
    this.tenantID,
    required this.houseCode,
    this.dateCreated,
    this.status,
  });
}

class Location {
  String locationID;
  String region;
  String? province;
  String city;
  String barangay;

  Location({
    required this.locationID,
    required this.region,
    this.province,
    required this.city,
    required this.barangay,
  });
}

class BasicInformation extends Location {
  String userInfoID;
  String firstName;
  String? middleName;

  String lastName;
  String contactNumber;
  String signatureURL;
  String email;

  BasicInformation({
    required this.userInfoID,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.contactNumber,
    required this.signatureURL,
    required this.email,
    required String locationID,
    required String region,
    String? province,
    required String city,
    required String barangay,
  }) : super(
          locationID: locationID,
          region: region,
          province: province,
          city: city,
          barangay: barangay,
        );
}

class AbangUser extends BasicInformation {
  String userID;
  Timestamp dateCreated;
  String role;
  String avatarURL;
  AbangUser({
    required this.userID,
    required this.role,
    required this.dateCreated,
    required this.avatarURL,
    required String userInfoID,
    required String firstName,
    String? middleName,
    required String lastName,
    required String contactNumber,
    required String signatureURL,
    required String email,
    required String locationID,
    required String region,
    String? province,
    required String city,
    required String barangay,
  }) : super(
          userInfoID: userInfoID,
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          contactNumber: contactNumber,
          signatureURL: signatureURL,
          email: email,
          locationID: locationID,
          region: region,
          province: province,
          city: city,
          barangay: barangay,
        );

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "role": role,
      "dateCreated": dateCreated,
      "basicInformation": {
        "userInfoID": userInfoID,
        "firstName": firstName,
        "middleName": middleName ?? "",
        "lastName": lastName,
        "contactNumber": contactNumber,
        "email": email,
      },
      "avatarURL": avatarURL,
      "signatureURL": signatureURL,
      "location": {
        "locationID": locationID,
        "region": region,
        "province": province ?? "",
        "city": city,
        "barangay": barangay,
      }
    };
  }

  factory AbangUser.fromMap(Map<String, dynamic> data) {
    AbangUser user = AbangUser(
      userID: data["userID"],
      role: data["role"],
      dateCreated: data["dateCreated"],
      userInfoID: data["basicInformation"]["userInfoID"],
      firstName: data["basicInformation"]["firstName"],
      middleName: data["basicInformation"]["middleName"] ?? "",
      lastName: data["basicInformation"]["lastName"],
      contactNumber: data["basicInformation"]["contactNumber"],
      avatarURL: data["avatarURL"],
      signatureURL: data["signatureURL"],
      email: data["basicInformation"]["email"],
      locationID: data["location"]["locationID"],
      region: data["location"]["region"],
      province: data["location"]["province"] ?? "",
      city: data["location"]["city"],
      barangay: data["location"]["barangay"],
    );
    return user;
  }
}

class AbangEstablishmentDetails extends Location {
  String estType;
  String estName;
  int numOfRooms;
  int avgRoomCapacity;
  double roomRate;
  Map<String, dynamic>? paymentInc;
  Map<String, dynamic>? otherPayments;
  Map<String, dynamic>? contractDetails;
  List<String> estImgURLs;
  String signatureURL;
  BaseData idData;

  AbangEstablishmentDetails({
    required this.estType,
    required this.estName,
    required this.numOfRooms,
    required this.avgRoomCapacity,
    required this.roomRate,
    this.paymentInc,
    this.otherPayments,
    required this.contractDetails,
    required this.estImgURLs,
    required this.signatureURL,
    required this.idData,
    required String locationID,
    required String region,
    String? province,
    required String city,
    required String barangay,
  }) : super(
          locationID: locationID,
          region: region,
          province: province,
          city: city,
          barangay: barangay,
        );

  Map<String, dynamic> toMap() {
    return {
      "landLordID": idData.landlordID,
      "houseCode": idData.houseCode,
      "dateCreated": idData.dateCreated,
      "estType": estType,
      "estLocation": {
        "locationID": locationID,
        "region": region,
        "province": province,
        "city": city,
        "barangay": barangay,
      },
      "estName": estName,
      "numOfRooms": numOfRooms,
      "avgRoomCapacity": avgRoomCapacity,
      "roomRate": roomRate,
      "paymentInc": paymentInc ?? {},
      "otherPayments": otherPayments ?? {},
      "contractDetails": contractDetails,
      "estImgURLs": estImgURLs,
      "signatureURL": signatureURL,
    };
  }

  factory AbangEstablishmentDetails.fromMap(Map<String, dynamic> data) {
    AbangEstablishmentDetails est = AbangEstablishmentDetails(
      estType: data["estType"],
      estName: data["estName"],
      numOfRooms: data["numOfRooms"],
      avgRoomCapacity: data["avgRoomCapacity"],
      roomRate: data["roomRate"],
      paymentInc: data["paymentInc"],
      otherPayments: data["otherPayments"],
      contractDetails: data["contractDetails"],
      estImgURLs: data["estImgURLs"],
      signatureURL: data["signatureURL"],
      idData: data["idData"],
      locationID: data["locationID"],
      region: data["region"],
      province: data["province"],
      city: data["city"],
      barangay: data["barangay"],
    );
    return est;
  }
}

class HouseCodes extends BaseData {
  Map<String, dynamic> roomAvailability;
  int occupied;
  int vacants;
  int tenants;
  HouseCodes({
    required this.roomAvailability,
    required this.occupied,
    required this.vacants,
    required this.tenants,
    required String landlordID,
    required String houseCode,
  }) : super(
          landlordID: landlordID,
          houseCode: houseCode,
        );

  Map<String, dynamic> toMap() {
    return {
      "occupied": occupied,
      "vacants": vacants,
      "tenants": tenants,
      "roomAvailability": roomAvailability,
      "landlordID": landlordID,
      "houseCode": houseCode,
    };
  }

  factory HouseCodes.fromMap(Map<String, dynamic> data) {
    HouseCodes houseCodes = HouseCodes(
      occupied: data["occupied"],
      vacants: data["vacants"],
      tenants: data["tenants"],
      roomAvailability: data["roomAvailability"],
      landlordID: data["landlordID"],
      houseCode: data["houseCode"],
    );
    return houseCodes;
  }
}

class Invoices extends BaseData {
  double totalPayment;
  String invoiceCode;
  double roomRate;
  Map<String, dynamic>? paymentInc;
  Map<String, dynamic>? otherPayments;
  DateTime? datePaid;

  Invoices({
    required this.totalPayment,
    required this.invoiceCode,
    required this.roomRate,
    this.paymentInc,
    this.otherPayments,
    this.datePaid,
    required String landlordID,
    required String tenantID,
    required String houseCode,
    required DateTime dateCreated,
    required String status,
  }) : super(
          landlordID: landlordID,
          tenantID: tenantID,
          houseCode: houseCode,
          dateCreated: dateCreated,
          status: status,
        );

  Map<String, dynamic> toMap() {
    return {
      "landlordID": landlordID,
      "tenantID": tenantID,
      "invoiceCode": invoiceCode,
      "totalPayment": totalPayment,
      "status": status,
      "dateCreated": dateCreated,
      "roomRate": roomRate,
      "paymentInc": paymentInc ?? {},
      "otherPayments": otherPayments ?? {},
      "datePaid": datePaid,
    };
  }

  factory Invoices.fromMap(Map<String, dynamic> data) {
    Invoices invoice = Invoices(
      totalPayment: data["totalPayment"],
      invoiceCode: data["invoiceCode"],
      roomRate: data["roomRate"],
      paymentInc: data["paymentInc"],
      otherPayments: data["otherPayments"],
      datePaid: data["datePaid"],
      landlordID: data["landlordID"],
      tenantID: data["tenantID"],
      houseCode: data["houseCode"],
      dateCreated: data["dateCreated"],
      status: data["status"],
    );
    return invoice;
  }
}

class ComplaintTickets extends BaseData {
  String ticketCode;
  String complaintMsg;
  List<String> imgURLs;

  ComplaintTickets({
    required this.ticketCode,
    required this.complaintMsg,
    required this.imgURLs,
    required String landlordID,
    required String tenantID,
    required String houseCode,
    required String status,
    required DateTime dateCreated,
  }) : super(
          landlordID: landlordID,
          tenantID: tenantID,
          houseCode: houseCode,
          status: status,
          dateCreated: dateCreated,
        );

  Map<String, dynamic> toMap() {
    return {
      "landlordID": landlordID,
      "tenantID": tenantID,
      "houseCode": houseCode,
      "ticketCode": ticketCode,
      "dateCreated": dateCreated,
      "complaintMsg": complaintMsg,
      "imgURLs": imgURLs,
      "status": status,
    };
  }

  factory ComplaintTickets.fromMap(Map<String, dynamic> data) {
    ComplaintTickets complaintTicket = ComplaintTickets(
      ticketCode: data["ticketCode"],
      complaintMsg: data["complaintMsg"],
      imgURLs: data["imgURLs"],
      landlordID: data["landlordID"],
      tenantID: data["tenantID"],
      houseCode: data["houseCode"],
      status: data["status"],
      dateCreated: data["dateCreated"],
    );
    return complaintTicket;
  }
}

class Notifications {
  String userID;
  String notifCode;
  String notifType;
  String status;

  Notifications({
    required this.userID,
    required this.notifCode,
    required this.notifType,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "notifCode": notifCode,
      "notifType": notifType,
      "status": status,
    };
  }

  factory Notifications.fromMap(Map<String, dynamic> data) {
    Notifications notification = Notifications(
      userID: data["userID"],
      notifCode: data["notifCode"],
      notifType: data["notifType"],
      status: data["status"],
    );
    return notification;
  }
}

class Tenants extends BaseData {
  int? roomNumber;
  Tenants({
    required String landlordID,
    required String tenantID,
    required String houseCode,
    required roomNumber,
  }) : super(
          landlordID: landlordID,
          tenantID: tenantID,
          houseCode: houseCode,
        );

  Map<String, dynamic> toMap() {
    return {
      "landlordID": landlordID,
      "tenantID": tenantID,
      "houseCode": houseCode,
      "roomNumber": roomNumber,
    };
  }

  factory Tenants.fromMap(Map<String, dynamic> data) {
    Tenants tenant = Tenants(
      landlordID: data["landlordID"],
      tenantID: data["tenantID"],
      houseCode: data["houseCode"],
      roomNumber: data["roomNumber"],
    );
    return tenant;
  }
}
