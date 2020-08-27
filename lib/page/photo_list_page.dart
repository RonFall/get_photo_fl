import 'package:flutter/material.dart';
import 'package:get_photo_fl/api/API.dart';
import 'package:get_photo_fl/widget/photo_item_widget.dart';
import 'package:http/http.dart' as http;

class PhotoListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blueAccent[100],
              Colors.blue[700],
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                "Photos",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 42,
                    fontStyle: FontStyle.italic
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 110,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                child: FutureBuilder<List<DocBody>>(
                  future: fetchData(http.Client()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? PhotoItem(dataList: snapshot.data)
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

