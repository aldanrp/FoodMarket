import 'dart:convert';
import 'dart:io';

import 'package:restaurant_food/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'food_services.dart';
part 'transaction_services.dart';

String baseUrlUser = 'http://foodmarket-backend.buildwithangga.id/api/';
String baseUrlFood = 'https://foodmarket-backend.buildwithangga.id/api/';
