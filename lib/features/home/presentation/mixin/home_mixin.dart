import "package:flutter/cupertino.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/home/presentation/home_page.dart";
import "package:imzo/features/profile/model/user_me_response.dart";

mixin HomeMixin on State<HomePage> {

  late List<CategoryResponse> categoryResponse = [];
  late UserMeResponse userMeResponse = UserMeResponse();

}
