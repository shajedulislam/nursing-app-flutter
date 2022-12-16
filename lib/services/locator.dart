import 'package:nursingapp/utilities/global_objects.dart';

import 'navigation.dart';
import 'shared_preference.dart';

Future<void> registerSingleton() async {
  localtor.registerLazySingleton(() => NavigationService());
  localtor.registerLazySingleton(() => SharedPreferenceServices());
}

Future<void> createInitalIntances() async {
  await localtor<SharedPreferenceServices>().create();
}
