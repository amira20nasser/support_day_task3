import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_day3/manager/validator.dart';

import '../widgets/custom_text_form_field.dart';
import 'home_screen.dart';

final visiblePasswordProvider = StateProvider<bool>((ref) {
  return true;
});

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0XFFEEEEEE),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "talabat",
                style: TextStyle(
                  color: Color(0xFFFF5A00),
                  fontSize: 60,
                  fontFamily: "font talabat",
                ),
              ),
              const Text(
                "Sign up for free",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 100),
              Form(
                key: keyForm,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        validator: Validator.validatorName,
                        hintText: "Name",
                        prefixIcon: Icon(
                          Icons.person_3,
                          color: Color(0xFFFF5A00),
                          size: 27,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CustomTextFormField(
                        validator: Validator.validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "E-mail",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFFFF5A00),
                          size: 27,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Consumer(
                        builder: (context, ref, child) => CustomTextFormField(
                          validator: Validator.validatePassword,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: ref.watch(visiblePasswordProvider),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              ref
                                  .read(visiblePasswordProvider.notifier)
                                  .update((state) => !state);
                            },
                            icon: ref.watch(visiblePasswordProvider)
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Color(0xFFFF5A00),
                                  ),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_rounded,
                            color: Color(0xFFFF5A00),
                            size: 27,
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        checkColor: Colors.white,
                        activeColor: const Color(0xFFFF5A00),
                        title: const Text("Remember me"),
                        value: true,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 110),
                      ElevatedButton(
                        onPressed: () {
                          if (keyForm.currentState?.validate() ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 60),
                          backgroundColor: const Color(0xFFFF5A00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
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
