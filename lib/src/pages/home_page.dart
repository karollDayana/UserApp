import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:userapp/src/utils/querys.dart';
import 'package:userapp/src/widgets/tarjetas.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            Menu(),
            Container(
              width: size.width * 0.3093,
              height: size.height * 0.0271,
              margin: EdgeInsets.only(
                top: size.height * 0.0419, 
                right: size.width * 0.6267
              ),
              child: Text(
                'CONTACTOS',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox( height: size.height * 0.0099),
            Expanded(
              child: Center(
                child: Query(
                  options: QueryOptions(documentNode: gql(Consulta.getUser)),
                  builder: (QueryResult result, {fetchMore, refetch}) {
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }

                    if (result.loading) {
                      return CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Theme.of(context).primaryColor,
                      );
                    }

                    List usuarios = result.data['users']['data'];

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: usuarios.length,
                      itemBuilder: (context, index) {
                        List<Widget> itemMap = usuarios
                          .map((item) => WidgetTarjeta(
                            funcion: () {},
                            url: item['albums']['data'][0]['photos']['data'][0]['url'],
                            nombre: item['name'],
                            correo: item['email']
                          )).toList();
                        return itemMap[index];
                      },
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.0899,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 1),
            blurRadius: 12
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * 0.2933,
            height: size.height * 0.0443,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage('assets/images/001-home@2x.png'),
                  width: size.width * 0.0633,
                  height: size.height * 0.0278,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color.fromRGBO(26, 26, 26, 1)
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          Image(
            image: AssetImage('assets/images/002-speech-bubble@2x.png'),
            width: size.width * 0.0676,
            height: size.height * 0.02805,
            fit: BoxFit.cover,
          ),
          Image(
            image: AssetImage('assets/images/003-heart@2x.png'),
            width: size.width * 0.056,
            height: size.height * 0.023,
            fit: BoxFit.cover,
          ),
          Image(
            image: AssetImage('assets/images/004-user@2x.png'),
            width: size.width * 0.0522,
            height: size.height * 0.0241,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
