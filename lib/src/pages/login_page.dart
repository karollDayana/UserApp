import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/src/providers/usuario_provider.dart';
import 'package:userapp/src/utils/alerta.dart';
import 'package:userapp/src/utils/querys.dart';
import 'package:userapp/src/widgets/boton.dart';
import 'package:userapp/src/widgets/formField.dart';

FocusNode nodoEmail = FocusNode();
FocusNode nodoPass = FocusNode();
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Query(
      options: QueryOptions(documentNode: gql(Consulta.userLogin)),
      builder: (QueryResult result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.loading) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
        print('ejecuta');

      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Fondo(result.data['user']['username'], result.data['user']['phone']),
              Positioned(
                  top: size.height * 0.1325,
                  left: size.width * 0.15,
                  child: Image(image: AssetImage('assets/images/download.png'))),
            ],
          ),
        ),
      );
    
  });
}
}

class Fondo extends StatefulWidget {

  final String username;
  final String password;

  const Fondo(this.username, this.password);

  @override
  _FondoState createState() => _FondoState();
}

class _FondoState extends State<Fondo> {
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() { 
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();      
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final usuarioProvider = Provider.of<UsuarioProvider>(context); 
    usuarioProvider.usuario.username = this.widget.username;
    usuarioProvider.usuario.password = this.widget.password;

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
          Formulario(emailController: emailController, passwordController: passwordController,),
          WidgetBoton(
            marginTop: size.height * 0.0517,
            anchoTexto: size.width * 0.2187,
            color: Theme.of(context).primaryColor,
            texto: 'SIGN IN',
            funcion: () { 
              print(emailController.text +' -------------'+ passwordController.text);

              if(emailController.text == usuarioProvider.usuario.username && passwordController.text == usuarioProvider.usuario.password){
                    Navigator.pushReplacementNamed(context, 'home');
                  }else{
                    return mostrarAlerta(context, 'Error de Login', 'Credenciales invalidas, por favor intentelo nuevamente.');
                  }
              //usuarioProvider.isLogin = true;
            }
              //Navigator.pushNamed(context, 'home');
          ),
          Registro()
        ],
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const Formulario({@required this.emailController, @required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;    

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
              textController: emailController,
            ),
            WidgetFormField(
              icono: Icons.lock,
              tipoCampo: TextInputType.text,
              hintText: 'Password',
              tipoCampoPass: true,
              nodo: nodoPass,
              textController: passwordController,
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
