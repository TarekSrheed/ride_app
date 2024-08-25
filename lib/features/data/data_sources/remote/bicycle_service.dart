



import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';

abstract class BicycleService  extends CoreService{
  BicycleService(super.dio);

  Future<bool> getAllBicycle();
}

class BicycleServiceImp extends BicycleService{
  BicycleServiceImp(super.dio);

  @override
  Future<bool> getAllBicycle()async {
   try {
     response = await dio.get('${AppString().BASEURL}/bicycle');
     return true;
   } catch (e) {
     return false;
   }
  }
}