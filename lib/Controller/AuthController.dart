import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthController with ChangeNotifier{
   String _urlMain = "http://192.168.50.245:3000/api/";
   bool isAuth = false;
   
   void Register(String fname, String lname,String email, String password, String position) async{
     try{
       final urlRegis = Uri.parse(_urlMain + "/user/register");
       final respone = await http.post(urlRegis , headers: {"Content-Type": "application/json"},
       body: jsonEncode({
        'fname':fname,
        'lname':lname,
        'email': email,
        'password': password,
        'position': 1
       }));
       if(respone.statusCode == 201){
        throw "ບໍ່ໄດ້ປ້ອນລະຫັດຜ່ານ";
       }
     }catch(error){
       throw error;
     }
   }

   void SignUp(String email, String password) async{
     try{
      print("error: " + password);
      final urlSign = Uri.parse(_urlMain + "user/login");
      final response = await http.post(urlSign, headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email':email,
        'password': password
      }));
      if(response.body != null){
         isAuth = true;
      }else{
         isAuth = false;
      }
      notifyListeners();
     }catch(error){
       throw error;
     }
   }
}