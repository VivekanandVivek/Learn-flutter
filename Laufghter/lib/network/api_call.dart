import 'package:http/http.dart' as http;
import '../network/api_urls.dart';
import '../network/api_call.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/My_Toast.dart';



class ApiCall{

  static Future postApiCall(String url, model) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiUrls.base_url}$url'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(model.toJson()),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201 ) {
        var o = json.decode(response.body);
        print(o);
        return o;
      } else {
        if (response.statusCode == 401) {
          var o = json.decode(response.body);
          print(o);
          // Res401 res401= Res401.fromJson(o);
          MyToast.toast(o?.message);
          print(o);
        } else if (response.statusCode == 404) {
          var o = json.decode(response.body);
          // Res404 res401= Res404.fromJson(o);
          MyToast.toast(o?.message);
          print(o);
        }else if(response.statusCode == 400){
          var x = jsonDecode(response.body);
          MyToast.toast(x["message"].toString());
          print(x["message"].toString());
          // Res404 res401= Res404.fromJson(o);

        }
        else {
          Get.back();
          MyToast.toast(response.reasonPhrase.toString());
          debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
        }
      }
    } catch (e) {

      debugPrint("\n\n\n From catch block \n${ApiUrls.base_url}/$url\n$e\n\n\n");
    }
  }

}