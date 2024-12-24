import 'package:get/get.dart';
import '../network/api_call.dart';
import '../network/api_urls.dart';
import '../modal/user_modal.dart';

class ApiController extends GetxController{

  var userList = <Result>[].obs;

  // List initial = [];
  // RxList data= RxList(initial);


  void getUserList(modal) async {
    try{
      var res = await ApiCall.postApiCall(ApiUrls.userDet, modal);
      if(res!=null){
        print("---------------response not null----------");
        UserModal parseRes = UserModal.fromJson(res);
        print(parseRes.message);
        userList.value = parseRes.result??[];
        userList.refresh();

      }
    }catch(err){
      print(err.toString());
    }
  }

  void getNextItems(modal) async {
    try{
      var res = await ApiCall.postApiCall(ApiUrls.userDet, modal);
      if(res!=null){
        print("---------------response not null----------");
        UserModal parseRes = UserModal.fromJson(res);
        print(parseRes.message);
        for(int i=0; i<(parseRes?.result?.length??0); i++){
          userList.value.add(parseRes!.result![i]);
        }
        // userList.value.add(parseRes.result);
        // userList.value = parseRes.result??[];
        userList.refresh();

      }
    }catch(err){
      print(err.toString());
    }
  }


}