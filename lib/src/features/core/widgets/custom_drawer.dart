import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/model/filter_options.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import '../../views/home/bloc/list_jobs_home_bloc.dart';
import 'bloc/custom_drawer_bloc.dart';
import 'custom_topic_drawe_filter.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    super.initState();
    context.read<CustomDrawerBloc>().add(
          SelectedCustomDrawerEvent(
            isRegimeClt: CustomDrawerBloc.isRegimeClt,
            isRegimePj: CustomDrawerBloc.isRegimePj,
            isModalityRemote: CustomDrawerBloc.isModalityRemote,
            isModalityPresential: CustomDrawerBloc.isModalityPresential,
            isModalityHibrid: CustomDrawerBloc.isModalityHibrid,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> cityNames = [
      'Ilha Bela',
      'Belo Horizonte',
      'Rio de Janeiro',
      'Santos',
      'Ubatuba',
      'Sao Sebastião',
      'Sao José dos Campos',
      'Sao José do Rio Preto',
      'Sao Paulo',
      'Curitiba',
      'Campinas',
    ];

    List<FilterOptions> listFilter = [
      FilterOptions(
        title: "CLT",
        type: "regime",
        isSelected: CustomDrawerBloc.isRegimeClt,
      ),
      FilterOptions(
        title: "PJ",
        type: "regime",
        isSelected: CustomDrawerBloc.isRegimePj,
      ),
      FilterOptions(
        title: "Remoto",
        type: "modality",
        isSelected: CustomDrawerBloc.isModalityRemote,
      ),
      FilterOptions(
        title: "Presencial",
        type: "modality",
        isSelected: CustomDrawerBloc.isModalityPresential,
      ),
      FilterOptions(
        title: "Híbrido",
        type: "modality",
        isSelected: CustomDrawerBloc.isModalityHibrid,
      ),
    ];
    final TextEditingController textController = TextEditingController();

    final List<DropdownMenuEntry<String>> cityEntries =
        cityNames.map((String cityName) {
      return DropdownMenuEntry<String>(
        value: cityName,
        label: cityName,
      );
    }).toList();
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          bottom: 0,
          child: SizedBox(
            height: 679,
            width: 300,
            child: Drawer(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(width: 1, color: AppColors.lightHover)),
                child: BlocBuilder<CustomDrawerBloc, CustomDrawerState>(
                  builder: (context, state) {
                    if (state is IsEmptyCustomDrawerState) {
                      return Center(
                        child: Text("Sem filtros no momento"),
                      );
                    }
                    if (state is SelectCustomDrawerState) {
                      bool isRegimeClt = state.isRegimeClt;
                      bool isRegimePj = state.isRegimePj;
                      bool isModalityRemote = state.isModalityRemote;
                      bool isModalityPresential = state.isModalityPresential;
                      bool isModalityHibrid = state.isModalityHibrid;
                      String cityFilter = state.cityFilter;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Filtrar por',
                                      style: context.textStyles.textInterRegular
                                          .copyWith(
                                        fontSize: 18,
                                        color: AppColors.darker,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                        'assets/images/IconCloseAppVagas.svg',
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                  height: 0,
                                  color: AppColors.lightHover,
                                  thickness: 1),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    CustomTopicDrawerFilter(
                                      title: "Tipo de contrato",
                                      type: "regime",
                                      listFilter: listFilter,
                                    ),
                                    CustomTopicDrawerFilter(
                                      title: "Modalidade",
                                      type: "modality",
                                      listFilter: listFilter,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24, bottom: 12, right: 16),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Localização",
                                              style: context
                                                  .textStyles.textFilter
                                                  .copyWith(
                                                fontSize: 16,
                                                color: AppColors.darker,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            DropdownMenu(
                                              controller: textController,
                                              onSelected: (_) {
                                                cityFilter =
                                                    textController.value.text;
                                                print(cityFilter);
                                              },
                                              menuHeight: 3 * 48,
                                              enableFilter: true,
                                              leadingIcon: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 14),
                                                child: SvgPicture.asset(
                                                  "assets/images/map-pin.svg",
                                                ),
                                              ),
                                              label: Text(
                                                "Busque uma localidade...",
                                                style: context
                                                    .textStyles.textInterRegular
                                                    .copyWith(
                                                  color: AppColors.lightPrimary,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              trailingIcon: SizedBox.shrink(),
                                              inputDecorationTheme:
                                                  InputDecorationTheme(
                                                filled: true,
                                                fillColor: AppColors.light,
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.never,
                                                contentPadding: EdgeInsets.zero,
                                                activeIndicatorBorder:
                                                    BorderSide.none,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                              ),
                                              menuStyle: MenuStyle(
                                                padding:
                                                    MaterialStatePropertyAll(
                                                        EdgeInsets.zero),
                                                shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    side: BorderSide(
                                                        color:
                                                            AppColors.grey500),
                                                  ),
                                                ),
                                                elevation:
                                                    MaterialStatePropertyAll(0),
                                              ),
                                              textStyle: context
                                                  .textStyles.textInterRegular
                                                  .copyWith(
                                                color: AppColors.darker,
                                                fontSize: 12,
                                              ),
                                              dropdownMenuEntries: cityEntries,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      color: AppColors.lightHover,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Divider(
                                height: 0,
                                color: AppColors.lightHover,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        for (var i = 0;
                                            i < listFilter.length;
                                            i++) {
                                          listFilter[i].isSelected = false;
                                        }
                                        context.read<CustomDrawerBloc>().add(
                                              SelectedCustomDrawerEvent(
                                                isRegimeClt: false,
                                                isRegimePj: false,
                                                isModalityRemote: false,
                                                isModalityPresential: false,
                                                isModalityHibrid: false,
                                                cityFilter: "",
                                              ),
                                            );
                                      },
                                      child: Text(
                                        'Redefinir',
                                        style: context
                                            .textStyles.textInterRegular
                                            .copyWith(
                                          fontSize: 15,
                                          color: AppColors.darker,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 24,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      onPressed: () {
                                        String regimeFilter = "";
                                        String modalityFilter = "";

                                        context.read<ListJobsHomeBloc>().add(
                                              GetListJobsHomeEvent(
                                                  regimeFilter:
                                                      CustomDrawerBloc()
                                                          .regimeFilter(
                                                    regimeFilter: regimeFilter,
                                                    isRegimeClt: isRegimeClt,
                                                    isRegimePj: isRegimePj,
                                                  ),
                                                  modalityFilter:
                                                      CustomDrawerBloc()
                                                          .modalityFilter(
                                                    modalityFilter:
                                                        modalityFilter,
                                                    isModalityRemote:
                                                        isModalityRemote,
                                                    isModalityPresential:
                                                        isModalityPresential,
                                                    isModalityHibrid:
                                                        isModalityHibrid,
                                                  ),
                                                  cityFilter: textController
                                                      .value.text),
                                            );
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Aplicar',
                                        style: context
                                            .textStyles.textInterRegular
                                            .copyWith(
                                          fontSize: 15,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    );
                  },
                )),
          ),
        ),
      ],
    );
  }
}
