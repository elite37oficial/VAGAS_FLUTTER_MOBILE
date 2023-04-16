import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_sliver_app_bar.dart';
import '../styles/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? filterAppBar;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    this.title,
    this.filterAppBar,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (filterAppBar == true) {
      return Container(
        child: AppBar(
          elevation: 0,
          leading: leading,
          backgroundColor: AppColors.primary,
          actions: [Container()],
          title: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CustomSliverAppBar(),
          ),
        ),
      );
    } else {
      return Container(
        child: AppBar(
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
                          text: "Vagas",
                          style: context.textStyles.textLatoBold),
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
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
