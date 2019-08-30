# dart-jwt-example
An example project demonstrating how to implement basic JWT authentication in Dart

![](preview.gif)

## Getting Started
To run this project:
* Make sure you have Dart installed, available [here](https://dart.dev)
* Clone this repo
* `cd` into the project directory
* run `pub get` to install packages

## Testing
* start the server with `$ dart bin/server.dart`
* try an API call with `$ curl localhost:3000/hello` (should be rejected)
* authenticate with `$ curl localhost:3000/auth -d '{"username":"test", "password":"insecure"}'` (should return a JWT, copy this)
* retry API call with `$ curl localhost:3000/hello -H "Authorization: Bearer YOUR_TOKEN"` (should return OK)

## Contributions
Suggestions, ideas, comments, and pull requests are welcome. Thanks!