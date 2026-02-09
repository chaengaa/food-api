import 'dart:convert';

import 'package:foods_app/models/foods.dart';
import 'package:http/http.dart' as http;

class FoodServices {
  static Future<List<Foods>> getFood() async {
    final url = (Uri.parse(
      "https://maek20.github.io/Product_Foods/",
    )); //connect url
    final catchlink = await http.get(url); //get
    Map<String, dynamic> food = jsonDecode(catchlink.body); //change
    List data = food['foods']; //store as list
    return data.map((x) => Foods.fromJson(x)).toList(); //show
  }
}
