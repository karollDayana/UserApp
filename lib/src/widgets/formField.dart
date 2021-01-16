import 'package:flutter/material.dart';

class WidgetFormField extends StatelessWidget {
  final IconData icono;
  final TextInputType tipoCampo;
  final String hintText;
  final bool tipoCampoPass;
  final FocusNode nodo;
  final FocusNode nodo2;
  final TextEditingController textController;

  const WidgetFormField(
      {@required this.icono,
      @required this.tipoCampo,
      @required this.hintText,
      @required this.tipoCampoPass,
      @required this.nodo,
      this.nodo2, @required this.textController,});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icono,
          color: Theme.of(context).primaryColor,
        ),
        Container(
          width: size.width * 0.6373,
          height: size.height * 0.0351,
          child: TextFormField(
            controller: textController,
            focusNode: nodo,
            onEditingComplete: (!tipoCampoPass)
                ? () {
                    FocusScope.of(context).requestFocus(nodo2);
                  }
                : null,
            cursorColor: Color.fromRGBO(52, 76, 105, 1),
            keyboardType: tipoCampo,
            obscureText: tipoCampoPass,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(52, 76, 105, 1))),
            ),
          ),
        ),
      ],
    );
  }
}
