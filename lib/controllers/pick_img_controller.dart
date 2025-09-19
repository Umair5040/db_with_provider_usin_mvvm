import 'dart:developer';

import 'package:db_with_provider_usin_mvvm/models/gallery_model.dart';
import 'package:db_with_provider_usin_mvvm/repository/database_repository.dart';
import 'package:db_with_provider_usin_mvvm/utils/custom_snack_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class PickImgController extends ChangeNotifier{
  
final ImagePicker imagePicker;
final DatabaseRepository databaseRepository;
PickImgController({required this.imagePicker, required this.databaseRepository});

bool isLoading=false;
bool isError=false;
String error='';
String imgPath='';
String name='';

Future<void> pickImage(ImageSource imageSource)async{
try {
var result= await imagePicker.pickImage(source: imageSource);
if (result!=null) {
imgPath=result.path;
name= result.name;
log(name);
log(imgPath);

await databaseRepository.insertImage(GalleryModel(dateTime: DateTime.now().toString(), imgName: name, imgPath: imgPath));
isLoading=true;
notifyListeners();
}
} catch (e) {
 error=e.toString();
 isError=true;
 notifyListeners();
}
}


}