import 'package:http/http.dart' as http;

class ApartmentApi{
  static Future getApartments(){
    return http.get(Uri.parse('https://02260eb439f3.ngrok.io/api/apartments/getall'));
  }
  static Future getApartmentsByFlatId(int flatId){
    return http.get(Uri.parse('https://02260eb439f3.ngrok.io/api/flats/getbyid?flatId=$flatId'));
  }
}