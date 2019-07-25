
enum e_social_provider_type
{
    none,
    google,
    facebook,
    twitter,
}


class UserInfo
{
    static String _id;
    static String _creatorId;
    static e_social_provider_type _socialProviderType;
    static int _comi;

    static String get id => _id;
    static String get creatorId => _creatorId;
    static e_social_provider_type get socialProviderType => _socialProviderType;
    static int get comi => _comi;

    static set id(String id)
    {
        _id = id;
    }

    static set createId(String createId)
    {
        createId = createId;
    }

    static set socialProviderType(e_social_provider_type socialProviderType)
    {
        _socialProviderType = socialProviderType;
    }

    static set comi(int comi)
    {
        _comi = comi;
    }

}