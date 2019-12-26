import 'package:flutter/material.dart';

/// 
/// Use this Mixin to provide data model list to widget
/// e.g:
/// 
/// ```dart
/// class User with MemberMixin {
///  String imageUrl;
///  String firstName; 
///  String lastName;
///
///  User({this.imageUrl, this.firstName, this.lastName});
///
///  @override
///  String avatarUrl() {
///   return imageUrl;
///  }
///
///  @override
///  bool hasAvatar() {
///    return imageUrl != null;
///  }
///
///  @override
///  String initials() {
///    return firstName.substring(0,1)+""+lastName.substring(0,1);
///  }
///
///}
/// ```
///
abstract class MemberMixin {
  factory MemberMixin._() => null;

  bool hasAvatar(); 
  String avatarUrl(); 
  String initials();
}


class Members<T extends MemberMixin> extends StatefulWidget {
  List<T> members;
  double avatarDiameter = 70;
  double leftInset = 15;
  double borderSize = 2;
  Color backgroundColor = Colors.grey;
  Color foregroundColor = Colors.grey;
  Color borderColor = Colors.blueGrey;

  Members({this.members,
   this.avatarDiameter = 50,
   this.leftInset = 15, 
   this.borderSize = 2, 
   this.backgroundColor = Colors.blue, 
   this.foregroundColor = Colors.white, 
   this.borderColor = Colors.blueGrey});

  @override
  State<StatefulWidget> createState() {
    return _MembersState();
  }
}

class _MembersState extends State<Members> {
  GlobalKey stickyKey = GlobalKey();

  ///
  ///Items are being set within stack based on screen width or widget's maxWidth if set.
  ///
  @override
  Widget build(BuildContext context) {
    return Center(
        child: LayoutBuilder(builder: (context, constraints) { 
          double width = MediaQuery.of(context).size.width < constraints.maxWidth ? MediaQuery.of(context).size.width : constraints.maxWidth;
          return Container(
            width: width,
            child: Stack( 
              children: _prepareMembers(context, width)
            )
          );
        }),
      ); 
  }

  ///
  /// Prepares list of avatar circle widgets which are positioned properly 
  /// based on widget width 
  ///
  List<Widget> _prepareMembers(BuildContext context, double width) {
    List<Widget> widgets = [];
    int counter = 0;

    for(MemberMixin member in widget.members) {
      double widthWithNextItem = (widget.avatarDiameter-widget.leftInset)*counter + widget.avatarDiameter;
      if(widthWithNextItem <= width) {
        widgets.add(
          _createCircle(((widget.avatarDiameter-widget.leftInset)*counter).toDouble(), member, "")
        );
        counter++;
      }
    }

    int itemsLeft = widget.members.length-counter+1;
    if(itemsLeft > 1) {
      widgets.add(
        _createCircle(((widget.avatarDiameter-widget.leftInset)*(counter-1)).toDouble(), null, "+"+(itemsLeft).toString())
      );
    }
    
    return widgets;
  }

  ///
  /// Creates avatar circle with proper data. 
  /// 
  Widget _createCircle(double leftInset, MemberMixin member, String text) {
    return Positioned(
      left: leftInset,
      child: 
      CircleAvatar(
        radius: widget.avatarDiameter/2 + widget.borderSize,
        backgroundColor: widget.borderColor,
        child: CircleAvatar(
          radius: widget.avatarDiameter/2,
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.foregroundColor,
          backgroundImage: NetworkImage(member != null && member.hasAvatar() ? member.avatarUrl() : ""),
          child: Text(member != null && !member.hasAvatar() ? member.initials() : text),
        )
      )
    );
  }
}
