import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/src/utils/snack_bar_message.dart';

import 'package:password_generator/src/utils/variables.dart';
import 'package:password_generator/src/utils/create_random_password.dart';


class PasswordGeneratorPage extends StatefulWidget {

	@override
	createState() => PasswordGeneratorPageState();
}

class PasswordGeneratorPageState extends State {
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Center(child: Text('Password Generator'))),
			body: Container(
				padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
				child: Column(
					children: <Widget>[
						createNumField(),
						const Divider(),
						createCheckRow('Mayúsculas'),
						createCheckRow('Caracteres especiales'),
						const Divider(),
						showPassword(),
						SizedBox(height: 15.0),
						createPasswordButton('Crear'),
					],
				),
			)
		);
	}

  Widget showPassword() {
  	return TextField(
  		readOnly: true,
  		controller: _passwordController,
  		decoration: InputDecoration(
  			hintText: 'aqui se almacena la contraseña',
  			suffixIcon: TextButton(child: const Icon(Icons.copy), onPressed: ()=> setState((){
  				Clipboard.setData(ClipboardData(text: password));
  				snackBarMessage(context, 'Se ha copiado la Contraseña al portapapeles');
  			})),

  		),
  	);
  }

	Widget createCheckRow(String dato) {

		late Widget checkbox;

		switch(dato) {
			case 'Mayúsculas':
				checkbox = Checkbox(value: isMayusculas, onChanged: (value)=> setState(()=> isMayusculas = value ?? false));
				break;
			case 'Caracteres especiales':
				checkbox = Checkbox(value: isSpecialCharacters, onChanged: (value)=> setState(()=> isSpecialCharacters = value ?? false));
				break;
		}
		return Row(children: <Widget>[
			checkbox,
			Text('Incluir $dato', style: const TextStyle(fontSize: 20.0)),
		],
		);
	}

	Widget createNumField() {
		return TextField(
			autofocus: true,
			keyboardType: TextInputType.number,
			decoration: InputDecoration(
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
				labelText: 'Tamaño de contraseña',
				hintText: 'Escribe el tamaño de la contraseña',
				helperText: 'Por defecto son 4 digitos',
				suffixIcon: const Icon(Icons.lock)
			),
			inputFormatters: [FilteringTextInputFormatter.digitsOnly],
			onChanged: (String numeros)=> setState(() {
				if (numeros != '') size = int.parse(numeros);
			}),
		);
	}

	Widget createPasswordButton(String name) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				TextButton(
					style: TextButton.styleFrom(
						backgroundColor: Colors.redAccent,
						foregroundColor: Colors.white,
						elevation: 10.0,
						shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
					),
					onPressed: ()=> setState((){
						password = createRandomPassword();
						_passwordController.text = password;
					}),
					child: Text(name, style: const TextStyle(fontSize: 30.0)),
				)
			],
		);
	}
// =>
}