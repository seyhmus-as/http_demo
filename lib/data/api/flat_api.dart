import 'package:http/http.dart' as http;
import 'package:http_demo/data/api/Url_api.dart';

class FlatApi {
  static Future getFlats(){
    return http.get(Uri.parse(Url.localHost+'/flats/getall'));
  }
}