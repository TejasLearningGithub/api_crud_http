import 'package:flutter/material.dart';
import 'package:http_self_first/model/person.dart';
import 'package:http_self_first/provider/get_provider.dart';
import 'package:http_self_first/screen/create_data.dart';
import 'package:http_self_first/screen/update_data.dart';
import 'package:provider/provider.dart';

class DispData extends StatefulWidget {
  const DispData({super.key});

  @override
  State<DispData> createState() => _DispDataState();
}

class _DispDataState extends State<DispData> {
  List<Person> modelList = [];
  // getMyList() async {
  //   var models =
  //       await Provider.of<GetProvider>(context, listen: false).getData();
  //   modelList = <Person>[];
  //   models.forEach((mymodel) {
  //     setState(() {
  //       var _m = Person();
  //       _m.id = mymodel['id'];
  //       _m.firstName = mymodel['first_name'];
  //       _m.lastName = mymodel['last_name'];
  //       _m.message = mymodel['message'];
  //       modelList.add(_m);
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetProvider>(context, listen: false).getData();
    });

    //getMyList();
  }

  @override
  Widget build(BuildContext context) {
    var res;
    var myGetProvider = Provider.of<GetProvider>(context, listen: false);
    var deleteDataProvider = Provider.of<GetProvider>(context, listen: false);
    var updateDataProvider = Provider.of<GetProvider>(context, listen: false);
    var myCreateProvider = Provider.of<GetProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Available'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<GetProvider>(
              builder: (context, value, child) {
                return Container(
                  height: 510,
                  width: double.maxFinite,
                  child: ListView.builder(
                      itemCount: value.myData.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.blue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.myData[index].id ?? ''),
                                Text(value.myData[index].firstName ?? ''),
                                Text(value.myData[index].lastName ?? ''),
                                Text(value.myData[index].message ?? ''),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => UpdateData(
                                                id: value.myData[index].id,
                                                firstName: value
                                                    .myData[index].firstName,
                                                lastName: value
                                                    .myData[index].lastName,
                                                message:
                                                    value.myData[index].message,
                                              ),
                                            ),
                                          );

                                          // .then((value) => {
                                          //       if (value != null)
                                          //         {
                                          //           // Provider.of<GetProvider>(
                                          //           //         context,
                                          //           //         listen: false)
                                          //           //     .getData(),
                                          //           ScaffoldMessenger.of(
                                          //                   context)
                                          //               .showSnackBar(
                                          //             SnackBar(
                                          //               content: Text(
                                          //                 'Data Has been deleted',
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         },
                                          //     });
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          deleteDataProvider.deleteData(value
                                              .myData[index].id
                                              .toString());
                                          print(
                                            'Data Deleted ${value.myData[index].id}',
                                          );
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                )
                              ],
                            ));
                      }),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateData(),
              )).then((value) => {
                if (value != null)
                  {
                    Provider.of<GetProvider>(context, listen: false).getData(),
                  }
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
