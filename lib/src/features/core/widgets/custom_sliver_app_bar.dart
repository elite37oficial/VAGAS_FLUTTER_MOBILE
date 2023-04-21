import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import '../../views/home/bloc/list_jobs_home_bloc.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightActive,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              style: context.textStyles.textFilter
                  .copyWith(color: AppColors.white),
              decoration: InputDecoration(
                hintText: "Busque pela vaga ideal...",
                contentPadding: const EdgeInsets.all(12),
                hintStyle: context.textStyles.textFilter,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.primary,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              final filter = textController.value.text;
              context
                  .read<ListJobsHomeBloc>()
                  .add(GetListJobsHomeEvent(filter: filter));
            },
            child: Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.lightActive,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/search.svg",
                  color: AppColors.darker,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
