import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/modal/login.dart';

class MainAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text("DSM Rank"),
      actions: [
        FlatButton(
          child: Text(
            "로그인",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          onPressed: () {
            showGeneralDialog(
              barrierDismissible: true,
              barrierLabel: "",
              transitionDuration: Duration(milliseconds: 320),
              transitionBuilder: (_, anim, __, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
                  child: child,
                );
              },
              context: context,
              pageBuilder: (_, __, ___) {
                return LoginDialog();
              }
            );
          }
        )
      ]
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}