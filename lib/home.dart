import 'package:cipher/affine_cipher_tab.dart';
import 'package:cipher/auto_genesis_cipher.dart';
import 'package:cipher/hill_cipher_tab.dart';
import 'package:cipher/permutation_cipher_tab.dart';
import 'package:cipher/shift_cipher_tab.dart';
import 'package:cipher/vingen_cipher_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("Shift",style: TextStyle(fontSize: 11.5),)),
                Tab(icon: Text("Vingen",style: TextStyle(fontSize: 11.5))),
                Tab(icon: Text("Affine",style: TextStyle(fontSize: 11.5))),
                Tab(icon: Text("Hill",style: TextStyle(fontSize: 11.5))),
                Tab(icon: Text("Autogenesis",style: TextStyle(fontSize: 11.5))),
                Tab(icon: Text("Permutation",style: TextStyle(fontSize: 11.5))),
              ],
            ),
          ),
          body: TabBarView(children: [
            ShiftCipherTab(),
            VingenCipherTab(),
            AffineCipherTab(),
            HillCipherTab(),
            AutoGenesisCipherTab(),
            PermutationCipherTab(),
          ])),
    );
  }
}
