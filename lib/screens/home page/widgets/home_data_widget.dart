import 'dart:developer';
import 'package:db_with_provider_usin_mvvm/controllers/database_controller.dart';
import 'package:db_with_provider_usin_mvvm/models/gallery_model.dart';
import 'package:db_with_provider_usin_mvvm/screens/home%20page/widgets/home_card_widget.dart';
import 'package:db_with_provider_usin_mvvm/utils/custom_snack_bar.dart';
import 'package:db_with_provider_usin_mvvm/utils/dialogs/loading_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDataWidget extends StatefulWidget {
  const HomeDataWidget({super.key, required this.list, });
  final List<GalleryModel> list;

  @override
  State<HomeDataWidget> createState() => _HomeDataWidgetState();
}

class _HomeDataWidgetState extends State<HomeDataWidget> {

ScaffoldMessengerState? scaffoldMessengerState;
NavigatorState? navigatorState;

@override
  void initState() {
    super.initState();
    log('Init called');
  
  }

@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('did dependency called');
    scaffoldMessengerState= ScaffoldMessenger.of(context);
    navigatorState=Navigator.of(context);
    
  }

@override
  void dispose() {
    log('dispose called');
    // scaffoldMessengerState?.clearSnackBars();
    super.dispose();
  }

  @override
  Widget build(BuildContext contextX) {
    log('BUILD CALLED');
    return SliverGrid.builder(
      itemCount: widget.list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () async{
            loadingDialogBox(context, 'Deleting...');
           var isDeleted= await contextX.read<DatabaseController>().deleteImage(widget.list[index]);
           navigatorState?.pop();
           if (isDeleted) {
            
            snackbarState(scaffoldMessengerState!, 'Item added successfuly');

           }else{

            snackbar(context, 'Failed to add');
           }
          },
          child: HomeCardWidget(path: widget.list[index].imgPath ?? ''));
      },
    );
  }
}
