import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gas_pod/models/gas.dart';

import '../models/usermodel.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference gasData = FirebaseFirestore.instance.collection(
                                      'gasData');

  Future updateUserData( double? gaslvl, double? leaklvl, ) async{
    return await gasData.doc(uid).set({

      'gaslvl'      : gaslvl,
      'leaklvl'     : leaklvl,

    });
  }

  //gas list from a snapshot
  List<Gas> _gaslistfromsnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Gas(
          gaslvl: doc.get('gaslvl') ?? -1,
          leaklvl: doc.get('leaklvl') ?? -1,
      );
    }).toList();
  }


  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      gaslvl: snapshot['gaslvl'],
      leaklvl: snapshot['leaklvl'],

    );
  }

  //get brews stream
  Stream<List<Gas>> get gasdata{
    return gasData.snapshots()
    .map(_gaslistfromsnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData{
    return gasData.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

}