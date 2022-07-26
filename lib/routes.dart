
import 'package:flutter/cupertino.dart';
import 'package:vim/screens/colectInfo.dart';
import 'package:vim/screens/report.dart';

final Map<String, WidgetBuilder> routes = {
  ColectInfoScreen.routeName: (context) =>  ColectInfoScreen(),
  ReportScreen.routeName: (context) =>  ReportScreen()
};
