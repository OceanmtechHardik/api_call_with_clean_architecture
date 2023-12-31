
import 'package:api_call_with_clean_architecture/core/api_client.dart';
import 'package:api_call_with_clean_architecture/features/home/data/datasources/product_data_source.dart';
import 'package:api_call_with_clean_architecture/features/home/domain/repositories/product_remote_repositories.dart';
import 'package:api_call_with_clean_architecture/features/home/domain/usecases/get_product_data.dart';
import 'package:api_call_with_clean_architecture/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../features/home/data/repositories/product_data_repositories_impl.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  //Data source Dependency
  getItInstance.registerLazySingleton<ProductDataSource>(() => ProductDataSourceImpl(client: getItInstance()));

  //Data Repository Dependency
  getItInstance.registerLazySingleton<ProductRemoteRepositories>(
      () => ProductDataRepositoriesImpl(productDataSources: getItInstance()));

  //Usecase Dependency
  getItInstance.registerLazySingleton<GetProductData>(() => GetProductData(userRemoteRepositories: getItInstance()));

  //Cubit Dependency
  getItInstance.registerFactory<HomeCubit>(() => HomeCubit(getProductData: getItInstance()));
}
