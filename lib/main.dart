import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/src/pages/home_page.dart';
import 'package:userapp/src/pages/loading_page.dart';
import 'package:userapp/src/pages/login_page.dart';
import 'package:userapp/src/pages/splash_page.dart';
import 'package:userapp/src/providers/usuario_provider.dart';
import 'package:userapp/src/theme/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final HttpLink httpLink =
      new HttpLink(uri: 'https://graphqlzero.almansi.me/api');

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client =
        new ValueNotifier<GraphQLClient>(
            GraphQLClient(cache: InMemoryCache(), link: httpLink));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
      ],
      child: GraphQLProvider(
          client: client,
          child: MaterialApp(
            title: 'UserApp',
            debugShowCheckedModeBanner: false,
            theme: temaGlobal(context),
            initialRoute: 'splash',
            routes: {
              'splash'  : (BuildContext context) => SplashPage(),
              'loading' : (BuildContext context) => LoadingPage(),
              'login'   : (BuildContext context) => LoginPage(),
              'home'    : (BuildContext context) => HomePage(),
            },
          ),
        ),
    );
  }
}
