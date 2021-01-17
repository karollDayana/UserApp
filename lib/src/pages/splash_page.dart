
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:userapp/src/widgets/boton.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver{
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    if(state == AppLifecycleState.resumed) {
      if(await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, 'loading');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Titulo(),
              Texto(),
              WidgetBoton(
                marginTop: size.height * 0.0271,
                color: Color.fromRGBO(26, 26, 26, 1),
                texto: 'IR A LOGIN',
                anchoTexto: size.width * 0.3147,
                funcion: () async{
                  final status = await Permission.location.request();

                  this.accesoGps( status );
                },
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
        ]
      )
    );
  }

  void accesoGps(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'login');
        break;
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
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
        right: size.width * 0.0533
      ),
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
