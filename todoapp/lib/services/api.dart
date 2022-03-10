import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/services/urls.dart';

class HttpRequests {
  //get all todos
  Future<List<Todo>> getTodos() async {
    // ignore: avoid_print
    print("******* GET TODOS ********");

    Uri uri = Uri.parse(AppUrls.GET_TODOS);
    http.Response response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Todo> todoList =
          body.map((dynamic todo) => Todo.fromJson(todo)).toList();

      return todoList;
    } else {
      throw "Unable to retrieve todos.";
    }
  }

  //add todo
  addTodo(String title, String status) async {
    // ignore: avoid_print
    print("******* ADD TODOS ********");

    Uri uri = Uri.parse(AppUrls.ADD_TODO);

    try {
      http.Response response = await http.post(uri, body: {
        'title': title,
        'status': status,
      });

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        throw "Unable to add todo.";
      }
    } catch (e) {
      print(e);
    }
  }

  //delete todo
  deleteTodo(String id) async {
    // ignore: avoid_print
    print("******* DELETE TODOS ********");

    Uri uri = Uri.parse(AppUrls.DELETE_TODO + id);

    try {
      http.Response response = await http.delete(uri);

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        throw "Unable to delete todo.";
      }
    } catch (e) {
      print(e);
    }
  }

  //update todo
  updateTodo(String id, String title, String status) async {
    // ignore: avoid_print
    print("******* UPDATE TODOS ********");

    Uri uri = Uri.parse(AppUrls.UPDATE_TODO + id);

    try {
      http.Response response = await http.put(uri, body: {
        'title': title,
        'status': status,
      });

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        throw "Unable to update todo.";
      }
    } catch (e) {
      print(e);
    }
  }
}
