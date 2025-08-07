import 'package:imzo/core/error/failure.dart';
import 'package:imzo/features/auth/data/login/login_user_response.dart';
import 'package:imzo/features/auth/data/login/otp_auth_response.dart';
import 'package:imzo/features/docs/model/contract_tem_category_response.dart';
import 'package:imzo/features/home/model/category_response.dart';
import 'package:imzo/features/profile/model/my_id_access_token_response.dart';
import 'package:imzo/features/profile/model/my_id_me_response.dart';
import 'package:imzo/features/profile/model/user_me_response.dart';
import '../../core/either/either.dart';

abstract class Repository{
const Repository();

  Future<Either<Failure, LoginResponse>> login({required String phone});
  Future<Either<Failure, OtpAuthResponse>> otpAuth({required String code});
  Future<Either<Failure, List<CategoryResponse>>> getCategories();
  Future<Either<Failure, List<ContractTemplatesCategoryResponse>>> getContractTemplatesCategory({required int id});
  Future<Either<Failure, UserMeResponse>> getUserMe({String? firstName, String? lastName, String? email, String? profilePhotoUrl});

  // Mark: MyID Apis
  Future<Either<Failure, MyIDAccessTokenResponse>> getMyIDToken({required String code});
  Future<Either<Failure, MyIDMeResponse>> getMyIDMe({required String token});

}