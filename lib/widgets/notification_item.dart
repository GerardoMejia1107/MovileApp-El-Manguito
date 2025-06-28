import 'package:flutter/material.dart';

class NotificationItem extends StatefulWidget {
  final String icono;
  final String sms;
  final String reaction;

  const NotificationItem({Key? key, required this.icono, required this.sms, required this.reaction})
    : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 100,
      width: screenWidth / 2.5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Notificación"),
                    content: Padding(
                      padding: EdgeInsets.only(
                        left: 0.0,
                        right: 0.0,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(widget.icono, height: 150, width: 150),
                          SizedBox(height: 10),
                          Text(widget.sms),
                          SizedBox(height: 10),
                          Text(widget.reaction),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cerrar"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Card(
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.icono, height: 50, width: 50),
                ),
                Text(widget.sms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
