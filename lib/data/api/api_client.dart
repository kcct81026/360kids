import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:three_sixty_kids/data/models/responses/blog_response.dart';
import 'package:three_sixty_kids/data/models/responses/center_response.dart';
import 'package:three_sixty_kids/data/models/vos/blog_detail_model.dart';
import 'package:three_sixty_kids/data/models/vos/center_detail_model.dart';
import 'package:three_sixty_kids/data/models/vos/center_item_model.dart';
import 'package:three_sixty_kids/data/models/vos/class_detail_model.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  late String phone;
  final String appBaseUrl;
  //late SharedPreferences sharedPreferences;


  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
    //required this.sharedPreferences
  }){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = "";
    phone = "";

    //token = sharedPreferences.getString(AppConstants.TOKEN) ?? AppConstants.TOKEN;
   // phone =  sharedPreferences.getString(AppConstants.PHONE) ?? AppConstants.PHONE;
    _mainHeaders = {
      "Content-type" : "application/json; charset=UTF-8",
      "X-Customer-Token" : "$token",
      "X-Customer-Phone" : "$phone"
    };
  }

  void updateHeader(String token, String phone){
    print("update header phone "  + phone.toString());
    _mainHeaders = {
      "Content-type" : "application/json; charset=UTF-8",
      "X-Customer-Token" : "$token",
      "X-Customer-Phone" : "$phone",
    };

  }

  Future<Response> getData(String uri,
      {Map<String, String>? headers}
      ) async {
    try{
      Response  response = await get(uri,
          headers: headers ?? _mainHeaders
      );
      print("headears " + _mainHeaders.toString());

      return response;
    }catch(e){
      print("error " + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try{
      Response reponse = await post(uri, body, headers: _mainHeaders);
      return reponse;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<List<String>> loadDistanceJson() async {
    final String distanceJson = await rootBundle.loadString(
        'assets/distance.json');

    final Map<String, dynamic> distances = Map<String, dynamic>.from(
        json.decode(distanceJson));
    final List<String> distanceValues = distances.values.map((
        value) => '$value Km').toList();
    return distanceValues;
  }

  Future<CenterResponse> getSearchCenterList() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonResponse = json.decode(jsonString);

    // Convert the JSON data to ApiResponse object
    final apiResponse = CenterResponse.fromJson(jsonResponse);

    return apiResponse;
  }

  Future<BlogResponse> getBlogList() async {
    final String jsonString = await rootBundle.loadString('assets/blog.json');
    final jsonResponse = json.decode(jsonString);

    // Convert the JSON data to ApiResponse object
    final apiResponse = BlogResponse.fromJson(jsonResponse);

    return apiResponse;
  }

  Future<CenterDetail> getCenterDetail() async {
    final String jsonString = await rootBundle.loadString('assets/center_detail.json');
    final jsonResponse = json.decode(jsonString);

    // Convert the JSON data to ApiResponse object
    final apiResponse = CenterDetail.fromJson(jsonResponse);

    return apiResponse;
  }

 Future<BlogDetails> getBlogDetails(int id) async {
    final String jsonString = await rootBundle.loadString('assets/blog_detail.json');
    final jsonResponse = json.decode(jsonString);

    // Convert the JSON data to ApiResponse object
    final apiResponse = BlogDetails.fromJson(jsonResponse);

    return apiResponse;
  }

  Future<ClassDetails> getClassDetail() async {
    final String jsonString = await rootBundle.loadString('assets/class_detail.json');
    final jsonResponse = json.decode(jsonString);

    // Convert the JSON data to ApiResponse object
    final apiResponse = ClassDetails.fromJson(jsonResponse);

    return apiResponse;
  }

  Future<List<CenterItem>> searchCenterList() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonResponse = json.decode(jsonString);

    // Convert the JSON data to Dart objects
    final apiResponse = CenterResponse.fromJson(jsonResponse);

    return apiResponse.centerList;
  }


}

