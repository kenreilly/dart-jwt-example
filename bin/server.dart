import 'dart:io';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:dart_jwt_example/auth-provider.dart';
import 'package:dart_jwt_example/config.dart';

abstract class Server {

	static bool debug;

	static Response _echo(Request request) =>
		Response.ok('Authorization OK for "${request.url}"');

	static Future<void> start(List<String> args) async {

		await Config.init();

		ArgParser parser = ArgParser()..addOption('debug', abbr: 'd', defaultsTo: 'false');
		ArgResults result = parser.parse(args);

		debug = (result['debug'] == 'true');
		if (debug) { stdout.writeln('Debug output is enabled'); }
		
		Middleware auth = createMiddleware(requestHandler: AuthProvider.handle);
		Handler handler = const Pipeline()
			.addMiddleware(logRequests())
			.addMiddleware(auth)
			.addHandler(_echo);

		HttpServer server = await io.serve(handler, 'localhost', Config.port);
		print('Serving at http://${server.address.host}:${server.port}');
	}
}

main(List<String> args) async => Server.start(args);