import 'dart:io';
import 'package:dotenv/dotenv.dart' as dotenv;

abstract class Config {

	static Map<String, dynamic> get _env => dotenv.env ?? {};

	static int get port => int.tryParse(_env['PORT']) ?? 3000;

	static String get secret => _env['JWT_AUTH_SECRET'] ?? '';

	static init() async {

		String filename = (await File.fromUri(Uri.parse('.env')).exists()) ? '.env' : '.env.example';
		return dotenv.load(filename);
	}
}