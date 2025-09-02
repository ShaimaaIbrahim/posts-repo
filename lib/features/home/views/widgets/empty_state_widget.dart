import 'package:flutter/cupertino.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Image.asset("assets/empty.png", width: 200, height: 200, fit: BoxFit.contain),
    );
  }
}
