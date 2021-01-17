import 'package:flutter/material.dart';

class WidgetBoton extends StatelessWidget {
  final double marginTop;
  final Color color;
  final String texto;
  final double anchoTexto;
  final Function funcion;

  const WidgetBoton({
    @required this.marginTop,
    @required this.color,
    @required this.texto,
    @required this.anchoTexto,
    @required this.funcion
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8293,
      height: size.height * 0.0603,
      margin: EdgeInsets.only(top: marginTop),
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          width: anchoTexto,
          height: size.height * 0.0271,
          child: Text(
            texto,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromRGBO(255, 255, 255, 1),
              letterSpacing: 1.8
            ),
            textAlign: TextAlign.left,
          ),
        ),
        onPressed: funcion
      ),
    );
  }
}
