import 'package:demo_getx_supabase/app/models/todo_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TodoService {

  Future<List<TodoModel>> getTodo() async {
    try{
      final response = await Supabase.instance.client.from("todos").select("*").order("id", ascending: false);
      if (response is List) {
        return response.map((e) => TodoModel.fromJson(e)).toList();
      } else {
        return [];
      }
    }
    catch(e){
      throw Exception("Error fetching todos");
    }
  }

  Future<void> doneTask(int id, bool value) async {
    try{
      await Supabase.instance.client.from('todos').update({'is_done': value}).eq('id', id);
    }
    catch(e){
      throw Exception("Error updating todo");
    }
  }

  Future<void> deleteTask(int id) async {
    try{
      await Supabase.instance.client.from('todos').delete().eq('id', id);
    }
    catch(e){
      throw Exception("Error updating todo");
    }
  }
}