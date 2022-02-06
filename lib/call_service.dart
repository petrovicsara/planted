import 'package:flutter/material.dart';
import 'package:planted/client/client.dart';
import 'package:planted/proto/planted.pb.dart';

class CallService extends StatefulWidget {
  final ClientService service;
  const CallService(this.service);

  @override
  _CallServiceState createState() => _CallServiceState();
}

class _CallServiceState extends State<CallService> {
  TextEditingController controller = TextEditingController();
  Message message = Message();
  String slogan = '';

  void initState() {
    super.initState();
    message = Message();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        const Text(
          'Our products for every taste!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(83, 126, 106, 1),
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Find out some of our slogans: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(108, 78, 92, 1.0),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'meat',
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: const ButtonStyle(
              //backgroundColor: ,
              ),
          child: const Text("Go!"),
          onPressed: () {
            widget.service.sendMessage(controller.text).then((String body) {
              setState(() {
                slogan = body;
              });
            });
          },
        ),
        const SizedBox(height: 50),
        Center(
          child: Text(
            slogan,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(108, 78, 92, 1.0),
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
