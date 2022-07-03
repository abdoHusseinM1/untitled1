import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/officer.dart';
import 'package:untitled/notifiers/officer_details_notfier.dart';
import 'package:untitled/shared/components/components.dart';

class OfficerDetails extends StatefulWidget {
  const OfficerDetails({Key? key, required this.officer}) : super(key: key);
  final Officer officer;

  @override
  _OfficerDetailsState createState() => _OfficerDetailsState();
}

class _OfficerDetailsState extends State<OfficerDetails> {
  @override
  Widget build(BuildContext context) {
    OfficerDetailsNotifier notifier =
        Provider.of<OfficerDetailsNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.officer.fullName}'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          const Expanded(child: SizedBox()),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(child: SizedBox()),
              getDetailRow(
                  text1: 'Name : ', text2: '${widget.officer.fullName}'),
              const SizedBox(height: 10),
              widget.officer.isAccepted!
                  ? getDetailRow(
                      text1: 'Role : ',
                      text2: widget.officer.isAdmin! ? 'Admin' : 'Liberian')
                  : const SizedBox(height: 0),
              const SizedBox(height: 10),
              getDetailRow(
                  text1: 'Address : ', text2: '${widget.officer.address}'),
              const SizedBox(height: 10),
              getDetailRow(text1: 'Email : ', text2: '${widget.officer.email}'),
              const SizedBox(height: 20),
              getButtonSheet(
                isAdmin: widget.officer.isAdmin!,
                isBlocked: widget.officer.isBlocked!,
                isAccepted: widget.officer.isAccepted!,
                id: widget.officer.id!,
                notifier: notifier,
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget getButtonSheet({
    required bool isAccepted,
    required bool isBlocked,
    required bool isAdmin,
    required OfficerDetailsNotifier notifier,
    required int id,
  }) {
    return Row(
      children: [
        isBlocked
            ? getSmallOriginalButton(
                text: 'Un Block', onPressed: () {}, context: context)
            : getSmallOriginalButton(
                text: 'Block',
                onPressed: () {
                  notifier.blockOfficer(id, context);
                },
                context: context,
                color: Colors.red),
        const SizedBox(
          width: 10,
        ),
        !isAccepted
            ? getSmallOriginalButton(
                text: 'Accept',
                onPressed: () {
                  notifier.acceptOfficer(id, context);
                },
                context: context)
            : const SizedBox(
                height: 0,
                width: 0,
              ),
        getButton(
          isAccepted: isAccepted,
          isBlocked: isBlocked,
          isAdmin: isAdmin,
          notifier: notifier,
          id: id,
        ),
      ],
    );
  }

  Widget getButton({
    required bool isAccepted,
    required bool isBlocked,
    required bool isAdmin,
    required OfficerDetailsNotifier notifier,
    required int id,
  }) {
    if (isAccepted) {
      if (!isAdmin) {
        return getSmallOriginalButton(
            text: 'Make Admin',
            onPressed: () {
              notifier.makeAdmin(id, context);
            },
            context: context);
      } else {
        return getSmallOriginalButton(
            text: 'Make Liberian',
            onPressed: () {
              notifier.makeLiberian(id, context);
            },
            context: context);
      }
    }

    return const SizedBox(
      height: 0,
      width: 0,
    );
  }
}
