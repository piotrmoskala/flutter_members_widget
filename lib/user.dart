import 'package:flutter/material.dart';
import 'package:members_widget/members.dart';

class User with MemberMixin {
  String imageUrl;
  String firstName; 
  String lastName;

  User({this.imageUrl, this.firstName, this.lastName});

  @override
  String avatarUrl() {
    return imageUrl;
  }

  @override
  bool hasAvatar() {
    return imageUrl != null;
  }

  @override
  String initials() {
    return firstName.substring(0,1)+""+lastName.substring(0,1);
  }

}