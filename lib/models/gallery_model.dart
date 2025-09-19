class GalleryModel {
  
final String? imgPath;
final String? imgName;
final int? id;
final String? dateTime;

const GalleryModel({this.dateTime, this.id, this.imgName, this.imgPath});

static const String tabelName= 'gallery_table';
static const String columnImgName= 'img_name';
static const String columnImgPath= 'img_path';
static const String columnImgID= 'img_id';
static const String columnImgDateTime= 'img_datetime';

static const String createTable= '''CREATE TABLE IF NOT EXISTS $tabelName($columnImgID INTEGER PRIMARY KEY AUTOINCREMENT, $columnImgName TEXT, $columnImgPath TEXT, $columnImgDateTime TEXT)''';


factory GalleryModel.fromDatabase(Map<String, dynamic> map){
  return GalleryModel(
    dateTime: map[columnImgDateTime]??'',
    id: map[columnImgID]??'',
    imgName: map[columnImgName]??'',
    imgPath: map[columnImgPath]??''
  );
}


Map<String, dynamic> toDatabase(){

return {
columnImgDateTime: dateTime??'',
columnImgName: imgName??'',
columnImgPath: imgPath??''
};

}


}