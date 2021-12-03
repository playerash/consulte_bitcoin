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
    timer();
    super.initState();
  }

  timer() {
    bloc.add(BitcoinSendEvent());
    Timer(const Duration(seconds: 2), timer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 100,
              child: Image.asset(
                "assets/bitcoin.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: BlocBuilder<BitcoinBloc, String>(
                bloc: bloc,
                builder: (context, state) {
                  return Text(
                    state,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
