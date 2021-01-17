import 'package:flutter/material.dart';
import 'package:userapp/src/pages/login_page.dart';
import 'package:userapp/src/utils/utils.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Theme.of(context).primaryColor,),
          );
        },
      ),
    );
  }

  Future checkGpsYLocation(BuildContext context) async{

    await Future.delayed(Duration(milliseconds: 1000));

    Navigator.pushReplacement(context, navegarLoginFadeIn(context, LoginPage()));

  }
}