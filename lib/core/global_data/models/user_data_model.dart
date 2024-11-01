// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserDataModel extends HiveObject  {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String userEmail;
  UserDataModel({
    required this.userName,
    required this.userEmail,
  });
}
