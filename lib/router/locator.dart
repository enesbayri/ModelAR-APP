
import 'package:modelar/database/db.dart';
import 'package:modelar/services/model_data_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void getitSetup(){
  locator.registerLazySingleton(() => DataModel(),);
  locator.registerLazySingleton(() => LocalDB(),);
}