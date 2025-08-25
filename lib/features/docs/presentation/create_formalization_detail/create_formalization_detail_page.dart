import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/docs/blocs/create_formalization_detail/create_formalization_detail_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/router/app_routes.dart";


class CreateFormalizationDetailPage extends StatefulWidget {
  const CreateFormalizationDetailPage({super.key, this.response});
  final CreateContractsResponse? response;
  @override
  State<CreateFormalizationDetailPage> createState() => _PageState();
}

class _PageState extends State<CreateFormalizationDetailPage> {

  @override
  Widget build(BuildContext context) => BlocListener<CreateFormalizationDetailBloc, CreateFormalizationDetailState>(
    listener: (BuildContext context, CreateFormalizationDetailState state) async {

    },
    listenWhen: (CreateFormalizationDetailState p, CreateFormalizationDetailState c) => p.status != c.status,
    child: BlocBuilder<CreateFormalizationDetailBloc, CreateFormalizationDetailState>(
      buildWhen: (p, n) => p.status != n.status,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.response?.templateName ?? "",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppUtils.kGap12,
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(ImagesUrl.icImzoLogo, height: 30, width: 120),
                    ),
                    AppUtils.kGap24,
                    const Text(
                      // widget.response?.filledContent ?? "",
                      "Qarz oldi-berdi shartnomasiTashkent06.03.2025 - yil testdagi test Eshmat Toshimmatov BekberdiyevichBiz Sirdaryo Sayxunobod MFY Ulugbek ko'chasi 1-uyda yashovchi – 1992.05.14da tugʻilgan Eldor Matsapayev Botirovich (pasport AB0908455, Xo‘jayli tumani IIB  tomonidan 13.03.2025da berilgan) bir tomondan (keyingi oʻrinlarda “Qarz beruvchi”) va testda yashovchi –  test yilda tugʻilgan test (pasport test, Qonliko‘l tumani IIB  tomonidan 27.03.2025da berilgan) (keyingi oʻrinlarda “Qarz oluvchi”) ikkinchi tomondan, ushbu shartnomani quyidagilar haqida tuzdik:1. Men – QARZ BERUVCHI test soʻm pul mablagʻini QARZ OLUVCHIga qarz sifatida test muddatga, yaʼni testgacha berdim, men – QARZ OLUVCHI ushbu summani QARZ BERUVCHIdan mazkur shartnoma imzolangunga qadar toʻliq oldim.2. Qarz summasini berish va olish testda amalga oshirildi.3. Men – QARZ OLUVCHI qarzga olgan test soʻm pulni testdan kechiktirmasdan QARZ BERUVCHIGA qaytarib berishga majburman.4. QARZ OLUVCHI yuqorida koʻrsatilgan pulni QARZ BERUVCHIGA shartnomada koʻrsatilgan muddatdan oldin ham qaytarishi mumkin.5. Agar qarz summasi shartnomada koʻrsatilgan muddatda QARZ OLUVCHI tomonidan qaytarilib berilmasa, QARZ BERUVCHI tomon qarz summasini QARZ OLUVCHIdan qonunchilik hujjatlariga muvofiq undirib olishi mumkin.6. Mazkur shartnomani rasmiylashtirish uchun sarflanadigan xarajatlarni QARZ OLUVCHI toʻlaydi.7. Biz taraflar shartnoma matnini toʻliq oʻqib chiqdik, uning mazmuni va mohiyati, huquqiy oqibatlari hamda Oʻzbekiston Respublikasi Fuqarolik kodeksining 732-738-moddalari mazmuni notarius tomonidan tushuntirildi va bizga tushunarli, shartnomaning mazmuni bizning asl xohish-istaklarimizga mos keladi. Mazkur shartnomani tuzib, imzolaganimizda muomala layoqatiga ega boʻlganimizni, oʻz xatti-harakatlarimiz ahamiyatini toʻliq tushunganligimizni, hech kim bizni aldamaganligini, shartnomani tuzib, imzolash haqida zoʻrlamaganligini, tazyiq oʻtkazmaganligini, ushbu bitimni tuzishga majbur qilishga olib kelgan ogʻir holatlar yoʻqligini bildiramiz.8. Mazkur shartnoma taraflar tomonidan uch nusxada tuzilib, imzolandi, ulardan bir nusxasi testxususiy amaliyot bilan shugʻullanuvchi notariusi Eshmat Toshimmatov Bekberdiyevichda saqlanadi, qolgan nusxalari taraflarga berildi.Notariusning tasdiqlov yozuvi.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: CustomButton(
          onPressed: () => context.pushNamed(Routes.selectPaymentVerifyPage, extra: widget.response),
          width: double.infinity,
          label: const Text('Оформление'),
        ),
       ),
      )
    )
  );
}
