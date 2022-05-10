import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_food/models/models.dart';
import 'package:restaurant_food/services/services.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  Future<void> getTransactions() async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();

    if (result.value != null) {
      emit(TransactionsLoaded(result.value));
    } else {
      emit(TransactionsLoadingFailed(result.message));
    }
  }

  Future<String?> submitTransaction(Transaction transaction) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionsLoaded(
          (state as TransactionsLoaded).transactions + [result.value]));
      return result.value.paymentUrl;
    } else {
      emit(TransactionsLoadingFailed(result.message));
      return null;
    }
  }
}
