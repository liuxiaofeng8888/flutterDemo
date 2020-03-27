import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///使用框架调用相机
class TakePhotoWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TakePhotoState2();
  }
}

class TakePhotoState2 extends State {
  File _image;
  File _image2;

  Future getImage(ImageSource imageSource, int type) async {
    var image = await ImagePicker.pickImage(source: imageSource);
    setState(() {
      if (type == 0) {
        _image = image;
      } else {
        _image2 = image;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拍照相册"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(
                        _image,
                        fit: BoxFit.cover,
                      ),
              ),
              onTap: () {
                //点击选取图片
                // getImage(0);
                _showSelectDialog(context, 0);
              },
            ),
            GestureDetector(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                child: _image2 == null
                    ? Text('No image selected.')
                    : Image.file(_image2, fit: BoxFit.cover),
              ),
              onTap: () {
                _showSelectDialog(context, 1);
                // getImage(1);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSelectDialog(BuildContext context, int type) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            color: Colors.grey,
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: _itemCreat(context, '相机'),
                  onTap: () {
                    print('选中相机');
                    Navigator.pop(context);
                    getImage(ImageSource.camera, type);
                  },
                ),
                GestureDetector(
                  child: _itemCreat(context, '相册'),
                  onTap: () {
                    print('选中相册');
                    Navigator.pop(context);
                    getImage(ImageSource.gallery, type);
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: _itemCreat(context, '取消'),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _itemCreat(BuildContext context, String title) {
    return Container(
      color: Colors.white,
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(title),
      ),
    );
  }
}
