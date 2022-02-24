import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

abstract class Dialogs {
  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        routeSettings: const RouteSettings(name: "loading_dialog"),
        barrierColor: Colors.black26,
        barrierDismissible: false,
        builder: (context) {
          return LoadingWidget();
        });
  }

  static void hideLoading(BuildContext context) {
    assert(context != null);
    Navigator.of(context)
        .popUntil((route) => route.settings.name != "loading_dialog");
  }

  static Future<bool> showConfirmMessage(BuildContext context,String message,{String? title,bool? barrierDismissible}) async{
    var result = await showDialog(
        context: context,
        barrierColor: Colors.black26,
        barrierDismissible: barrierDismissible ?? true,
        builder: (context) {
          return ConfirmMessageWidget(title,message);
        });
    return result;
  }

  static void showMessage(BuildContext context,String message,{String? title}) {
    showDialog(
        context: context,
        barrierColor: Colors.black26,
        barrierDismissible: false,
        builder: (context) {
          return ConfirmMessageWidget(title,message);
        });

  }
  static void showImageDialog(BuildContext context, String imgPath) {
    assert(context != null);
    showDialog(
        context: context,
        barrierColor: Colors.black26,
        barrierDismissible: true,
        builder: (context) {
          return ImageWidget(imgPath);
        });
  }
}


class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(30.0),
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor:
              AlwaysStoppedAnimation(Theme
                  .of(context)
                  .primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
class ConfirmMessageWidget extends StatelessWidget {
  var title;
  var message;
  ConfirmMessageWidget(this.title,this.message);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(title ?? "提示"),
                Text(message),
                Row(
                  children: [
                    Expanded(child:
                    TextButton(child:Text("OK"),
                      onPressed: (){
                        Navigator.of(context).pop(true);
                      },)
                    ),
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  String imagePath;

  ImageWidget(this.imagePath);

  @override
  ImageWidgetState createState() => ImageWidgetState(this.imagePath);
}

class ImageWidgetState extends State<ImageWidget> {
  String imagePath;

  ImageWidgetState(this.imagePath);

  double finalScale = 1.0;
  double finalRotation = 0.0;
  Offset _position = Offset(0.0, 0.0);


  void scaleUpdate(ScaleUpdateDetails details) {
    Logger.e(details.scale);
    if (details.scale == 1.0) {
      return;
    }
    setState(() =>
    {
      if (finalScale * details.scale <= 3.0 &&
          finalScale * details.scale >= 1.0)
        finalScale = finalScale * details.scale
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Container(
                child: Image.network(imagePath),
              ),
            ),
          )

        // GestureDetector(
        //   onScaleUpdate: scaleUpdate,
        //   child: Transform.scale(
        //     scale: finalScale,
        //     child: Image.file(File(imagePath),
        //         fit: BoxFit.contain, width: double.infinity),
        //   ),
        // ),
      ),
    );
  }
}