import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final int id;
  final String name;
  final  bool active;

   const Ingredient({
    required this.id,
    required this.name,
    this.active = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        active,
      ];
}
