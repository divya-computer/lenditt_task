import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenditt_task/Controller/AuthController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: controller.emailError.value,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: controller.passwordError.value,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  controller.login();

                  if (controller.emailError.value.isNotEmpty ||
                      controller.passwordError.value.isNotEmpty) {
                    Get.snackbar('Error',
                        '${controller.emailError.value} ${controller.passwordError.value}');
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
