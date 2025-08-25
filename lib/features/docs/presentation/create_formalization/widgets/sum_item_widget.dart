import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/inputs/custom_text_field.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/checkbox_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/date_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/description_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/document_id_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/dropdown_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/integer_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/money_textfield_item_widget.dart';
import 'package:imzo/features/docs/presentation/create_formalization/widgets/phone_textfield_item_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SumItemWidget extends StatefulWidget {
  const SumItemWidget({super.key, this.dataSections, required this.dataReturn, this.controller});
  final Sections? dataSections;
  final Function(Map<String, String>) dataReturn;
  final TextEditingController? controller;
  @override
  State<SumItemWidget> createState() => SumItemWidgetState();
}

// class SumItemWidgetState extends State<SumItemWidget> {
class SumItemWidgetState extends State<SumItemWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<String, String> _fieldValues = {};
  void onFieldDataReturn(String id, String text) {
    if (text.isNotEmpty) {
      _fieldValues[id] = text;
    }
    widget.dataReturn(_fieldValues);
  }
  final List<GlobalKey<MoneyTextFieldItemWidgetState>> moneyKeys = [];
  final List<GlobalKey<DocumentIdTextFieldItemState>> documentKeys = [];
  final List<GlobalKey<PhoneTextFieldItemState>> phoneKeys = [];
  final List<GlobalKey<DateTextFieldItemState>> dateKeys = [];
  final List<GlobalKey<DescriptionTextFieldState>> descriptionKeys = [];
  final List<GlobalKey<IntegerTextFieldState>> integerKeys = [];
  final List<GlobalKey<CheckboxItemState>> checkboxKeys = [];
  final List<GlobalKey<DropdownItemState>> dropdownKeys = [];

  void validateAll() {
    for (var key in moneyKeys) {
      key.currentState?.validate();
    }
    for (var key in documentKeys) {
      key.currentState?.validate();
    }
    for (var key in phoneKeys) {
      key.currentState?.validate();
    }
    for (var key in dateKeys) {
      key.currentState?.validate();
    }
    for (var key in descriptionKeys) {
      key.currentState?.validate();
    }
    for (var key in integerKeys) {
      key.currentState?.validate();
    }
    for (var key in checkboxKeys) {
      key.currentState?.validate();
    }
    for (var key in dropdownKeys) {
      key.currentState?.validate();
    }
    widget.dataReturn(_fieldValues);
  }

  @override
  Widget build(BuildContext context) {
    moneyKeys.clear();
    documentKeys.clear();
    phoneKeys.clear();
    dateKeys.clear();
    descriptionKeys.clear();
    checkboxKeys.clear();
    dropdownKeys.clear();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppUtils.kBorderRadius12,
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.2), offset: Offset(0, 0), blurRadius: 5)
          ]
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
      child: Column(
        children: [
          Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                widget.dataSections?.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            itemCount: widget.dataSections?.fields?.length ?? 0,
            itemBuilder: (_, index) {
              late List<Fields>? data = widget.dataSections?.fields;
              data?.sort((a, b) => a.orderIndex?.compareTo(b.orderIndex ?? 0) ?? 0);
              switch (widget.dataSections?.fields?[index].fieldType) {
                case "MONEY":
                  // Pul miqdori uchun
                  final key = GlobalKey<MoneyTextFieldItemWidgetState>();
                  moneyKeys.add(key);
                  return MoneyTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    controller: widget.controller,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "INTEGER":
                  // Butun son
                  final key = GlobalKey<IntegerTextFieldState>();
                  integerKeys.add(key);
                  return IntegerTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "DROPDOWN":
                  // Tanlov ro'yxati
                  final key = GlobalKey<DropdownItemState>();
                  dropdownKeys.add(key);
                  return DropdownItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "CHECKBOX":
                  // Ha/Yo'q
                  final key = GlobalKey<CheckboxItemState>();
                  checkboxKeys.add(key);
                  return CheckboxItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "DATE":
                  // Sana
                  final key = GlobalKey<DateTextFieldItemState>();
                  dateKeys.add(key);
                  return DateTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "DATE_SEPARATE":
                  // Alohida yil, oy, kun
                  final key = GlobalKey<DocumentIdTextFieldItemState>();
                  documentKeys.add(key);
                  return DocumentIdTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "TEXT":
                  // Katta matn
                  final key = GlobalKey<DescriptionTextFieldState>();
                  descriptionKeys.add(key);
                  return DescriptionTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "PHONE":
                  // Telefon raqam
                  final key = GlobalKey<PhoneTextFieldItemState>();
                  phoneKeys.add(key);
                  return PhoneTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "DOCUMENT_ID":
                  // Pasport/JSHSHIR
                  final key = GlobalKey<DocumentIdTextFieldItemState>();
                  documentKeys.add(key);
                  return DocumentIdTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "STRING":
                  // Oddiy matn
                  final key = GlobalKey<DescriptionTextFieldState>();
                  descriptionKeys.add(key);
                  return DescriptionTextFieldItemWidget(
                    fields: data?[index],
                    key: key,
                    data: (text) => onFieldDataReturn("${data?[index].id}", text)
                  );
                case "FILE":
                  // File upload
                  return const SizedBox();
                default: return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}