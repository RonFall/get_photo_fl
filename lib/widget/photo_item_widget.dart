import 'package:flutter/material.dart';
import 'package:get_photo_fl/api/API.dart';
import 'package:get_photo_fl/page/photo_item_page.dart';

class PhotoItem extends StatelessWidget {
  final List<DocBody> dataList;

  PhotoItem({this.dataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) => Container(
        margin: index == 0 ? null : const EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PhotoItemPage(dataList: dataList, index: index),
                ));
              },
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: index == 0
                        ? NetworkImage(dataList[0].sponsorship.sponsor.profileImage.large)
                        : NetworkImage(dataList[index].user.profileImage.large),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1),
                ),
              ),
            ),
            Text(
              "${index == 0 ? dataList[0].sponsorship.sponsor.username : dataList[index].user.username}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
