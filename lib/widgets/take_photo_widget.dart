import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

///调用相机
class TakePhotoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TakePhotoState();
  }
}

List<CameraDescription> cameras;

Future<void> camaraInit() async {
  cameras = await availableCameras();
}

class TakePhotoState extends State {
  CameraController cameraController;

  @override
  void initState() {
    super.initState();
    camaraInit();
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text("拍照"),
          centerTitle: true,
        ),
        body: Container(
          child: Text("拍照"),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: cameraController.value.aspectRatio,
        child: CameraPreview(cameraController),
      );
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
