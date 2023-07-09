import 'package:flutter/material.dart';
import 'package:satsang_app/models/channel_model.dart';
import 'package:intl/intl.dart';
import 'package:satsang_app/screens/home/satsang_description.dart';

class ChannelDescrip extends StatefulWidget {
  ChannelDescrip({required this.channel, Key? key}) : super(key: key);

  Channel? channel;

  @override
  State<ChannelDescrip> createState() => _ChannelDescripState();
}

class _ChannelDescripState extends State<ChannelDescrip> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SatsangDescrip(channelId:widget.channel!.id.toString() ,)));
          },
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          title: Text(
            "${widget.channel!.title}",
            style: const TextStyle(fontSize: 20.0),
          ),
          subtitle: Text(
            '${NumberFormat.compact().format(int.parse(widget.channel!.subscriberCount.toString()))} Subscribers  •  ${widget.channel!.videoCount} Videos'
          ),
          leading: CircleAvatar(
            radius: 27.0,
              backgroundImage:
                  NetworkImage("${widget.channel!.profilePictureUrl}")),
        ),
      ),
    );

  }
}
