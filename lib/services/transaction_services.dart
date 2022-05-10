part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client? client}) async {
    client ??= http.Client();

    Uri url = Uri.parse(baseUrlFood + 'transaction/?limit=100');

    try {
      var response = await client.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      });

      if (response.statusCode != 200) {
        var message = "data transaksi tidak dapat diambil";
        throw message;
      }

      var data = jsonDecode(response.body);
      print("ini merupakan data respone transaksi: " + data.toString());

      List<Transaction> transaction = (data['data']['data'] as Iterable)
          .map((e) => Transaction.fromJson(e))
          .toList();

      return ApiReturnValue(
          message: "Data Berhasil di ambil", value: transaction);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client? client}) async {
    print('udah masuk ke future belum?');
    client ??= http.Client();
    print('udh lewat client belom ?');
    Uri url = Uri.parse(baseUrlFood + 'checkout');
    print('udah dapet urlnya belom ?');
    var status;
    if (transaction.status == TransactionStatus.pending) {
      status = "PENDING";
    }
    try {
      var response = await client.post(url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${User.token}"
          },
          body: jsonEncode(<String, dynamic>{
            'food_id': transaction.food.id,
            'user_id': transaction.user.id,
            "quantity": transaction.quantity,
            "total": transaction.total,
            "status": status,
          }));

      if (response.statusCode != 200) {
        var message = 'Transaksi gagal dilakukan';
        throw message;
      }

      var data = jsonDecode(response.body);
      print('ini merupakan respon body dari checkout: ' + data.toString());

      Transaction value = Transaction.fromJson(data['data']);

      return ApiReturnValue(
          message: 'Transaksi berhasil dilakukan', value: value);
    } catch (e) {
      rethrow;
    }
  }

  // static Future<ApiReturnValue<Transaction>> submitTransaction(
  //     Transaction transaction,
  //     {http.Client? client}) async {
  //   client ??= http.Client();

  //   Uri url = Uri.parse(baseUrlFood + 'checkout');
  //   print(url);
  //   var response = await client.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${User.token}"
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'food_id': transaction.food.id,
  //         'user_id': transaction.user.id,
  //         "quantity": transaction.quantity,
  //         "total": transaction.total,
  //         "status": "PENDING"
  //       }));

  //   if (response.statusCode != 200) {
  //     // return ApiReturnValue(message: 'Please try again');
  //   }

  //   var data = jsonDecode(response.body);

  //   Transaction value = Transaction.fromJson(data['data']);

  //   return ApiReturnValue(value: value, message: 'data dapet');
  // }
}
