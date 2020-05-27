import 'package:bhawik/viewmodels/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Text("SPLASH SCREEN WITH LOADING"),
              ),
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(
                  Color(0xff19c7c1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
