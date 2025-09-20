import 'package:db_with_provider_usin_mvvm/controllers/database_controller.dart';
import 'package:db_with_provider_usin_mvvm/controllers/pick_img_controller.dart';
import 'package:db_with_provider_usin_mvvm/screens/home%20page/widgets/home_data_widget.dart';
import 'package:db_with_provider_usin_mvvm/utils/custom_snack_bar.dart';
import 'package:db_with_provider_usin_mvvm/utils/dialogs/loading_dialog_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const pageName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

void getData()async{
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      loadingDialogBox(context, 'loading...');
      
       await  context.read<DatabaseController>().getImages();
      
      Navigator.pop(context);
    });
}

  @override
  Widget build(BuildContext context) {
    print('Home page build called');
    return Material(
      child: HawkFabMenu(
        blur: 0.5,
        backgroundColor: Colors.black.withAlpha(100),
        fabColor: Colors.red,
        iconColor: Colors.white,
        items: hawkFabMenuItems(context),
        body: Scaffold(
          body: Center(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(toolbarHeight: 5),
                Consumer<PickImgController>(
                  builder: (context, value, _) {

if (value.isLoading) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    snackbar(context, 'Updated successfully');
  },);
}

                    return Consumer<DatabaseController>(

                      builder: (context, value, _) {

//                         if (value.showDialog=='loading') {
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
   
//       loadingDialogBox(context, 'Data loading...');
    
    
//   },);
 
// }
// if (value.showDialog=='loaded') {
//        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//    Navigator.pop(context);
//   },);
//     }
                        var isError = value.isError;
                        var isLoading = value.isLoading;
                        var error = value.error;
                        var list = value.galleryModelList;
                    
                    
                    
                        if (isLoading) {
                          return SliverFillRemaining(
                            child: CupertinoActivityIndicator(),
                          );
                        } else if (isError) {
                          return SliverFillRemaining(child: Text(error));
                        } else {
                          return HomeDataWidget(list: list);
                        }
                      },
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<HawkFabMenuItem> hawkFabMenuItems(BuildContext context) {
  return [
    HawkFabMenuItem(
      label: 'Gallery',
      ontap: () async {
        await context.read<PickImgController>().pickImage(ImageSource.gallery);
        await context.read<DatabaseController>().getImages();
      },
      color: Colors.red,
      icon: const Icon(CupertinoIcons.photo, color: Colors.white),
    ),

    HawkFabMenuItem(
      label: 'Camera',
      ontap: () async {
        context.read<PickImgController>().pickImage(ImageSource.camera);
        await context.read<DatabaseController>().getImages();
      },
      color: Colors.red,
      icon: const Icon(CupertinoIcons.camera, color: Colors.white),
    ),
  ];
}
