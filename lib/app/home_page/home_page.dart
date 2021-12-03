import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preco_bitcoin/app/bloc/bitcoin_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = BitcoinBloc();
  @override
  void initState() {
    //bloc.add(BitcoinSendEvent());
    teste();
    super.initState();
  }

  teste() {
    bloc.add(BitcoinSendEvent());
    Timer(Duration(seconds: 2), teste);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset("assets/bitcoin.png"),
            Padding(
              padding: EdgeInsets.all(25),
              child: BlocBuilder<BitcoinBloc, String>(
                bloc: bloc,
                builder: (context, state) {
                  print(state);
                  return Text(state, style: const TextStyle(fontSize: 26),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
