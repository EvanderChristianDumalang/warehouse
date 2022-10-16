import 'package:database/model/user.dart';
import 'package:database/screens/authenticate/authenticate.dart';
import 'package:database/screens/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    
    //Return to Home or Authenticate
    if(user == null){
      return const Authenticate();
    }
    else{
      return const Home();
    }

  }
}