import 'package:flutter/material.dart';
import 'package:satsang_app/services/api_service.dart';
import 'package:satsang_app/models/channel_model.dart';
import 'package:satsang_app/shared/loading.dart';
import 'package:satsang_app/widgets/channel_description.dart';

class Satsangs extends StatefulWidget {
  const Satsangs({Key? key}) : super(key: key);

  @override
  State<Satsangs> createState() => _SatsangsState();
}

class _SatsangsState extends State<Satsangs> {
  Channel? channel1;
  Channel? channel2;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    setState(() => isLoading = true);
    Channel chanel1 = await APIService.instance
        .fetchChannel(channelId: "UC3gnhko-qhwOdUDh_DcZaAw");
    Channel chanel2 = await APIService.instance
        .fetchChannel(channelId: "UC_nseD9NYQYCiDMy-AfkZfA");
    setState(() {
      channel1 = chanel1;
      channel2 = chanel2;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  child: Text("Popular Satsangs",
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                ChannelDescrip(channel: channel2),
                ChannelDescrip(channel: channel1),
              ],
            ),
          );
  }
}
