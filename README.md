## dart-jwt-example
An example project demonstrating how to implement basic JWT authentication in Dart

![](preview.gif)

___
### Getting Started
* Install Dart, available [here](https://dart.dev)
* Clone this repository
* `cd` into the project directory
* run `pub get` to install packages

___
### Testing
* start the server with `$ dart bin/server.dart`
* try an API call with `$ curl localhost:3000/hello` (should be rejected)
* authenticate with `$ curl localhost:3000/auth -d '{"username":"test", "password":"insecure"}'` (should return a JWT, copy this)
* retry API call with `$ curl localhost:3000/hello -H "Authorization: Bearer YOUR_TOKEN"` (should return OK)

___
### Docs
For more information, see [this tutorial](https://itnext.io/authentication-with-jwt-in-dart-6fbc70130806).

___
### Contributions
Suggestions, ideas, comments, and pull requests are welcome. Thanks!
