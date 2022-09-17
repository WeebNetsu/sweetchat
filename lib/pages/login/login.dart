import 'package:flutter/material.dart';
import 'package:sweetchat/utils/constants.dart';
import 'package:sweetchat/widgets/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  late final TextEditingController? _emailController;
  late final TextEditingController? _passwordController;

  void showMessage(String message, {bool isError = false}) {
    if (isError) {
      context.showErrorSnackBar(message: message);
    } else {
      context.showSnackBar(message: message);
    }
  }

  /* Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    if (_emailController == null || _passwordController == null) {
      showMessage("All fields are required", isError: true);
      return;
    }

    final response = await supabase.auth.signIn(
      email: _emailController!.text,
      password: _passwordController!.text,
      options: AuthOptions(
        redirectTo: kIsWeb ? null : 'com.sweetchat.sweetchat://login-callback/',
      ),
    );

    final error = response.error;
    if (error != null) {
      showMessage(error.message, isError: true);
    } else {
      if (supabase.auth.user()?.emailConfirmedAt != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed("/home");
      } else {
        showMessage("Email not confirmed", isError: true);
      }
    }

    setState(() {
      _isLoading = false;
    });
  } */

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.primary,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Image.asset(
                    "assets/images/profile1.jpg",
                    // the below fit specifies that the
                    // image should be as small as possible while still
                    // filling what it should be rendering
                    height: MediaQuery.of(context).size.height / 4,
                    fit: BoxFit.scaleDown,
                  ),

                  // login text
                  const Text(
                    "Sweet Chat",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // inputs
                  Input(title: "Email", contollerItem: _emailController),

                  const SizedBox(height: 10),

                  Input(
                    title: "Password",
                    password: true,
                    contollerItem: _passwordController,
                  ),

                  // remember me
                  const SizedBox(height: 10),

                  // CheckboxListTile(
                  //   value: _rememberMe,
                  //   onChanged: _handleRememberMe,
                  //   activeColor: theme.secondary,
                  //   title: const Text(
                  //     "Remember me",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //   contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  // ),

                  // buttons
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: MaterialButton(
                        onPressed: _isLoading ? null : () => {} /* _signIn */,
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // No account option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not a member? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, "/signup");
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // forgot password
                  const SizedBox(height: 20),

                  const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
