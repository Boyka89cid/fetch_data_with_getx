
import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService
{
  List<UserDetails> ourUsers=[];
  Future fetchUserDetails() async
  {
    final http.Response httpResponse=await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    var jsonData;
    if(httpResponse.statusCode==200)
    {
      jsonData=jsonDecode(httpResponse.body);
      print('jsonData: $jsonData');
      var usersData=jsonData['data'];
      for(var x in usersData)
      {
        UserDetails particularUser=UserDetails(x['id'],x['email'],x['first_name'],x['last_name'],x['avatar']);
        print(x);
        ourUsers.add(particularUser);
      }
      return ourUsers;
    }
    else
      throw Exception("Can't Fetch Data");
  }
}

class UserDetails
{
  int? userID;
  String? emailID,firstName,lastName,avatar;
  UserDetails(int? userID, String? emailID, String? firstName, String? lastName, String? avatar)
  {
    this.userID??=userID;
    this.emailID??=emailID;
    this.firstName??=firstName;
    this.lastName??=lastName;
    this.avatar??=avatar;
  }

}