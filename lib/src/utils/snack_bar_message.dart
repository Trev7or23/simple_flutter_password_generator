import 'package:flutter/material.dart';

void snackBarMessage(BuildContext context, String message){
	final snack = SnackBar(
		content: Text(message, style: const TextStyle(fontSize: 15.0)),
		elevation: 6.0,
		backgroundColor: Colors.redAccent,
		behavior: SnackBarBehavior.floating,
		duration: const Duration(seconds: 2),
	);

	ScaffoldMessenger.of(context).showSnackBar(snack);
}