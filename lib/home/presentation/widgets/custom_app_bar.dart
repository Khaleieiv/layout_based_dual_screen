import 'package:flutter/material.dart';
import 'package:layout_based_dual_screen/common/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final TextEditingController nameController;

  const CustomAppBar({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(
              flex: 2,
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'logo',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.phone),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Привіт, ',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      nameController.text,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Додати авто',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Завантажте дані про ваше авто для кращого використання сервісу.',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Додати авто >',
                      style:
                      TextStyle(fontSize: 12, color: AppColors.greenColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 16 / 16,
                  child: Image.asset(
                    'assets/images/img_group.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
