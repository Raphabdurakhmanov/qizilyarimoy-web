import 'package:equatable/equatable.dart';

class MapModel extends Equatable {
  final String key;
  final String value;

  const MapModel({required this.key, required this.value});
  @override
  List<Object?> get props => [key, value];
}
