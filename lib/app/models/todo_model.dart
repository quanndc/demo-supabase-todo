class TodoModel{
  final int id;
  final String name;
  final String? description;
  final bool isDone;
  final DateTime createdAt;
  final DateTime updatedAt;

  TodoModel({
    required this.id,
    required this.name,
    this.description,
    required this.isDone,
    required this.createdAt,
    required this.updatedAt,
  });


  // Factory method to create a TodoModel from a json
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      isDone: json['is_done'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  // Method to convert TodoModel to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_done': isDone,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}