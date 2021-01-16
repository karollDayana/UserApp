import 'package:flutter/material.dart';

class WidgetTarjeta extends StatelessWidget {
  final Function funcion;
  final String url;
  final String nombre;
  final String correo;

  const WidgetTarjeta(
      {@required this.funcion,
      @required this.url,
      @required this.nombre,
      @required this.correo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: funcion,
      child: Container(
        width: size.width * 0.8587,
        height: size.height * 0.0727,
        margin: EdgeInsets.only(
            top: size.height * 0.0222,
            left: size.width * 0.064,
            right: size.width * 0.0773),
        decoration: BoxDecoration(
            color: Color.fromRGBO(254, 221, 124, 0.31),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 3),
                  blurRadius: 6)
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                image: NetworkImage(url),
                width: size.width * 0.1733,
                height: size.height * 0.0727,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: size.height * 0.0283,
              margin: EdgeInsets.only(left: size.width * 0.056),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color.fromRGBO(26, 26, 26, 1),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    correo,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                      color: Color.fromRGBO(26, 26, 26, 1),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).primaryColor,
              size: size.height * 0.045,
            )
          ],
        ),
      ),
    );
  }
}
