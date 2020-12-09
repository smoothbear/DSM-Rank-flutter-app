import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/modal/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainAppbar extends StatelessWidget with PreferredSizeWidget {
  final storage = FlutterSecureStorage();

  void logout(BuildContext context) async {
    await storage.delete(key: "access-token");
    await storage.delete(key: "refresh-token");

    showDialog(barrierDismissible: false, builder: (BuildContext context) {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });

      return AlertDialog(
        content: Container(
          child: Text(
            "로그아웃 되었습니다.",
            textAlign: TextAlign.center,
          ),
          height: 20,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
      );
    }, context: context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BottomAppBar(
      child: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.login),
            tooltip: "로그인",
            onPressed: () async {
              if (await storage.read(key: 'access-token') == null) {
                showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: "",
                    transitionDuration: Duration(milliseconds: 320),
                    transitionBuilder: (_, anim, __, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                            .animate(anim),
                        child: child,
                      );
                    },
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return LoginDialog();
                    }
                );
              }
              else {
                logout(context);
              }
            }
          )
        ]
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}