import 'package:apk_mobile/view/button_dashboard.dart';
import 'package:apk_mobile/view/log/sign_up.dart';
import 'package:apk_mobile/view/log/styles_log.dart';
import 'package:apk_mobile/view/log/wigdet/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Please sign in your account',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: AppColors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // mengatur gambar dibagian login
                Image.asset(
                  'assets/images/login.png',
                ),
                const SizedBox(height: 24.0),
                // mengatur textfield
                CustomTextField(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hint: 'Email or username',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  hint: 'Password',
                  prefixIcon: Icons.password,
                  isObscure: isObscure,
                  hasSuffix: true,
                  validator: (value) {
                    if (value!.length < 7) {
                      return 'Password minimum 7 words';
                    }
                    return null;
                  },
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Lottie.asset(
                                        'assets/loading.json',
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Is Processing',
                                        textAlign: TextAlign.center,
                                        style: CustomText.body,
                                      )
                                    ],
                                  ),
                                ));

                        // proses loading
                        await Future.delayed(const Duration(seconds: 3));

                        // setelah selesai loading, tutup dialog
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(_createRoute());
                      }
                    },
                    child: Text(
                      'Sign in',
                      style: CustomText.body
                          .copyWith(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don`t have account?', style: CustomText.body),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        // jika text diklik maka akan akan kehalaman Sign in Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: Text('Sign up',
                          style: CustomText.body.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const ButtonDashboard(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.elasticIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 550));
}
