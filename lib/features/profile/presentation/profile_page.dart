import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';

import '../../../core/theme_manager/strings_manager.dart';
import '../../../core/theme_manager/values_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: ColorManager.lightGrey),
              width: AppSize.s150,
              height: AppSize.s150,
              child: ClipOval(
                  child: Image.network(
                'https://i.insider.com/565ef925dd0895131c8b463e?width=1000&format=jpeg&auto=webp',
                fit: BoxFit.cover,
              ))),
          const SizedBox(
            height: AppSize.s30,
          ),
          Text(
            AppStrings.profileName,
            style: const TextStyle(
                fontSize: AppSize.s30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Divider(
            height: AppSize.s10,
            thickness: 2.5,
            color: ColorManager.black,
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.edit,
                ),
                const SizedBox(
                  width: AppSize.s20,
                ),
                Text(
                  AppStrings.editProfile,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: ColorManager.red,
                ),
                const SizedBox(
                  width: AppSize.s20,
                ),
                Text(
                  AppStrings.logout,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.s20,
                      color: ColorManager.red),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
