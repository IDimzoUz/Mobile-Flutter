import "dart:developer";
import "dart:io";
import "package:dio/dio.dart";
import "package:imzo/constants/constants.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/error/server_error.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/data/login/login_user_response.dart";
import "package:imzo/features/auth/data/login/otp_auth_response.dart";
import "package:imzo/features/docs/model/contract_tem_category_response.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/router/app_routes.dart";


class RepositoryImpl implements Repository {
  const RepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<Either<Failure, LoginResponse>> login({required String phone}) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.login,
        data: { "phoneNumber": phone },
      );
      return Right(LoginResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log("Exception occurred -: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred --: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, OtpAuthResponse>> otpAuth({required String code}) async {
    try {
      late String phone = localSource.getPhoneNumber().replaceAll(' ', '');
      final Response response = await dio.post(
        Constants.baseUrl + Urls.verify,
        data: {
          "phoneNumber": phone,
          "code": code,
        },
      );
      return Right(OtpAuthResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log("Exception occurred -: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred --: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, List<CategoryResponse>>> getCategories() async {
    try {
      final Response response = await dio.get(
        Constants.baseUrl + Urls.categories,
        options: Options(headers: {
          "Authorization": "Bearer ${localSource.accessToken}",
        }),
      );
      final list = <CategoryResponse>[];
      final data = response.data as List<dynamic>;
      for (final e in data as Iterable) {
        list.add(CategoryResponse.fromJson(e));
      }
      return Right(list);
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, List<ContractTemplatesCategoryResponse>>> getContractTemplatesCategory({required int id}) async {
    try {
      final Response response = await dio.get(
        "${Constants.baseUrl}${Urls.contractTemplatesCategory}/$id",
        options: Options(headers: {
          "Authorization": "Bearer ${localSource.accessToken}",
        }),
      );
      final list = <ContractTemplatesCategoryResponse>[];
      final data = response.data as List<dynamic>;
      for (final e in data as Iterable) {
        list.add(ContractTemplatesCategoryResponse.fromJson(e));
      }
      return Right(list);
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }



}
