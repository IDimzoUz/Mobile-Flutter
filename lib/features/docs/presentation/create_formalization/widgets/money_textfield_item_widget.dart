import 'package:flutter/material.dart';
import 'package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:imzo/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';

class MoneyTextFieldItemWidget extends StatefulWidget {
  const MoneyTextFieldItemWidget({super.key, this.fields, required this.data, this.controller});
  final Fields? fields;
  final Function(String dataText) data;
  final TextEditingController? controller; // ✅ Controller tashqaridan
  @override
  State<MoneyTextFieldItemWidget> createState() => MoneyTextFieldItemWidgetState();
}

class MoneyTextFieldItemWidgetState extends State<MoneyTextFieldItemWidget> {

  late TextEditingController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    // Tashqaridan controller berilsa, uni ishlat, yo'q bo'lsa yangi yarat
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Faqat o'zimiz yaratgan controller'larni dispose qilamiz
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void validate() {
    final currentText = _controller.text; // Qiymatni oldin saqlab olamiz
    if ((widget.fields?.required ?? false) && currentText.trim().isEmpty) {
      setState(() => _isError = true);
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          boxShadow: const [BoxShadow(color: AppColors.grey2, blurRadius: 2, offset: Offset(0, 0))],
          icon: const Icon(Icons.close, color: AppColors.red,),
          message: "${widget.fields?.name}ni kiritmadiz!",
        ),
      );
    } else {
      setState(() => _isError = false);
      widget.data(currentText);
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
      CustomTextField(
        controller: _controller,
        hintText: widget.fields?.placeholder ?? "",
        fillColor: AppColors.white,
        textInputType: TextInputType.number,
        cursorColor: AppColors.baseColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.baseColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _isError ? AppColors.red : AppColors.baseColor),
        ),
        onChanged: (_) {
          if (_isError) {
            setState(() {
              _isError = false;
            });
          }
        },
      ),
      AppUtils.kGap8,
    ],
  );
}