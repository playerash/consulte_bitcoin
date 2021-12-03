import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'bitcoin_event.dart';

class BitcoinBloc extends Bloc<BitcoinEvent, String> {
  BitcoinBloc() : super("Esperando") {
    on<BitcoinSendEvent>(_getBitcoin);
  }

  _getBitcoin(BitcoinEvent event, Emitter emit) async {
    Uri url = Uri.parse('https://blockchain.info/ticker');
      var response = await http.get(url);
      var value = jsonDecode(response.body);
      emit(value["BRL"]["last"].toString());
  }

}
