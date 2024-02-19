//? FutureEither takes 2 data types that is not dynamic and any other datatype like string with the use of fpdart package

import 'package:fpdart/fpdart.dart';
import 'package:superpro/core/core.dart';

typedef FutureEither<T> = Future<Either<ErrorResponse, T>>;
typedef FutureEitherVoid = FutureEither<void>; //? return void
typedef FutureVoid = Future<void>;

typedef MapString = Map<String, dynamic>;
typedef MapType<T> = Map<String, T>;
typedef ListOfString = List<String>;
typedef ListOfBool = List<bool>;
