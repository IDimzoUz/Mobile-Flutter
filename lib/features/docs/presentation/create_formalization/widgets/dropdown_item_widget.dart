import 'package:flutter/material.dart';
import 'package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:imzo/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/options_checkbox_widget.dart';

class DropdownItemWidget extends StatefulWidget {
  const DropdownItemWidget({super.key, this.fields});
  final Fields? fields;
  @override
  State<DropdownItemWidget> createState() => DropdownItemState();
}

class DropdownItemState extends State<DropdownItemWidget> {

  bool _isError = false;
  bool animatedContainer = false;
  String selectOptions = "Tanlanmagan";
  List<OptionsItem> dataOptions = [];

  @override
  void initState() {
    super.initState();
    if (widget.fields?.options?.isNotEmpty ?? false) {
      for (final element in widget.fields?.options ?? []) {
        dataOptions.add(OptionsItem(name: element));
      }
    }
  }

  void checked(int index) {
    for (final element in dataOptions) {
      element.selectIndex = false;
    }
    selectOptions = dataOptions[index].name ?? "";
    _isError = false;
    animatedContainer = false;
    setState(() { dataOptions[index].selectIndex = !(dataOptions[index].selectIndex); });
  }

  void validate() {
    if ((widget.fields?.required ?? false) && selectOptions == "Tanlanmagan") {
      setState(() {
        _isError = true;
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            boxShadow: const [ BoxShadow(color: AppColors.grey2, blurRadius: 2, offset: Offset(0, 0)) ],
            icon: const Icon(Icons.close, color: AppColors.red,),
            message: "${widget.fields?.name}",
          ),
        );
      });
    } else {
      setState(() {
        _isError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          Flexible(
            child: Text(
              widget.fields?.name ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey2
              ),
            ),
          ),
          Text(
            "*",
            style: TextStyle(
                fontSize: 14,
                color: widget.fields?.required ?? false ? AppColors.red : AppColors.opacity,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
      AppUtils.kGap8,
      GestureDetector(
        onTap: () {
          setState(() {
            animatedContainer = !animatedContainer;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppUtils.kBorderRadius12,
              border: Border.all(color: _isError ? AppColors.red : AppColors.baseColor)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  selectOptions,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 12
                  ),
                ),
              ),
              Icon(animatedContainer ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_right, size: 30, color: AppColors.baseColor.withOpacity(0.7))
            ],
          ),
        ),
      ),
      AnimatedContainer(
        height: animatedContainer ? (dataOptions.length - 1) * 110 : 0,
        duration: const Duration(milliseconds: 10),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataOptions.length,
          itemBuilder: (_, index) {
            return OptionsCheckboxWidget(
              onTap: () => checked(index),
              title: dataOptions[index].name ?? "",
              value: dataOptions[index].selectIndex,
              borderColor: AppColors.lightGrey,
            );
          },
        ),
      ),
      AppUtils.kGap8,
    ],
  );
}