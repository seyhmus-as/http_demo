class Flat{
  int id;
  int flatId;
  int apartmentId;
  int priceOfRent;
  int renterId;

  Flat(this.id,this.apartmentId,this.flatId,this.priceOfRent,this.renterId);

  Flat.fromJson(Map json){
    id = json["id"];
    flatId = json["flatId"];
    apartmentId = json["apartmentId"];
    priceOfRent = json["priceOfRent"];
    renterId = json["renterId"];
  }

  Map toJson(){
    return {
      "id":id,
      "flatId":flatId,
      "apartmentId":apartmentId,
      "priceOfRent":priceOfRent,
      "renterId":renterId,
    };
  }
}