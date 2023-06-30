import 'package:flutter/cupertino.dart';
import 'package:http_self_first/data/repository.dart';
import 'package:http_self_first/model/person.dart';

class GetProvider with ChangeNotifier {
  var repository = Repository();

  List<Person> myList = [];
  List<Person> get myData => myList;

  List<Person> myPerson = [];
  List<Person> get myPersonGetter => myPerson;

  Person? myPersonUpdate;
  Person? get myPersonUpdateGetter => myPersonUpdate;

  Person? myPersonCreate;
  Person? get myPersonCreateGetter => myPersonCreate;

  Future<List<Person>> getData() async {
    myList = (await repository.getData())!;
    notifyListeners();
    return myList;
  }

  Future deleteData(String id) async {
    // myPerson = await repository.deleteData(id);
    await repository.deleteData(id);
    notifyListeners();
    getData();
    notifyListeners();
    // return myPerson;
  }

  Future<Person?> updateData(
      String id, String firstName, String lastName, String message) async {
    myPersonUpdate =
        await repository.updateData(id, firstName, lastName, message);
    notifyListeners();
    getData();
    notifyListeners();
    return myPersonUpdate;
  }

  Future<Person?> createData(
      String firstName, String lastName, String message) async {
    myPersonCreate = await repository.createData(firstName, lastName, message);
    notifyListeners();
    getData();
    notifyListeners();
    return myPersonCreate;
  }
}
