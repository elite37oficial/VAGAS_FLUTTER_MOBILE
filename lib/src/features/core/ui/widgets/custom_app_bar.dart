import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import '../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        actions: [
          Container(),
        ],
        title: title == null
            ? SvgPicture.asset(
                "assets/images/Logo_medium_2.svg",
                width: 250,
                height: 50,
              )
            : Text(
                title!,
                style: context.textStyles.textButtonWelcomePage.copyWith(
                  fontSize: 20,
                ),
              ),
        backgroundColor: AppColors.appBar,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
