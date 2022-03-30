part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 3));

    return ApiReturnValue(message: "Data dimasukan ", value: mockTransactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 2));

    return ApiReturnValue(
        message: "Data masuk",
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }
}
