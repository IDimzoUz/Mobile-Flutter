import 'package:imzo/core/error/failure.dart';
import 'package:imzo/features/auth/data/login/login_user_response.dart';
import 'package:imzo/features/auth/data/login/otp_auth_response.dart';
import 'package:imzo/features/docs/model/contract_tem_category_response.dart';
import 'package:imzo/features/docs/model/contract_templates_response.dart';
import 'package:imzo/features/docs/model/create_contracts_response.dart';
import 'package:imzo/features/docs/model/payment_response.dart';
import 'package:imzo/features/docs/model/users_search_response.dart';
import 'package:imzo/features/docs/presentation/select_lang_docs/select_lang_docs_page.dart';
import 'package:imzo/features/history/presentation/model/for_me_history_response.dart';
import 'package:imzo/features/home/model/category_response.dart';
import 'package:imzo/features/home/model/news_response.dart';
import 'package:imzo/features/home/model/notifications_response.dart';
import 'package:imzo/features/profile/model/edit_me_response.dart';
import 'package:imzo/features/profile/model/my_id_access_token_response.dart';
import 'package:imzo/features/profile/model/my_id_me_response.dart';
import 'package:imzo/features/profile/model/user_me_response.dart';
import '../../core/either/either.dart';

abstract class Repository{
const Repository();

  Future<Either<Failure, LoginResponse>> login({required String phone});
  Future<Either<Failure, OtpAuthResponse>> otpAuth({required String code});
  Future<Either<Failure, List<CategoryResponse>>> getCategories();
  Future<Either<Failure, ContractsTemplatesResponse>> getContractsTemplates({required int langId});
  Future<Either<Failure, List<ContractTemplatesCategoryResponse>>> getContractTemplatesCategory({required int id});
  Future<Either<Failure, UserMeResponse>> getUserMe({EditMeResponse? edit});
  Future<Either<Failure, CreateContractsResponse>> createFormalization({required ContractIDModel contractIDModel, required Map<String, String> fieldValues});
  Future<Either<Failure, List<ForMeHistoryResponse>>> getForMeHistory();
  Future<Either<Failure, List<ForMeHistoryResponse>>> getMyCreatedHistory();
  Future<Either<Failure, PaymentResponse>> getPaymentStatus({required int id});
  Future<Either<Failure, String>> sendCreatorApprovalCode({required int id});
  Future<Either<Failure, CreateContractsResponse>> sendVerifyAndApproveAsCreator({required int id, required String code});
  Future<Either<Failure, UsersSearchResponse>> getUsersSearch({required String search});
  Future<Either<Failure, int>> getUnreadCount();
  Future<Either<Failure, AllNotificationsResponse>> getNotifications();
  Future<Either<Failure, List<NewsResponse>>> getNews();
  Future<Either<Failure, bool>> sendNewsView({required int id});



  // Mark: MyID Apis
  Future<Either<Failure, MyIDAccessTokenResponse>> getMyIDToken({required String code});
  Future<Either<Failure, MyIDMeResponse>> getMyIDMe({required String token});

}