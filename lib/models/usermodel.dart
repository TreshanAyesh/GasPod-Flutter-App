
class UserModel{

  late final String uid;
  UserModel(
       {required this.uid}
      );

}


class UserData{
  final String? uid;

  final double? leaklvl;
  final double? gaslvl;


  UserData({
    required this.uid,

    required this.leaklvl,
    required this.gaslvl,

  });
}