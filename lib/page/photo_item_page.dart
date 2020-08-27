import 'package:flutter/material.dart';
import 'package:get_photo_fl/api/API.dart';

class PhotoItemPage extends StatelessWidget {

  final List<DocBody> dataList;
  final num index;

  PhotoItemPage({this.dataList, this.index});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: index == 0
              ? NetworkImage(dataList[0].sponsorship.sponsor.profileImage.large)
              : NetworkImage(dataList[index].user.profileImage.large),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 1),
      ),
    ));
  }
}
