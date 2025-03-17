import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selecteTab = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32, top: 32),
                child: SvgPicture.asset(
                  'assets/img/icons/LOGO.svg',
                  width: 120,
                ),
              ),
              Expanded(
                child: Container(
                  // height: 100,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(32)),
                      color: themeData.colorScheme.primary),
                  child: Column(children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selecteTab = loginTab;
                              });
                            },
                            child: Text(
                              'Login'.toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: selecteTab == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selecteTab = signUpTab;
                                });
                              },
                              child: Text(
                                'Sign Up'.toUpperCase(),
                                style: tabTextStyle.apply(
                                    color: selecteTab == signUpTab
                                        ? Colors.white
                                        : Colors.white54),
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(32)),
                        color: themeData.colorScheme.surface,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                        child: selecteTab == loginTab
                            ? _Login(themeData: themeData)
                            : _SignUp(themeData: themeData),
                      ),
                    ))
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Welcome back',
        style: themeData.textTheme.headlineLarge,
      ),
      const SizedBox(
        height: 8,
      ),
      Text('Sing in whid your accont',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.9)),
      const SizedBox(
        height: 16,
      ),
      const TextField(
        decoration: InputDecoration(label: Text('Username')),
      ),
      const PasswordTextField(),
      const SizedBox(
        height: 24,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text('Login'.toUpperCase()),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Forgot your Password ?'),
          const SizedBox(
            width: 8,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Reset here'),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Center(
          child: Text(
        'or sing in with'.toUpperCase(),
        style: const TextStyle(letterSpacing: 2),
      )),
      const SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/icons/Google.png',
            width: 36,
            height: 36,
          ),
          const SizedBox(
            width: 24,
          ),
          Image.asset('assets/img/icons/Facebook.png', width: 36, height: 36),
          const SizedBox(
            width: 24,
          ),
          Image.asset('assets/img/icons/Twitter.png', width: 36, height: 36),
        ],
      )
    ]);
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Welcome to blog club',
        style: themeData.textTheme.headlineMedium,
      ),
      const SizedBox(
        height: 8,
      ),
      Text('Please enter your information',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.9)),
      const SizedBox(
        height: 16,
      ),
      const TextField(
        decoration: InputDecoration(label: Text('Fullname')),
      ),
      const TextField(
        decoration: InputDecoration(label: Text('Username')),
      ),
      const PasswordTextField(),
      const SizedBox(
        height: 24,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {},
        child: Text('Sign Up'.toUpperCase()),
      ),
      const SizedBox(
        height: 16,
      ),
      Center(
          child: Text(
        'or sing Up with'.toUpperCase(),
        style: const TextStyle(letterSpacing: 2),
      )),
      const SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/icons/Google.png',
            width: 36,
            height: 36,
          ),
          const SizedBox(
            width: 24,
          ),
          Image.asset('assets/img/icons/Facebook.png', width: 36, height: 36),
          const SizedBox(
            width: 24,
          ),
          Image.asset('assets/img/icons/Twitter.png', width: 36, height: 36),
        ],
      )
    ]);
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text('Password'),
          suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(
                obscureText ? 'Show' : 'Hide',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 14),
              ))),
    );
  }
}
