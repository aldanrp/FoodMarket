part of 'models.dart';

class ApiReturnValue<T> {
  late final T value;
  late final String message;

  ApiReturnValue({required this.message, required this.value});
}
