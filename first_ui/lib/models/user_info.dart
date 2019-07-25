



class UserInfo
{
    static String _id;
    static String _creatorId;
    static int _serviceProviderType;
    static int _comi;

    static String get id => _id;
    static String get creatorId => _creatorId;
    static int get serviceProviderType => _serviceProviderType;
    static int get comi => _comi;

    static set id(String id)
    {
        _id = id;
    }

    static set createId(String createId)
    {
        createId = createId;
    }

    static set serviceProviderType(int serviceProviderType)
    {
        _serviceProviderType = serviceProviderType;
    }

    static set comi(int comi)
    {
        _comi = comi;
    }

}