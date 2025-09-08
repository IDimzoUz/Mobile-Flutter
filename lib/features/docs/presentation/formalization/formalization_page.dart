import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart";
import "package:imzo/core/extension/custom_snackbar/top_snack_bar.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_phone_text_field.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/docs/blocs/formalization/formalization_bloc.dart";
import "package:imzo/features/docs/model/users_search_response.dart";
import "package:imzo/features/docs/presentation/select_lang_docs/select_lang_docs_page.dart";
import "package:imzo/features/docs/presentation/widgets/docs_item_widget.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/router/app_routes.dart";

class FormalizationPage extends StatefulWidget {
  const FormalizationPage({super.key, this.contractIDModel});
  final ContractIDModel? contractIDModel;
  @override
  State<FormalizationPage> createState() => _PageState();
}

class _PageState extends State<FormalizationPage> {

  final TextEditingController _controllerPassportID = TextEditingController();
  final TextEditingController _controllerBirthday = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerPhoneNumber2 = TextEditingController();
  final TextEditingController _controllerPhoneNumber3 = TextEditingController();
  late List<String> phoneList = [];
  final int _maxLength = 10;


  @override
  void initState() {
    super.initState();
    _controllerBirthday.addListener(_applyMask);
  }

  void _applyMask() {
    final text = _controllerBirthday.text.replaceAll(RegExp(r'[^\d]'), '');
    String masked = '';

    for (int i = 0; i < text.length; i++) {
      if (i == 4) masked += '-';
      if (i == 6) masked += '-';
      if (i < 8) masked += text[i];
    }

    if (masked != _controllerBirthday.text) {
      _controllerBirthday.value = TextEditingValue(
        text: masked,
        selection: TextSelection.collapsed(offset: masked.length),
      );
    }
  }

  String returnErrorText() {
    if (_controllerPassportID.text.isEmpty) {
      return "Passport ID raqamini kiriting.";
    } else if (_controllerBirthday.text.isEmpty) {
      return "Tug'ilgan sanani kiriting.";
    } else if (_controllerPhoneNumber.text.isEmpty || _controllerPhoneNumber.text.length != 12) {
      return _controllerPhoneNumber.text.isEmpty ? "Telefon raqamni kiriting." : "Telefon raqamni to'liq kiriting.";
    } else {
      return "";
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _controllerBirthday.text = _formatDate(picked);
      });
    }
  }

  @override
  void dispose() {
    _controllerPassportID.dispose();
    _controllerBirthday.dispose();
    _controllerPhoneNumber.dispose();
    _controllerPhoneNumber2.dispose();
    _controllerPhoneNumber3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<FormalizationBloc, FormalizationState>(
    buildWhen: (p, n) => p.usersSearchResponse != n.usersSearchResponse,
    builder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Оформление",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        backgroundColor: AppColors.baseColor.withOpacity(0.08),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 34),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Информация о получателе заявки',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    AppUtils.kGap6,
                    const Text(
                      'Введите данные получателя заявки!',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        color: AppColors.grey2
                      ),
                    ),
                    AppUtils.kGap16,
                    CustomTextField(
                      hintText: "AD12312323",
                      controller: _controllerPassportID,
                      fillColor: AppColors.baseColor.withOpacity(0.08),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SvgPicture.asset(SvgIcons.icScan),
                      ),
                      cursorColor: AppColors.grey2,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.baseColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.baseColor),
                      ),
                      onChanged: (value) {
                        if (value.length >= 9) context.read<FormalizationBloc>().add(GetUsersSearchEvent(search: _controllerPassportID.text));
                      },
                    ),
                    AppUtils.kGap12,
                    CustomTextField(
                      hintText: "2000-12-12",
                      controller: _controllerBirthday,
                      fillColor: AppColors.baseColor.withOpacity(0.08),
                      textInputType: TextInputType.number,
                      suffixIcon: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: const Icon(Icons.calendar_today_rounded, color: AppColors.baseColor),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8), // 8 ta raqam (YYYYMMDD)
                      ],
                      cursorColor: AppColors.grey2,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.baseColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.baseColor),
                      ),
                      onChanged: (value) { },
                    ),
                    AppUtils.kGap12,
                    Text(
                      (state.usersSearchResponse?.found ?? false) ? "${state.usersSearchResponse?.firstName} ${state.usersSearchResponse?.lastName}" : state.usersSearchResponse?.message ?? "",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: (state.usersSearchResponse?.found ?? false) ? AppColors.black : AppColors.red
                      ),
                    ),
                    AppUtils.kGap12,
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.baseColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.baseColor)
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '+998*',
                              style: TextStyle(
                                fontSize: 15
                              ),
                            ),
                          ),
                          Flexible(
                            child: CustomPhoneTextField(
                              hintText: "99 123 45 67",
                              controller: _controllerPhoneNumber,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.opacity),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppUtils.kGap12,
                    if (phoneList.isNotEmpty) Container(
                        decoration: BoxDecoration(
                          color: AppColors.baseColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.baseColor)
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                '+998 ',
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                            ),
                            Flexible(
                              child: CustomPhoneTextField(
                                controller: _controllerPhoneNumber2,
                                hintText: "99 123 45 67",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: AppColors.opacity),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (phoneList.isNotEmpty) AppUtils.kGap12,
                    if (phoneList.length == 2) Container(
                      decoration: BoxDecoration(
                          color: AppColors.baseColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.baseColor)
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '+998 ',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ),
                          Flexible(
                            child: CustomPhoneTextField(
                              controller: _controllerPhoneNumber3,
                              hintText: "99 123 45 67",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.opacity),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (phoneList.length == 2) AppUtils.kGap12,
                    if (phoneList.length == 2) const SizedBox() else CustomButton(
                      width: double.infinity,
                      backgroundColor: AppColors.baseColor.withOpacity(0.08),
                      onPressed: () {
                        if (phoneList.isEmpty || phoneList.length == 1) {
                          phoneList.add('Phone ${phoneList.length}');
                        }
                        setState(() {});
                      },
                      label: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle_outline_sharp, color: AppColors.baseColor),
                          AppUtils.kGap4,
                          Text(
                            'Raqam qo\'shish',
                            style: TextStyle(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: CustomButton(
          width: double.infinity,
          label: const Text('Отправить'),
          onPressed: () {
            if (_controllerPassportID.text.isNotEmpty && _controllerBirthday.text.isNotEmpty && _controllerPhoneNumber.text.isNotEmpty && _controllerPhoneNumber.text.length == 12) {
              widget.contractIDModel?.passportID = _controllerPassportID.text;
              widget.contractIDModel?.dateBirthDay = _controllerBirthday.text;
              widget.contractIDModel?.recipientPhoneNumber = "+998${_controllerPhoneNumber.text.replaceAll(" ", "")}";
              widget.contractIDModel?.recipientPhoneNumber2 = _controllerPhoneNumber2.text.isNotEmpty ? "+998${_controllerPhoneNumber2.text.replaceAll(" ", "")}" : "";
              widget.contractIDModel?.recipientPhoneNumber3 = _controllerPhoneNumber3.text.isNotEmpty ? "+998${_controllerPhoneNumber3.text.replaceAll(" ", "")}" : "";
              context.pushNamed(Routes.createFormalizationPage, extra: widget.contractIDModel);
            } else {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  boxShadow: const [BoxShadow(color: AppColors.grey2, blurRadius: 2, offset: Offset(0, 0))],
                  icon: const Icon(Icons.close, color: AppColors.red,),
                  message: returnErrorText(),
                ),
              );
            }
          },
        ),
      ),
    )
  );
}
