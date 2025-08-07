import "package:flutter/cupertino.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/features/home/presentation/home_page.dart";
import "package:imzo/features/profile/presentation/profile_page.dart";

mixin ProfileMixin on State<ProfilePage> {

  late List<ProfileItemModel> noVerifyDataModel = [
    const ProfileItemModel(icon: SvgIcons.icFaq, title: 'FAQ', desc: 'часто задаваемые вопросы', index: 3),
    const ProfileItemModel(icon: SvgIcons.icInformation, title: 'O нас', desc: 'часто задаваемые вопросы', index: 4),
    const ProfileItemModel(icon: SvgIcons.icGlobe, title: 'Выбор языка', desc: 'O\'zbekcha, Узбекский', index: 5),
  ];

  late List<ProfileItemModel> verifyDataModel = [
    const ProfileItemModel(icon: SvgIcons.icPerson, title: 'Аккаунт', desc: 'Ваши данные', index: 0),
    const ProfileItemModel(icon: SvgIcons.icWallet, title: 'История баланса', desc: '', index: 1),
    const ProfileItemModel(icon: SvgIcons.icBell, title: 'Уведомление', desc: '', index: 2),
    const ProfileItemModel(icon: SvgIcons.icFaq, title: 'FAQ', desc: 'часто задаваемые вопросы', index: 3),
    const ProfileItemModel(icon: SvgIcons.icInformation, title: 'O нас', desc: 'часто задаваемые вопросы', index: 4),
    const ProfileItemModel(icon: SvgIcons.icGlobe, title: 'Выбор языка', desc: 'O\'zbekcha, Узбекский', index: 5),
  ];

  late List<ProfileItemModel> dataModel = [];


}
