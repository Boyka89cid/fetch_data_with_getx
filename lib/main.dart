import 'package:fetch_data_with_getx/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {runApp(GetMaterialApp(home: Home()));}

class Home extends StatelessWidget
{
  final MyController getXController=Get.put(MyController());

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Products'),
        centerTitle: true
      ),
      body: Obx(()
      {
        if(getXController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
              itemCount: getXController.users.length,
              itemBuilder: (context,index)
              {
                return ListTile(
                  title: Text('${getXController.users[index].firstName}  ${getXController.users[index].lastName}'),
                  subtitle: Text('${getXController.users[index].avatar}'),
                  trailing: Text('${getXController.users[index].emailID}'),
                );
              });
      }
      ),
    );
  }

}