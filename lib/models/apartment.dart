class Apartment {
  int apartmentId;
  String apartmentName;
  int numberOfFlat;
  int numberOfFloor;

  Apartment(this.apartmentId, this.apartmentName, this.numberOfFlat,
      this.numberOfFloor);

  Apartment.fromJson(Map json){
    apartmentId = json["apartmentId"];
    apartmentName = json["apartmentName"];
    numberOfFloor = json["numberOfFloor"];
    numberOfFlat = json["numberOfFlat"];
  }

  Map toJson() {
    return {
      "id": apartmentId,
      "apartmentName": apartmentName,
      "numberOfFloor": numberOfFloor,
      "numberOfFlat": numberOfFlat,
    };
  }
}