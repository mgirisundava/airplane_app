import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id, email, name, hobby;
  final int? balance;

  const UserModel({this.id, this.email, this.name, this.hobby, this.balance});

  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
