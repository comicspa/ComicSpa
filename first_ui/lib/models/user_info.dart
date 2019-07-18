



class UserInfo
{
    final int serviceProviderType;
    final String nickName;
    final int comi;

    UserInfo({this.serviceProviderType,this.nickName,this.comi});

    factory UserInfo.fromJson(Map<String,dynamic> userInfoMap)
    {
        return UserInfo(
            serviceProviderType: userInfoMap['service_provider_type'],
            nickName: userInfoMap['nick_name'],
            comi: userInfoMap['comi']
        );

    }


    /*
    static Future<UserInfo> fetchUser() async
    {
        final response = await http.get('https://1');
        if (response.statusCode == 200) {

            final userMap = json.decode(response.body);
            return UserInfo.fromJson(userMap);
        }
        throw Exception('failure');
    }
    */



}