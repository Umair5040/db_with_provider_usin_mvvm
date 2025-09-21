import 'package:db_with_provider_usin_mvvm/controllers/database_controller.dart';
import 'package:db_with_provider_usin_mvvm/controllers/loaction_controller.dart';
import 'package:db_with_provider_usin_mvvm/controllers/pick_img_controller.dart';
import 'package:db_with_provider_usin_mvvm/repository/database_repository.dart';
import 'package:db_with_provider_usin_mvvm/routes/routers.dart';
import 'package:db_with_provider_usin_mvvm/screens/intro%20page/intro_page.dart';
import 'package:db_with_provider_usin_mvvm/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey=GlobalKey<ScaffoldMessengerState>();
void main()async{
  
WidgetsFlutterBinding.ensureInitialized();

// await LocationService.getCurrentLocation();
LocationController locationController= LocationController();
await locationController.getLocation();

  runApp(MultiProvider(
    providers: [
      Provider<Widget>(create: (context) => Text('Gallery DUR', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
      Provider<DatabaseService>(create: (context) => DatabaseService(),),
      Provider<DatabaseRepository>(create: (context) => DatabaseRepository(databaseService: context.read<DatabaseService>())),
      ChangeNotifierProvider(create: (context) => DatabaseController(databaseRepository: context.read<DatabaseRepository>()),),
      Provider<ImagePicker>(create: (context) => ImagePicker(),),
      ChangeNotifierProvider(create: (context) => PickImgController(imagePicker: context.read<ImagePicker>(), databaseRepository: context.read<DatabaseRepository>()),),
      ChangeNotifierProvider(create: (context) => locationController,)
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialRoute: IntroPage.pageName,
      debugShowCheckedModeBanner: false,
onGenerateRoute: onGenerateRoute,
    );
  }
}