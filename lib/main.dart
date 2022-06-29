import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const App());
}