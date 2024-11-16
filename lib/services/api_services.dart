import 'package:http/http.dart' as http;
import 'package:uppwork/model/item_model.dart';

class ApiServices {
  static var client = http.Client();
  // Fetch items from API
  static Future<ItemModel?> getItems(int pageNum) async {
    try {
      final result = await client.get(Uri.parse('https://oases.tripod.xyz.lk/api/getPosts?page=$pageNum'));

      var body = result.body;
      if (result.statusCode == 200) {
        final ItemModel data = itemModelFromJson(body);
        return data;
      } else {
        print('Could not connect to server');
        return null;
      }
    } catch (ex) {
      print('Error: $ex');
      return null;
    }
  }

  static Future<ItemModel?> searchItems(int pageNum, String searchText) async {
    try {
      final result = await client.get(Uri.parse('https://oases.tripod.xyz.lk/api/getPosts?page=$pageNum/$searchText'));

      var body = result.body;
      if (result.statusCode == 200) {
        final ItemModel data = itemModelFromJson(body);
        return data;
      } else {
        print('Could not connect to server');
        return null;
      }
    } catch (ex) {
      print('Error: $ex');
      return null;
    }
  }
}
