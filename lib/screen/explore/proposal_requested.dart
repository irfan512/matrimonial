import 'package:flutter/material.dart';

class ProposalRequest extends StatefulWidget {
  const ProposalRequest({super.key});

  @override
  State<ProposalRequest> createState() => _ProposalRequestState();
}

class _ProposalRequestState extends State<ProposalRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("People that sent proposal to you will appear here"),
      ),
    );
  }
}
