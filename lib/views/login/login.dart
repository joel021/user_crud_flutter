import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud_flutter/components/buttons.dart';
import 'package:user_crud_flutter/config/routes.dart';
import 'package:user_crud_flutter/views/login/login_state.dart';

import '../../components/forms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loginPage();
  }

  Widget loginPage() {
    return Consumer<LoginStateProvider>(builder: (context, notifier, _) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: loginContent(notifier),
        ),
      );
    });
  }

  Widget loginContent(LoginStateProvider provider) {
    final bool enabled = !provider.loading;

    if (provider.user == null) {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.message),
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            const SizedBox(height: 16.0),
            inputField("Usuário", "Bret", usernameController, false, enabled),
            const SizedBox(height: 16.0),
            inputField("Phone", "1-770-736-8031 x56442", phoneController, false,
                enabled),
            const SizedBox(height: 24.0),
            button("Login", () => onLogin(provider))
          ],
        ),
      );
    } else {
      return button("Próximo", onNextPage);
    }
  }

  void onNextPage() {
    Navigator.pushNamed(context, Routes.LIST_POSTS);
  }

  void onLogin(LoginStateProvider provider) {
    if (_formKey.currentState?.validate() ?? false) {
      provider.authenticateUser(usernameController.text, phoneController.text);
    }
  }
}
