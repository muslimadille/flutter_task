import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task/bloc/user_bloc.dart';
import 'package:flutter_task/models/user.dart';
import 'package:flutter_task/models/user_response.dart';

class UserWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserWidgetState();
  }
}

class _UserWidgetState extends State<UserWidget> {
  @override
  void initState() {
    super.initState();
    bloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<UserResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildUserWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading data from API...",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error occured: $error"),
        ],
      ),
    );
  }

  Widget _buildUserWidget(UserResponse data) {
    User user = data.results[0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(user.picture.large),
          ),
          Text(
            "${_capitalizeFirstLetter(user.name.first)} ${_capitalizeFirstLetter(user.name.last)}",
            style: Theme.of(context).textTheme.title,
          ),
          Text(user.email, style: Theme.of(context).textTheme.subtitle2),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(user.location.street.name,
              style: Theme.of(context).textTheme.bodyText1),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(user.location.city,
              style: Theme.of(context).textTheme.bodyText1),
          Padding(
            padding: EdgeInsets.only(top: 5),
          ),
          Text(user.location.state,
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }

  String _capitalizeFirstLetter(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }
}
