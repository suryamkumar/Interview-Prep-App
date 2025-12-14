import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quiz_app/presentaion/auth/view/splash_page.dart';
import 'package:quiz_app/presentaion/history/model/attempt_model.dart';
import 'package:quiz_app/presentaion/home/view/home_page.dart';

import 'app.dart';
import 'core/di/init_dependencies.dart';
import 'core/notifiction/local_notification_service.dart';
import 'core/utils/constants/constants.dart';
import 'core/utils/helper/secure_storage_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initDependencies();
  final token = await SecureStorageHelper.read(LOGINKEY);

  await Hive.initFlutter();
  Hive.registerAdapter(AttemptModelAdapter());

  //TEMP (run once) if change in model saved by Hive rest the hive database when ever restart the app
  // await Hive.deleteBoxFromDisk('attemptsBox');
  await Hive.openBox<AttemptModel>('attemptsBox');

  //local notification
  await LocalNotificationService.init();
  // Trigger once when app opens and user login every time if you want only once trigger then use this function after successfully login
  if(token!=null) {
    await LocalNotificationService.scheduleDailyReminder();
  }

  Widget initialPage;

  if (token == null) {
    initialPage = const SplashPage();
  } else {
    initialPage = const HomePage();
  }
  runApp(MyApp(intialPage: initialPage));

}

