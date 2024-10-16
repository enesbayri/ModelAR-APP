



import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modelar/views/detailpage/detail_page.dart';
import 'package:modelar/views/menupage/menu_page.dart';
import 'package:modelar/views/modelspage/models_page.dart';

class PageRouter {
  static Route<dynamic>? onGenerateRoute (RouteSettings settings) {
    if(settings.name == "HomePage"){
      if(defaultTargetPlatform == TargetPlatform.android){
      return MaterialPageRoute(builder: (context) => const MenuPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => const MenuPage(),);
      }
    }else if(settings.name == "ModelsPage"){
      if(defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) =>  ModelsPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) =>  ModelsPage(),);
      }
    }else if(settings.name == "DetailPage"){
      if(defaultTargetPlatform == TargetPlatform.android){
        return MaterialPageRoute(builder: (context) => DetailPage(),);
      }else{
        return CupertinoPageRoute(builder: (context) => DetailPage(),);
      }
    }
    return null;
  }
}