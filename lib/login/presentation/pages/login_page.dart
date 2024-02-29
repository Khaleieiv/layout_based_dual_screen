import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/constants/app_colors.dart';
import 'package:layout_based_dual_screen/common/presentation/pages/container_page.dart';
import 'package:layout_based_dual_screen/common/presentation/state/controller_provider.dart';
import 'package:layout_based_dual_screen/common/presentation/widgets/custom_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final nameController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 8,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Як до вас звертатися?",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Text(
                    "Будь ласка, укажіть ваше ім'я для персоналізації сервісу.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              TextFormField(
                controller: nameController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Ваше ім’я',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: AppColors.greenColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: AppColors.greenColor,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: AppColors.greenColor,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: AppColors.greenColor,
                      width: 2,
                    ),
                  ),
                  errorText: errorMessage,
                ),
              ),
              const Spacer(
                flex: 45,
              ),
              CustomElevatedButton(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                  'Продовжити',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => checkTextFieldOnIsEmpty(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkTextFieldOnIsEmpty() {
    setState(() {
      if (nameController.text.isEmpty) {
        setState(() {
          errorMessage = 'Будь ласка, введіть ваше ім\'я';
        });
      } else {
        setState(() {
          errorMessage = null;
          isLoading = true;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isLoading = false;
            ControllerStorage.setController(nameController);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContainerPage()),
            );
          });
        });
      }
    });
  }
}