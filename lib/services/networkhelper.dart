import 'package:mountain/models/getposts.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('http://mark.bslmeiyu.com/api/getplaces');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var body = response.body;
      return postFromJson(body);
    }
    //  else{
    //    return [];
    //  }
  }
}
