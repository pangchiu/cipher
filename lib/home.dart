import 'package:cipher/affine_cipher_tab.dart';
import 'package:cipher/auto_genesis_cipher.dart';
import 'package:cipher/hill_cipher_tab.dart';
import 'package:cipher/rsa_cipher.dart';

import 'package:cipher/shift_cipher_tab.dart';
import 'package:cipher/transposition_cipher_tab.dart';
import 'package:cipher/vingen_cipher_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool tableMode = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            shadowColor: Colors.blue,
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: Colors.amber,
              labelPadding: EdgeInsets.symmetric(horizontal: 30),
              labelColor: Colors.deepOrangeAccent,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: [
                Tab(
                    icon: Text(
                  "Shift",
                  style: TextStyle(fontSize: 20),
                )),
                Tab(icon: Text("Vingen", style: TextStyle(fontSize: 20))),
                Tab(icon: Text("Affine", style: TextStyle(fontSize: 20))),
                Tab(icon: Text("Hill", style: TextStyle(fontSize: 20))),
                Tab(icon: Text("Autogenesis", style: TextStyle(fontSize: 20))),
                Tab(
                    icon:
                        Text("Transposition", style: TextStyle(fontSize: 20))),
                Tab(icon: Text("RSA", style: TextStyle(fontSize: 20))),
              ],
            ),
          ),
          body: TabBarView(children: [
            ShiftCipherTab(tableMode : tableMode),
            VingenCipherTab(tableMode : tableMode),
            AffineCipherTab(tableMode : tableMode),
            HillCipherTab(tableMode : tableMode),
            AutoGenesisCipherTab(tableMode : tableMode),
            TranspositionCipherTab(tableMode : tableMode),
            RSACipherTab(tableMode : tableMode)
          ])),
    );
  }
}
