import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

/// Global service locator.
///
/// This is the service locator for the entire application.
/// Retrieves or creates the instance of a registered type [T] depending on the registration strategy.
///
/// To access the registered service:
///  ```dart
///   // Returns an instance
///   locator.get<T>();
///
///   // Returns a async instance
///   locator.getAsync<T>();
/// ```
/// See [GetIt] and [Injectable] for more information.
final locator = GetIt.instance;

/// Initializes the service locator.
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)

/// Configures the service locator.
Future<void> configureDependencies() => locator.init();
