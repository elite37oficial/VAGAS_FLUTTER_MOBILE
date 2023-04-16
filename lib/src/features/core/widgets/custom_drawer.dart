import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'bloc/custom_drawer_bloc.dart';
import 'custom_check_box_button.dart';

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
            isModalityPresencial: CustomDrawerBloc.isModalityPresencial,
            isModalityHibrid: CustomDrawerBloc.isModalityHibrid,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> cityNames = [
      'Rio de Janeiro/RN - BR',
      'São Paulo/SP - BR',
      'Parnaíba/PI - BR',
      'Garanhuns/PE - BR',
      'Jacuturu/PR - BR'
    ];

    // final List<String> listTypeJobs = ["CLT", "PJ (Pessoa Jurídica)"];
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
                      bool isModalityPresencial = state.isModalityPresencial;
                      bool isModalityHibrid = state.isModalityHibrid;
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24, bottom: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tipo de Contrato",
                                            style: context.textStyles.textFilter
                                                .copyWith(
                                              fontSize: 16,
                                              color: AppColors.darker,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  isRegimeClt = !isRegimeClt;
                                                  context
                                                      .read<CustomDrawerBloc>()
                                                      .add(
                                                        SelectedCustomDrawerEvent(
                                                          isRegimeClt:
                                                              isRegimeClt,
                                                        ),
                                                      );
                                                },
                                                child: CustomCheckBoxButton(
                                                  text: 'CLT',
                                                  isSelect: isRegimeClt,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 24,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  isRegimePj = !isRegimePj;
                                                  context
                                                      .read<CustomDrawerBloc>()
                                                      .add(
                                                        SelectedCustomDrawerEvent(
                                                          isRegimePj:
                                                              isRegimePj,
                                                        ),
                                                      );
                                                },
                                                child: CustomCheckBoxButton(
                                                  text: 'PJ (Pessoa Jurídica)',
                                                  isSelect: isRegimePj,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      color: AppColors.lightHover,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24, bottom: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Modalidade",
                                            style: context.textStyles.textFilter
                                                .copyWith(
                                              fontSize: 16,
                                              color: AppColors.darker,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      isModalityRemote =
                                                          !isModalityRemote;
                                                      context
                                                          .read<
                                                              CustomDrawerBloc>()
                                                          .add(
                                                            SelectedCustomDrawerEvent(
                                                              isModalityRemote:
                                                                  isModalityRemote,
                                                            ),
                                                          );
                                                    },
                                                    child: CustomCheckBoxButton(
                                                      // index: 2,
                                                      text: 'Remoto',
                                                      isSelect:
                                                          isModalityRemote,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      isModalityPresencial =
                                                          !isModalityPresencial;
                                                      context
                                                          .read<
                                                              CustomDrawerBloc>()
                                                          .add(
                                                            SelectedCustomDrawerEvent(
                                                              isModalityPresencial:
                                                                  isModalityPresencial,
                                                            ),
                                                          );
                                                    },
                                                    child: CustomCheckBoxButton(
                                                      // index: 3,
                                                      text: 'Presencial',
                                                      isSelect:
                                                          isModalityPresencial,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 16),
                                              InkWell(
                                                onTap: () {
                                                  isModalityHibrid =
                                                      !isModalityHibrid;
                                                  context
                                                      .read<CustomDrawerBloc>()
                                                      .add(
                                                        SelectedCustomDrawerEvent(
                                                          isModalityHibrid:
                                                              isModalityHibrid,
                                                        ),
                                                      );
                                                },
                                                child: CustomCheckBoxButton(
                                                  // index: 4,
                                                  text: 'Hibrido',
                                                  isSelect: isModalityHibrid,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      color: AppColors.lightHover,
                                      thickness: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24, bottom: 12, right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Localização",
                                            style: context.textStyles.textFilter
                                                .copyWith(
                                              fontSize: 16,
                                              color: AppColors.darker,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Container(
                                            height: 32,
                                            width: 268,
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: AppColors.light,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/map-pin.svg",
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                SizedBox(width: 8),
                                                Container(
                                                  width: 200,
                                                  child: Center(
                                                    child: DropdownMenu(
                                                      trailingIcon:
                                                          SizedBox.shrink(),
                                                      inputDecorationTheme:
                                                          InputDecorationTheme(
                                                        alignLabelWithHint:
                                                            true,
                                                        contentPadding:
                                                            EdgeInsets.all(0),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      hintText:
                                                          "Busque uma localidade...",
                                                      textStyle: context
                                                          .textStyles
                                                          .textInterRegular
                                                          .copyWith(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        fontSize: 12,
                                                      ),
                                                      dropdownMenuEntries:
                                                          cityEntries,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                                        context.read<CustomDrawerBloc>().add(
                                              SelectedCustomDrawerEvent(
                                                isRegimeClt: false,
                                                isRegimePj: false,
                                                isModalityRemote: false,
                                                isModalityPresencial: false,
                                                isModalityHibrid: false,
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
                                      onPressed: () {},
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
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
          ),
        ),
      ],
    );
  }
}