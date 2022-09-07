import 'package:flutter/material.dart';

class Buttom extends StatefulWidget {
  final String text;
  final IconData icon;
  final Function onclick;
  Buttom({Key? key, required this.text, required this.icon, required this.onclick}) : super(key: key);

  @override
  _ButtomState createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  BorderRadius borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: widget.onclick(),
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 60.0, //MediaQuery.of(context).size.width * .08,
            width: 220.0, //MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: borderRadius,
                    ),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                    ),
                  );
                }),
                Expanded(
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
