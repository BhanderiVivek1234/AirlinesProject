import 'package:api_example/widgets/DialogueBox.dart';
import 'package:api_example/controller/AirlinesStore.dart';
import 'package:api_example/widgets/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AirlinesStore _airlinesStore;

  @override
  void initState() {
    super.initState();
    _airlinesStore = AirlinesStore();
  }

  Future<void> _onRefresh() async {
    print("on refresh triggered");
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction(
      (p0) => _airlinesStore.errorMsg,
      (p0) {
        showDialogueBox(context, p0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Airlines "),
          actions: [
            Text(
                "Last Updated time\n${DateFormat('HH:mm:ss a').format(_airlinesStore.dateTime)}"),
          ],
        ),
        body: RefreshIndicator(
          displacement: 300,
          onRefresh: _onRefresh,
          child: Container(
            child: _airlinesStore.uiState.when(
              success: (value, status) {
                return buildDataWidget(context, value);
              },
              failure: (error, status) {
                return buildErrorWidget(error);
              },
              initial: () => buildInitialWidget(),
              loading: () {
                return buildLoadingWidget();
              },
            ),
            // child: _airlinesStore.airlines.length == 0
            //     ? Center(child: Text("No Data found"))
            //     : ListView.builder(
            //         scrollDirection: Axis.vertical,
            //         padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
            //         itemCount: _airlinesStore.airlines.length,
            //         itemBuilder: (context, index) =>
            // Card(
            //           elevation: 5.0,
            //           child: ListTile(
            //             leading: Container(
            //                 width: 100,
            //                 child: Image.memory(
            //                   base64.decode(
            //                       _airlinesStore.airlines[index].logo),
            //                   errorBuilder: (context, error, stackTrace) {
            //                     return Text("Image not available");
            //                   },
            //                 )),
            //             title: Text("${_airlinesStore.airlines[index].name}"),
            //             subtitle:
            //                 Text("${_airlinesStore.airlines[index].country}"),
            //             isThreeLine: true,
            //           ),
            //         ),
            //       ),
          ),
        ),
        bottomSheet: ButtonBar(
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _airlinesStore.loadAirline();
                  },
                  child: Text('SEE OTHER AIRLINES')),
            ]),
      ),
      // ),
    );
  }
}
