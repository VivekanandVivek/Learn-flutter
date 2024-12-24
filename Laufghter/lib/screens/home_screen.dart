import 'package:flutter/material.dart';
import '../controllers/api_controller.dart';
import 'package:get/get.dart';
import '../modal/req_modal.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  ApiController apiController = Get.put(ApiController());
  int pageNumber =0;

  @override
  void initState() {
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent==scrollController.offset){
        fetchNextItem(pageNumber++);
      }

    });
    ReqModal req = ReqModal(pageNumber: pageNumber);
    apiController.getUserList(req);
    super.initState();
  }

  void fetchNextItem(int page){
    if(page==6){
      setState(() {

      });
    }else{
      ReqModal req = ReqModal(pageNumber: page);
      setState(() {
        apiController.getNextItems(req);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          child: Obx(
            ()=> ListView.builder(
              controller: scrollController,
              itemCount: (apiController?.userList?.length??0) +1,
              itemBuilder: (context, int index){
                if(index < (apiController?.userList?.length??0) ){
                  return ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(
                        child: Image.network((apiController.userList?[index]?.firstImage==""?
                        "https://img.freepik.com/premium-vector/error-404-concepts-landing-page_206192-61.jpg?size=626&ext=jpg&ga=GA1.1.1222169770.1702425600&semt=ais":
                        apiController.userList?[index]?.firstImage
                        )??"https://img.freepik.com/premium-vector/error-404-concepts-landing-page_206192-61.jpg?size=626&ext=jpg&ga=GA1.1.1222169770.1702425600&semt=ais"),
                      )

                    ),
                    title: Text(
                        apiController.userList?[index]?.userId?.fullName??""
                    ),
                    subtitle: Text(
                        apiController.userList?[index]?.firstLabel??""
                    ),
                  );
                }else{
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                }

              },
            )
          ),
        ),

      ),
    );
  }
}
