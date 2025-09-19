import 'package:db_with_provider_usin_mvvm/models/gallery_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  
static  DatabaseService? databaseService;

DatabaseService._();

factory DatabaseService(){
  databaseService??=DatabaseService._();
  return databaseService!;
}


Future<Database> get database async{
var path = await getDatabasesPath();

var myDatabase=await openDatabase(join(path,'gallery_dur.db'), onCreate: (db, version)async {
  return await db.execute(GalleryModel.createTable);
},
version: 1
);
  return myDatabase;
}



Future<List<GalleryModel>> getImages()async{

var db=await database;

List<Map<String, Object?>> data= await db.query(GalleryModel.tabelName);
return data.map((e) => GalleryModel.fromDatabase(e),).toList();
}


Future<bool> insertImage(GalleryModel galleryModel)async{
var db=await database;
var isEffected= await db.insert(GalleryModel.tabelName, galleryModel.toDatabase());
return isEffected>0;
}

Future<bool> deleteImage(GalleryModel galleryModel)async{
var db=await database;
var isEffected= await db.delete(GalleryModel.tabelName,where:'${GalleryModel.columnImgID}=?', whereArgs: [galleryModel.id] );
return isEffected>0; 
}


Future<bool> updateImage(GalleryModel galleryModel)async{
var db=await database;
var isEffected= await db.update(GalleryModel.tabelName,galleryModel.toDatabase(),where:'${GalleryModel.columnImgID}=?', whereArgs: [galleryModel.id],);
return isEffected>0; 
}

}