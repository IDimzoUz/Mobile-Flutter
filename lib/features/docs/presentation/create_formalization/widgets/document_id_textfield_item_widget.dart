import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart';
import 'package:imzo/core/extension/custom_snackbar/top_snack_bar.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:intl/intl.dart';

class DocumentIdTextFieldItemWidget extends StatefulWidget {
  const DocumentIdTextFieldItemWidget({super.key, this.fields});
  final Fields? fields;
  @override
  State<DocumentIdTextFieldItemWidget> createState() => _PageState();
}

class _PageState extends State<DocumentIdTextFieldItemWidget> {

  final TextEditingController _controller = TextEditingController();
  bool _isError = false;

  void validate() {
    if ((widget.fields?.required ?? false) && _controller.text.trim().isEmpty) {
      setState(() {
        _isError = true;
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            icon: const Icon(Icons.close, color: AppColors.red,),
            message: "${widget.fields?.name}ni kiritmadiz!",
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
      CustomTextField(
        controller: _controller,
        hintText: widget.fields?.placeholder ?? "",
        fillColor: AppColors.white,
        cursorColor: AppColors.baseColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.baseColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.baseColor),
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