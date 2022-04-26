part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseUrlFood + 'food');

    try {
      var response = await client.get(url);

      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        String message = 'Data tidak dapat diambil';
        throw message;
      }

      List<Food> foods = (data['data']['data'] as Iterable)
          .map((e) => Food.fromJson(e))
          .toList();

      return ApiReturnValue(message: "Data Berhasil di ambil", value: foods);
    } catch (e) {
      rethrow;
    }
  }
}
