import 'package:http/http.dart' as http;
import 'package:http_demo/data/api/Url_api.dart';

class ApartmentApi{
  static Future getApartments(){
    return http.get(Uri.parse(Url.localHost + '/apartments/getall'));
  }
  static Future getApartmentsByFlatId(int flatId){
    return http.get(Uri.parse(Url.localHost + '/flats/getbyid?flatId=$flatId'));
  }
}