import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = '/sign-up-screen';
  static bool isChecked = true;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactInfoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordObscure = true;
  bool showSpinner = false;

  void resetForm() {
    formKey.currentState?.reset();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    contactInfoController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/images/logo-square.png',
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Create A New Account',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: kBlackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: kPrimarySwatchColor,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: kPrimarySwatchColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter your full name';
                                      }
                                      return null;
                                    },
                                    controller: fullNameController,
                                    decoration: InputDecoration(
                                      fillColor: kSecondarySwatchColor.shade200,
                                      hintText: 'Type Here',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      floatingLabelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kPrimarySwatchColor,
                                          ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kTextColor,
                                          ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: kPrimarySwatchColor,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Email Address',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: kPrimarySwatchColor,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: kPrimarySwatchColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                              .hasMatch(value)) {
                                        return 'Use the standard username format like example@mail.com';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      fillColor: kSecondarySwatchColor.shade200,
                                      hintText: 'Type Here',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      floatingLabelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kPrimarySwatchColor,
                                          ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kTextColor,
                                          ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: kPrimarySwatchColor,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Contact Information',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: kPrimarySwatchColor,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: kPrimarySwatchColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                        return 'Enter a valid contact number';
                                      }
                                      return null;
                                    },
                                    controller: contactInfoController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      fillColor: kSecondarySwatchColor.shade200,
                                      hintText: 'Type Here',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      floatingLabelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kPrimarySwatchColor,
                                          ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kTextColor,
                                          ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: kPrimarySwatchColor,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: kPrimarySwatchColor,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: kPrimarySwatchColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter a password';
                                      } else if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      fillColor: kSecondarySwatchColor.shade200,
                                      hintText: 'Type Here',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      floatingLabelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kPrimarySwatchColor,
                                          ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kTextColor,
                                          ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: kPrimarySwatchColor,
                                        ),
                                    obscureText: passwordObscure,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Confirm Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: kPrimarySwatchColor,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: kPrimarySwatchColor,
                                    ),
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Confirm your password';
                                      } else if (value !=
                                          passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                    controller: confirmPasswordController,
                                    decoration: InputDecoration(
                                      fillColor: kSecondarySwatchColor.shade200,
                                      hintText: 'Type Here',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      floatingLabelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kPrimarySwatchColor,
                                          ),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kTextColor,
                                          ),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: kPrimarySwatchColor,
                                        ),
                                    obscureText: passwordObscure,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: !passwordObscure,
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            passwordObscure = !value!;
                                          },
                                        );
                                      },
                                    ),
                                    Text(
                                      'Show Passwords',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: kBlackColor,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                       
                                          child: Text(
                                            'Submit',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
