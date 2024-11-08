import 'package:extract_text_from_audio_and_video/features/home/data/apis/home_api_service.dart';
import 'package:extract_text_from_audio_and_video/features/home/data/repo/home_repo.dart';
import 'package:extract_text_from_audio_and_video/features/login/logic/cubit/login_cubit.dart';
import 'package:extract_text_from_audio_and_video/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/home/logic/cubit/get_all_extracted_text_files_cubit.dart';
import '../../features/home/logic/cubit/upload_file_cubit.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../network/api_service.dart';
import '../network/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<UploadFileCubit>(() => UploadFileCubit(getIt()));
  getIt.registerFactory<GetAllExtractedTextFilesCubit>(
      () => GetAllExtractedTextFilesCubit(getIt()));
}
