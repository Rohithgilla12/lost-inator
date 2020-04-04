import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lost_inator/src/models/app_state.dart';
import 'package:redux/redux.dart';

class UploadURLContainer extends StatelessWidget {
  const UploadURLContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) => store.state.downloadUrl,
      builder: builder,
    );
  }
}
