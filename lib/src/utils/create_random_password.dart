import 'dart:math';

import 'package:password_generator/src/utils/variables.dart';

const lowercase = "abcdefghijklmnopqrstuvwxyz";
const uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const numbers = "0123456789";
const specials = '!@#\$%&*?+=_-/][{}';

String createRandomPassword() {
	String chars = lowercase;
	if (isMayusculas) chars+=uppercase;
	chars+= numbers;
	if (isSpecialCharacters) chars+=specials;

	String _temporalPassword = '';

	for (int i=0; i<size; i++) {
		_temporalPassword+= chars[Random().nextInt(chars.length)];
	}
	return _temporalPassword;
}