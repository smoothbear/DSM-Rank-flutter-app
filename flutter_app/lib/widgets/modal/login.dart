import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginDialog> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          onTap: () {},
          child: Container(
            child: Center(
                child: InkWell(
                child: Text("로그인", style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
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
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: '비밀번호',
        icon: Icon(Icons.vpn_key),
          hintText: 'your password',
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _login() {

  }
}