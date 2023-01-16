import 'package:flutter/material.dart';

class BarcodeDialog extends StatelessWidget {
  const BarcodeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        width: 300,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    "멤버십 바코드",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: const Text("바코드 공간"),
                    ),
                  ),
                  const Text(
                    "1234 4566 1234 4324",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(24)),
                        child: const Text(
                          "TIP",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.red),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "흔들면 멈버십 바코드가 나와요!",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: const <Widget>[],
    );
  }
}
