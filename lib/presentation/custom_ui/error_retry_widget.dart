import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ClickRetryFunction = void Function();

class ErrorRetryWidget extends StatelessWidget {
  String? errorMsg;
  ClickRetryFunction? clickRetryAction;

  ErrorRetryWidget(this.errorMsg, {this.clickRetryAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(errorMsg ?? "未知錯誤"),
          SizedBox(
            height: 5,
          ),
          RaisedButton(
            onPressed: () {
              if (clickRetryAction != null) clickRetryAction!();
            },
            child: Text("重試"),
          )
        ],
      ),
    );
  }
}
