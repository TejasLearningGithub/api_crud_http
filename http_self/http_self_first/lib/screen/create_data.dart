import 'package:flutter/material.dart';
import 'package:http_self_first/provider/get_provider.dart';
import 'package:provider/provider.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var _formKey = GlobalKey<FormState>();
  var idController = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var createProvider = Provider.of<GetProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: firstName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: lastName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: message,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter value';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var myResult = createProvider.createData(
                        firstName.text, lastName.text, message.text);
                    //print('Data Created');
                    Navigator.pop(context, myResult);
                    // Provider.of<GetProvider>(context, listen: false).getData();
                  }
                },
                child: Text(
                  'Create Data',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
