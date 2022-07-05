class ModelResgister
{
  late String fullname;
  late String email;
  late  String phone;
  late String uid;
  late String idpassport;
   bool? gendermale;
   String? image;
  late String date_of_birth;
  String? personalAddress="";
  late String clinicname;
  late String clinicaddress;
  late String clinicphone;
   String? certification;
   String? license;
   String? audio;

  ModelResgister({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.uid,
    this.gendermale,
    this.image,
    required this.idpassport,
    required this.date_of_birth,
    this.personalAddress,
    required this.clinicname,
    required this.clinicaddress,
    required this.clinicphone,
    this.certification,
    this.license,
    this.audio,

  });
  ModelResgister.fromjson(Map<String,dynamic> json)
  {
    fullname=json['fullname'];
    email=json['email'];
    phone=json['phone'];
    uid=json['uid'];
    idpassport=json['idpassport'];
    gendermale=json['gendermale'];
    image=json['image'];
    date_of_birth=json['date_of_birth'];
    personalAddress=json['personalAddress'];
    clinicname=json['clinicname'];
    clinicaddress=json['clinicaddress'];
    clinicphone=json['clinicphone'];
    certification=json['certification'];
    license=json['license'];
    audio=json['audio'];

  }
  Map<String,dynamic> tomap()
  {
    return{
      'fullname':fullname,
      'email':email,
      'phone':phone,
      'uid':uid,
      'idpassport':idpassport,
      'image':image,
      'gendermale':gendermale,
      'date_of_birth':date_of_birth,
      'personalAddress':personalAddress,
      'clinicname':clinicname,
      'clinicaddress':clinicaddress,
      'clinicphone':clinicphone,
      'certification':certification,
      'license':license,
      'audio':audio,
    };
  }
}