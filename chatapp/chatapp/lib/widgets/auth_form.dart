import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(String email, String password, String userName,
      bool isLogin, BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey("Email"),
                      validator: (value) {
                        if (value.isEmpty ||
                            !value.contains("@") ||
                            !value.contains(".com")) {
                          return "Please ente a valid email address";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email Address"),
                      onSaved: (value) {
                        _userEmail = value;
                      },
                    ),
                  TextFormField(
                      key: ValueKey("Username"),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return "Please enter 4 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Username"),
                      onSaved: (value) {
                        _userName = value;
                      }),
                  TextFormField(
                      key: ValueKey("Password"),
                      validator: (value) {
                        if (value.isEmpty || value.length < 7) {
                          return "Password must be atleast 7 characters long.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      onSaved: (value) {
                        _userPassword = value;
                      }),
                  SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? "Login" : "Signup"),
                      onPressed: _trySubmit,
                    ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_isLogin
                        ? "Create new account"
                        : "Already have an account?Login"),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
