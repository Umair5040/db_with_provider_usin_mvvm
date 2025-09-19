import 'package:db_with_provider_usin_mvvm/models/gallery_model.dart';
import 'package:db_with_provider_usin_mvvm/screens/home%20page/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';

class HomeDataWidget extends StatelessWidget {
  const HomeDataWidget({super.key, required this.list});
  final List<GalleryModel> list;
  
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return HomeCardWidget(path: list[index].imgPath ?? '');
      },
    );
  }
}
