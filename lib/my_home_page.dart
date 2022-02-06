import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:planted/call_service.dart';
import 'package:planted/client/client.dart';
import 'package:planted/druck_chart.dart';
import 'package:planted/ist_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(83, 126, 106, 1),
            bottom: const TabBar(
              indicatorColor: Colors.blueGrey,
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartArea)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
              ],
            ),
            title: const Text('Planted charts'),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                Center(
                  child: Card(
                    color: const Color.fromRGBO(243, 243, 243, 1),
                    shadowColor: Colors.blueGrey,
                    elevation: 10,
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const DruckChart(),
                  ),
                ),
                Center(
                  child: Card(
                    color: const Color.fromRGBO(243, 243, 243, 1),
                    shadowColor: Colors.blueGrey,
                    elevation: 10,
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const IstChart(),
                  ),
                ),
                Center(
                  child: Card(
                    color: const Color.fromRGBO(243, 243, 243, 1),
                    shadowColor: Colors.blueGrey,
                    elevation: 10,
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CallService(ClientService('')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
