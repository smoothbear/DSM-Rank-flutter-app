import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginDialog> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String url = 'http://52.79.253.30:5050';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
        child: Column(
        children: [
          SizedBox(height: 40,),
          Text("로그인", style: TextStyle(fontSize: 22.0, color: Colors.black),),
          SizedBox(height: 40,),
          _buildBody(),
          ],
        ),
          width: 260,
          height: 280,
        ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(25.0),
          onTap: _login,
          child: Container(
            child: Center(
                child: InkWell(
                child: Text("로그인", style: TextStyle(fontSize: 18, color: Colors.black54), textAlign: TextAlign.center),
              ),
            ),
            width: 400,
            height: 40,
          )
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Material(
      child: Column(
        children: [
          _buildTextForm()
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
      ),
      color: Colors.transparent,
    );
  }

  Widget _buildTextForm() {
    return Column(
      children: <Widget>[
        _buildUserEmailField(),
        _buildPasswordField(),
    ],
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
    );
  }

  Widget _buildUserEmailField() {
    return
      TextField(
      controller: _userEmailController,
      decoration: InputDecoration(
        labelText: '이메일',
        icon: Icon(Icons.account_box),
        hintText: 'you@dsm.hs.kr',
      ),
      keyboardType: TextInputType.emailAddress,
        enableSuggestions: false,
        autocorrect: false,
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: '비밀번호',
        icon: Icon(Icons.vpn_key),
          hintText: 'your password',
      ),
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  // ignore: non_constant_identifier_names
  void _login() async {
    if (_userEmailController.text != '' && _passwordController.text != '') {
      Map<String, dynamic> request = {
        "email": _userEmailController.text,
        "password": _passwordController.text
      };
      Response response = await post(url + '/auth', headers: {"Content-Type": "application/json"}, body: json.encode(request));

      if (response.statusCode > 299) {
        showDialog(context: context,  barrierDismissible: false, builder: (BuildContext context) {
          Future.delayed(Duration(milliseconds: 500), () {
            Navigator.pop(context);
          }
          );

          return AlertDialog(
            content: Container(
              child: Text(
                "아이디 또는 패스워드를 확인해주세요.",
                textAlign: TextAlign.center,
              ),
              height: 20,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
          );
        });
      }

      Map<String, dynamic> responseBody = json.decode(response.body);

      final storage = FlutterSecureStorage();
      await storage.write(key: 'access-token', value: responseBody['accessToken']);
      Navigator.pop(context);
    } else {
      showDialog(context: context,  barrierDismissible: false, builder: (BuildContext context) {
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pop(context);
        }
        );

        return AlertDialog(
              content: Container(
                child: Text(
                  "아이디 또는 패스워드를 입력해주세요.",
                  textAlign: TextAlign.center,
                ),
                height: 20,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
            );
          });
    }
  }
}