import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/gas.dart';
import 'UserDetail.dart';


class gaslist extends StatefulWidget {
  const gaslist({Key? key}) : super(key: key);

  @override
  State<gaslist> createState() => _gaslistState();
}

class _gaslistState extends State<gaslist> {
  @override
  Widget build(BuildContext context) {

    final data = Provider.of<List<Gas>>(context);
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container();
        });
  }
}
