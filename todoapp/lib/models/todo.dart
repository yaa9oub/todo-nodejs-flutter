class Todo {
  late String id;
  late String title;
  late bool status;

  Todo({required this.title, required this.status, required this.id});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      status: json['status'],
    );
  }
}
