import 'package:flutter/material.dart';
import 'package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:imzo/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/options_checkbox_widget.dart';

class CheckboxItemWidget extends StatefulWidget {
  const CheckboxItemWidget({super.key, this.fields});
  final Fields? fields;
  @override
  State<CheckboxItemWidget> createState() => CheckboxItemState();
}

class CheckboxItemState extends State<CheckboxItemWidget> {

  bool _isError = false;
  String selectOptions = "";
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
    setState(() { dataOptions[index].selectIndex = !(dataOptions[index].selectIndex); });
  }

  void validate() {
    if ((widget.fields?.required ?? false) && selectOptions.isEmpty) {
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
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataOptions.length,
        itemBuilder: (_, index) {
          return OptionsCheckboxWidget(
            onTap: () => checked(index),
            title: dataOptions[index].name ?? "",
            value: dataOptions[index].selectIndex,
            borderColor: _isError ? AppColors.red : AppColors.baseColor,
          );
        },
      ),
      AppUtils.kGap8,
    ],
  );
}