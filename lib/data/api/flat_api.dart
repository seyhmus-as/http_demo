import 'package:http/http.dart' as http;

class FlatApi{
  static Future getFlats(){
    return http.get(Uri.parse('https://02260eb439f3.ngrok.io/api/flats/getall'));
  }
}