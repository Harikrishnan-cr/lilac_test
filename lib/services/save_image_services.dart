

import 'dart:typed_data';
import 'package:dio/dio.dart';


Future<Uint8List> saveImageToHive(String imageUrl) async { 
 Dio dio = Dio();
  var response = await dio.get(imageUrl, options: Options(responseType: ResponseType.bytes));
   return response.data; 

}

