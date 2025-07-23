import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/blocs/docs_page_bloc.dart";
import "package:imzo/features/docs/presentation/mixin/docs_mixin.dart";
import "package:imzo/features/docs/presentation/widgets/docs_item_widget.dart";
import 'package:imzo/features/home/blocs/home_page_bloc.dart';
import "package:imzo/features/home/presentation/mixin/home_mixin.dart";
import "package:imzo/features/main/presentation/pages/widgets/navigation_service.dart";
import "package:imzo/router/app_routes.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class DocsPage extends StatefulWidget {
  const DocsPage({super.key});

  @override
  State<DocsPage> createState() => _PageState();
}

class _PageState extends State<DocsPage> with DocsMixin {


  @override
  Widget build(BuildContext context) => BlocListener<DocsPageBloc, DocsPageState>(
    listener: (BuildContext context, DocsPageState state) async {
      if (currentItems.isEmpty && state.categoryResponse != null) {
        currentItems = state.categoryResponse!;
        filteredItems = currentItems;
      }
    },
    listenWhen: (DocsPageState p, DocsPageState c) => p.status != c.status || p.categoryResponse != c.categoryResponse,
    child: LifecycleAware(
      observer: LifecycleObserver(
        onVisible: (Lifecycle l) {
          context.read<DocsPageBloc>().add(const GetCategoryDocsEvent());
        }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<DocsPageBloc, DocsPageState>(
        buildWhen: (p, n) => p.categoryResponse != n.categoryResponse,
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Документы",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            leading: CustomButton(
              label: Icon(Icons.arrow_back_ios_new, color: navigationStack.isNotEmpty ? AppColors.black : AppColors.opacity),
              width: 100,
              backgroundColor: AppColors.opacity,
              onPressed: navigationStack.isNotEmpty ? navigateBack : null,
            ),
            backgroundColor: AppColors.baseColor.withOpacity(0.08),
            actions: [
              CustomButton(
                width: 70,
                height: 30,
                padding: EdgeInsets.zero,
                shadowEnabled: false,
                backgroundColor: AppColors.opacity,
                onPressed: () {
                  print('ad');
                },
                label: Row(
                  children: [
                    ClipRRect(
                      borderRadius: AppUtils.kBorderRadius16,
                      child: Image.asset(ImagesUrl.icUz, width: 15, height: 15),
                    ),
                    AppUtils.kGap4,
                    const Text('Uz', style: TextStyle(color: AppColors.black),),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 24, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: AppColors.baseColor.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: CustomTextField(
                  hintText: "Поиск здесь",
                  fillColor: Colors.white,
                  controller: searchController,
                  currentFocus: searchFocusNode,
                  prefixIcon: const Icon(Icons.search, color: AppColors.grey,),
                  cursorColor: AppColors.grey2,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(color: Colors.transparent, width: 2),
                  ),
                ),
              ),
              Expanded(
                child: filteredItems.isNotEmpty 
                    ? ListView.separated(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
                        itemBuilder: (_, index) => DocsItemWidget(
                          value: false,
                          onTap: () {
                            final item = filteredItems[index];
                            if (item.children != null && item.children!.isNotEmpty) {
                              searchController.clear();
                              setState(() {
                                navigationStack.add(currentItems);
                                breadcrumbs.add(item);
                                currentItems = item.children!;
                                filteredItems = currentItems;
                              });
                            } else {
                              context.pushNamed(Routes.selectLangDocs);
                            }
                          },
                          title: filteredItems[index].nameUz,
                        ),
                        separatorBuilder: (_, __) => AppUtils.kGap,
                        itemCount: filteredItems.length,
                      )
                    : const Center(
                        child: Text('Hech nima topilmadi...', style: TextStyle(color: AppColors.grey2),),
                      )
                  
              ),
            ],
          ),
        ),
      )
    )
  );
}
