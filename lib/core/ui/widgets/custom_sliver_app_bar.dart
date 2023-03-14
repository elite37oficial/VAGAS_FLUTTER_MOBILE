import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/text_styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.cardBorderLine,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: context.textStyles.textFilter
                  .copyWith(color: AppColors.white),
              decoration: InputDecoration(
                hintText: "Busque pela vaga ideal...",
                contentPadding: EdgeInsets.all(12),
                hintStyle: context.textStyles.textFilter,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.cardBorderLine,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: AppColors.greyBlue,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 43,
              width: 94,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.cardBorderLine,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Pesquisar",
                  style: context.textStyles.textFilter
                      .copyWith(color: AppColors.cardJobTitle),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
