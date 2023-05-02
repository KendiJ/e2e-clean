import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final String id;
  final String name;
  
  const Source({
    required this.id,
    required this.name,
  });

  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }


  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] !=null ? map['id'] as String: '',
      name: map['name'] !=null ? map['name'] as String: '',
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Source.fromJson(String source) => Source.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
