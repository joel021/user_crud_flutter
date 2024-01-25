import 'package:flutter/material.dart';
import 'package:user_crud_flutter/components/colors.dart';
import 'package:user_crud_flutter/config/routes.dart';
import 'package:user_crud_flutter/helper/validator.dart';
import 'package:user_crud_flutter/model/user.dart';
import 'package:user_crud_flutter/service/login_service.dart';
import 'package:user_crud_flutter/views/list_posts/list_posts_args.dart';
import 'package:user_crud_flutter/views/login/login_list_user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final AuthService authService = AuthService(UserService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                ),
                validator: (value) {
                  return Validator.stringValidation("user name", value);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Enter your phone number',
                ),
                validator: (value) {
                  return Validator.stringValidation("Phone number", value);
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String username = usernameController.text;
                    String phone = phoneController.text;

                    bool isAuthenticated =
                        await authService.authenticateUser(username, phone);

                    if (isAuthenticated) {
                      Navigator.pushNamed(context, Routes.LIST_POSTS,
                          arguments: ListPostsArgs(
                              User(null, null, username, phone, null)));
                    } else {
                      print('Falha na autenticação');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue(),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 16.0, color: Color.fromARGB(255, 36, 35, 35)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
