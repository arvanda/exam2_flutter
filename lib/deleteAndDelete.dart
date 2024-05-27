import 'package:flutter/material.dart';
import 'package:flutter_exam_2/models/editdelete.dart';

class AddAndDeleteScreen extends StatefulWidget {
  @override
  _AddAndDeleteScreenState createState() => _AddAndDeleteScreenState();
}

class _AddAndDeleteScreenState extends State<AddAndDeleteScreen> {
  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add and Delete'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: _todoService.fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: TodoActions(
                    onDelete: () => _deleteTodo(todo.id),
                    onAdd: _addTodo,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _deleteTodo(int id) async {
    try {
      await _todoService.delete(id);
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to delete todo: $e'),
      ));
    }
  }

  Future<void> _addTodo() async {
    try {
      await _todoService.add();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add todo: $e'),
      ));
    }
  }
}

class TodoActions extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onAdd;

  const TodoActions({
    required this.onDelete,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onAdd,
        ),
      ],
    );
  }
}
