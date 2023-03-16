import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppBar(
          title: SvgPicture.asset(
            "assets/images/Logo_medium_2.svg",
            width: 250,
            height: 50,
          ),
          backgroundColor: AppColors.appBar,
          elevation: 0,
          centerTitle: true,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
