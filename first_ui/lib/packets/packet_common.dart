


enum e_packet_type
{
  none,

  c2s_echo,
  s2c_echo,

  c2s_upload_file,
  s2c_upload_file,

  c2s_login,
  s2c_login,
}




class PacketCommon
{
  e_packet_type _type = e_packet_type.none;
  int _size;

  e_packet_type get type => _type;
  int get size => _size;

  set type(e_packet_type type)
  {
    _type = type;
  }

  set size(int size)
  {
    _size = size;
  }
}