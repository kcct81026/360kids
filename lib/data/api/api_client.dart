import 'package:get/get.dart';

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


}

