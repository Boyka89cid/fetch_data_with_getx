import 'package:fetch_data_with_getx/api_service.dart';
import 'package:get/get.dart';

class MyController extends GetxController
{
  RxBool isLoading=true.obs;
  RxList users=[].obs;

  @override
  void onInit()
  {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async
  {
    try
        {
          isLoading(true);
          ApiService fetchUserInfo = ApiService();
          var allUsers=await fetchUserInfo.fetchUserDetails();
          if(allUsers!=null)
            users.assignAll(allUsers);
        }
        finally{isLoading(false);}

  }
}