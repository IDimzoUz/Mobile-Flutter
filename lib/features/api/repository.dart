import 'package:imzo/core/error/failure.dart';
import 'package:imzo/features/auth/data/login/login_user_response.dart';
import 'package:imzo/features/auth/data/login/otp_auth_response.dart';
import 'package:imzo/features/docs/model/contract_tem_category_response.dart';
import 'package:imzo/features/home/model/category_response.dart';
import '../../core/either/either.dart';

abstract class Repository{
const Repository();

  Future<Either<Failure, LoginResponse>> login({required String phone});
  Future<Either<Failure, OtpAuthResponse>> otpAuth({required String code});
  Future<Either<Failure, List<CategoryResponse>>> getCategories();
  Future<Either<Failure, List<ContractTemplatesCategoryResponse>>> getContractTemplatesCategory({required int id});

}