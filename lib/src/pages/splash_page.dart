import 'package:flutter/material.dart';
import 'package:userapp/src/widgets/boton.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(children: [
          Column(
            children: [
              Titulo(),
              Texto(),
              WidgetBoton(
                marginTop: size.height * 0.0271,
                color: Color.fromRGBO(26, 26, 26, 1),
                texto: 'IR A LOGIN',
                anchoTexto: size.width * 0.3147,
                funcion: () => Navigator.pushNamed(context, 'login'),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.475,
            right: size.width * 0.0,
            child: Image(
              image: AssetImage('assets/images/download@3x.png'),
              fit: BoxFit.cover,
              width: size.width,
              height: size.height * 1,
            ),
          )
        ]));
  }
}

class Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.472,
      height: size.height * 0.0530,
      margin: EdgeInsets.only(
        top: size.height * 0.1946,
        left: size.width * 0.2987,
        right: size.width * 0.2293,
      ),
      child: Text(
        'userapp'.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 35,
          color: Color.fromRGBO(255, 255, 255, 1),
          letterSpacing: 0,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class Texto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8053,
      height: size.height * 0.1022,
      margin: EdgeInsets.only(
          top: size.height * 0.0344,
          left: size.width * 0.1413,
          right: size.width * 0.0533),
      child: Text(
        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color.fromRGBO(0, 0, 0, 1),
          letterSpacing: 0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
