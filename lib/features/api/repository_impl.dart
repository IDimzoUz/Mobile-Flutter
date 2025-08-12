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
import "package:imzo/features/docs/model/contract_templates_response.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/profile/model/my_id_access_token_response.dart";
import "package:imzo/features/profile/model/my_id_me_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
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



  @override
  Future<Either<Failure, MyIDAccessTokenResponse>> getMyIDToken({required String code}) async {
    try {
      final Response response = await dio.post(
        'https://devmyid.uz${Urls.myIDAccessToken}',
        options: Options(
          contentType: "application/x-www-form-urlencoded"
        ),
        data: {
          "grant_type": "authorization_code",
          "code": code,
          "client_id": DatabaseKeys.myIDClientId,
          "client_secret": DatabaseKeys.myIDClientSecret,
        },
      );
      return Right(MyIDAccessTokenResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log("Exception occurred -: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred --: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }


  @override
  Future<Either<Failure, MyIDMeResponse>> getMyIDMe({required String token}) async {
    try {
      final Response response = await dio.get(
        'https://devmyid.uz${Urls.myIDUsersMe}',
        options: Options(
          headers: {
            "Authorization": "Bearer $token"
          },
          contentType: "application/x-www-form-urlencoded",
        ),
      );
      return Right(MyIDMeResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log("Exception occurred -: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred --: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }


  @override
  Future<Either<Failure, UserMeResponse>> getUserMe({String? firstName, String? lastName, String? email, String? profilePhotoUrl}) async {
    try {
      if (firstName == null || firstName.isEmpty) {
        final Response response = await dio.get(
            Constants.baseUrl + Urls.usersMe,
            options: Options(headers: {
              "Authorization": "Bearer ${localSource.accessToken}",
            }),
        );
        return Right(UserMeResponse.fromJson(response.data));
      } else {
        final Response response = await dio.put(
            Constants.baseUrl + Urls.profile,
            options: Options(headers: {
              "Authorization": "Bearer ${localSource.accessToken}",
            }),
            data: {
              "firstName": firstName,
              "lastName": lastName,
              "email": email,
              "profilePhotoUrl": profilePhotoUrl
            }
        );
        return Right(UserMeResponse.fromJson(response.data));
      }
    } on DioException catch (error, stacktrace) {
      log("Exception occurred -: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred --: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, ContractsTemplatesResponse>> getContractsTemplates({required int langId}) async {
    try {
      final Response response = await dio.get(
        "${Constants.baseUrl}${Urls.contractTemplates}/$langId",
        options: Options(
          headers: {
            "Authorization": "Bearer ${localSource.accessToken}"
          },
        ),
      );
      return Right(ContractsTemplatesResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log("Exception occurred -: $error stacktrace: $stacktrace");
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log("Exception occurred --: $error stacktrace: $stacktrace");
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

}