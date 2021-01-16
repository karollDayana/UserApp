import 'package:flutter/material.dart';
import 'package:userapp/src/widgets/boton.dart';
import 'package:userapp/src/widgets/formField.dart';

FocusNode nodoEmail = FocusNode();
FocusNode nodoPass = FocusNode();
final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Fondo(),
            Positioned(
                top: size.height * 0.1325,
                left: size.width * 0.15,
                child: Image(image: AssetImage('assets/images/download.png'))),
          ],
        ),
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.5),
      width: size.width,
      height: size.height * 0.5123,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, 1),
                blurRadius: 12)
          ]),
      child: Column(
        children: [
          Formulario(),
          WidgetBoton(
            marginTop: size.height * 0.0517,
            anchoTexto: size.width * 0.2187,
            color: Theme.of(context).primaryColor,
            texto: 'SIGN IN',
            funcion: () { 
              Navigator.pushNamed(context, 'home');
              /*Query(
                options: QueryOptions(documentNode: gql(Consulta.userLogin)),
                builder: (QueryResult result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.loading) {
                    return CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    );
                  }

                  final String username = result.data['username'];
                  final String password = result.data['phone'];

                  //if(username == )
                });*/
            },
          ),
          Registro()
        ],
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    return Form(
      key: _formKey,
      child: Container(
        width: size.width * 0.7653,
        height: size.height * 0.125,
        margin: EdgeInsets.only(top: size.height * 0.1088),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetFormField(
              hintText: 'Username',
              icono: Icons.person,
              tipoCampo: TextInputType.emailAddress,
              tipoCampoPass: false,
              nodo: nodoEmail,
              nodo2: nodoPass, 
              textController: emailcontroller,
            ),
            WidgetFormField(
              icono: Icons.lock,
              tipoCampo: TextInputType.number,
              hintText: 'Password',
              tipoCampoPass: true,
              nodo: nodoPass,
              textController: passwordcontroller,
            )
          ],
        ),
      ),
    );
  }
}

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.632,
      height: size.height * 0.0222,
      margin: EdgeInsets.only(
        top: size.height * 0.0628,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 0, 0, 0.4)),
            textAlign: TextAlign.left,
          ),
          Text(
            'SIGN UP',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
