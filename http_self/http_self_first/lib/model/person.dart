class Person {
  String? firstName;
  String? lastName;
  String? message;
  String? id;

  Person({this.firstName, this.lastName, this.message, this.id});

  Person.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}
