import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import '../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        // titleSpacing: 0,
        // leadingWidth: 0,
        actions: actions == null ? [SizedBox()] : actions,
        title: title == null
            ? RichText(
                text: TextSpan(
                  style: context.textStyles.textLatoLigth.copyWith(
                    color: AppColors.lightActive,
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Elite "),
                    TextSpan(
                        text: "Vagas", style: context.textStyles.textLatoBold),
                  ],
                ),
              )
            : Text(
                title!,
                style: context.textStyles.textButtonWelcomePage.copyWith(
                  fontSize: 20,
                ),
              ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: title == null ? false : true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
