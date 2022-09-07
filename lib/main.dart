import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vim/providers/vim_provider.dart';
import 'package:vim/screens/colectInfo.dart';
import 'package:vim/routes.dart';
import 'package:vim/services/vim_service.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => VimProvider(VimService())),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIM Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'VIM Reader'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.car_rental,
            //   color: Colors.green.withOpacity(.5),
            //   size: 205,
            // ),
            Image.asset('assets/car.png'),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            // Text("Welcome, lets get all information from your car.",style: TextStyle(),),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(
                      context, ColectInfoScreen.routeName, (route) => false);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Start Reading",style: TextStyle(color: Colors.green,fontSize: 28),),
                ),
              ),
            )
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamedAndRemoveUntil(
            //           context, ColectInfoScreen.routeName, (route) => false);
            //     },
            //     child: Text("Start Reading"))
          ],
        ),
      ),
    );
  }
}
