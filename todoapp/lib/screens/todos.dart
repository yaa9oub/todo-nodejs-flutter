import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/services/api.dart';
import 'package:todoapp/styles/colors.dart';
import 'package:todoapp/styles/text_style.dart';
import 'package:todoapp/widgets/item.dart';
import 'package:todoapp/widgets/item_text_field.dart';

class Todos extends StatefulWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  TextEditingController textController = TextEditingController();
  HttpRequests api = HttpRequests();
  List<Todo> todos = [];
  bool editing = false;
  String id = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        title: const Text(
          "Todo list",
          style: AppTextStyle.titleTextStyle,
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            ItemTextField(
              editing: editing,
              textController: textController,
              onAddButtonClicked: () async {
                if (editing) {
                  var statusCode =
                      await api.updateTodo(id, textController.text, "false");
                  if (statusCode == 200) {
                    textController.text = '';
                    setState(() {
                      editing = false;
                      textController.text = '';
                    });
                  }
                } else {
                  var statusCode =
                      await api.addTodo(textController.text, "false");
                  if (statusCode == 200) {
                    textController.text = '';
                    setState(() {});
                  }
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: api.getTodos(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                  if (snapshot.hasData) {
                    todos = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(top: 0.0)
                                  : const EdgeInsets.only(top: 8.0),
                              child: Item(
                                title: todos[index].title,
                                status: todos[index].status,
                                onDoneClicked: () async {
                                  var status = !todos[index].status;
                                  await api.updateTodo(todos[index].id,
                                      todos[index].title, status.toString());
                                  setState(() {});
                                },
                                onDeleteClicked: () async {
                                  try {
                                    var statusCode =
                                        await api.deleteTodo(todos[index].id);
                                    if (statusCode == 200) {
                                      textController.text = '';
                                      setState(() {});
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                onEditClicked: () {
                                  setState(() {
                                    editing = true;
                                    id = todos[index].id;
                                  });
                                  textController.text = todos[index].title;
                                },
                              ),
                            );
                          }),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    );
                  }
                }),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
