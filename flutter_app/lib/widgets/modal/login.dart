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
        child: _buildBody(),
          width: 280,
          height: 300,
        ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))
      ),
      actions: [
        ButtonTheme(
          minWidth: 300,
          child: _buildLoginButton(),
          height: 50,
          shape: RoundedRectangleBorder(
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Material(
      child: Column(
        children: <Widget>[
            Text("로그인", style: TextStyle(fontSize: 22.0, color: Colors.black),),
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

  Widget _buildLoginButton() {
    return FlatButton(
          onPressed: Login,
          child: Text("로그인", style: TextStyle(color: Colors.blue),),
          color: Colors.white10,
          splashColor: Colors.black12,
    );
  }

  // ignore: non_constant_identifier_names
  void Login() {

  }
}