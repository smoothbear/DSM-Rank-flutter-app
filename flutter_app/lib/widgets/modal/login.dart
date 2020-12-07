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
          height: 300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))
    ),
    );
  }

  Widget _buildBody() {
    return Material(
      child: Column(
        children: <Widget>[
            _buildUserEmailField(),
            _buildPasswordField()
        ],
      )
    );
  }

  Widget _buildUserEmailField() {
    return TextField(
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
        icon: Icon(Icons.vpn_key)
      ),
    );
  }
}