import 'dart:convert';

GetUser userFromJson(String str) => GetUser.fromJson(
      json.decode(str),
    );

class GetUser {
  String context;
  String contextId;
  String contextType;
  User user;

  @override
  String toString() {
    return '{context: $context, contextId: $contextId, contextType: $contextType, user: ${user.toString()}}';
  }

  GetUser({
    required this.context,
    required this.contextId,
    required this.contextType,
    required this.user,
  });

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser(
      context: json['@context'],
      contextId: json['@id'],
      contextType: json['@type'],
      user: User.fromJson(json['hydra:member'][0]),
    );
  }
}

class User {
  String contextId;
  String contextType;
  int id;
  String email;
  String name;
  String imagePath;

  User({
    required this.contextId,
    required this.contextType,
    required this.id,
    required this.email,
    required this.name,
    required this.imagePath,
  });

  factory User.fromJson(dynamic json) {
    return User(
      contextId: json['@id'],
      contextType: json['@type'],
      id: json['id'],
      email: json['email'],
      name: json['name'],
      imagePath: json['imagePath'],
    );
  }

  @override
  String toString() {
    return '{@contextId: $contextId, contextType: $contextType, id: $id, email: $email, name: $name, imagePath: $imagePath}';
  }
}

GetUser getUserInit() {
  return GetUser(context: '', contextId: '', contextType: '', user: userInit());
}

User userInit() {
  return User(contextId: '', contextType: '', email: '', id: 0, name: '', imagePath: '');
}
