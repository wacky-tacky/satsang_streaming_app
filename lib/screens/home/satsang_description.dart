import 'package:flutter/material.dart';
import 'package:satsang_app/screens/home/video_descp.dart';
import 'package:satsang_app/services/api_service.dart';
import 'package:satsang_app/models/channel_model.dart';
import 'package:satsang_app/models/video_model.dart';
import 'package:satsang_app/shared/loading.dart';

class SatsangDescrip extends StatefulWidget {
  SatsangDescrip({required this.channelId, this.vidId, Key? key})
      : super(key: key);
  String channelId;
  String? vidId;

  @override
  State<SatsangDescrip> createState() => _SatsangDescripState();
}

class _SatsangDescripState extends State<SatsangDescrip> {
  Channel? channel;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    setState(() => isLoading = true);
    Channel chanel =
        await APIService.instance.fetchChannel(channelId: widget.channelId);
    setState(() {
      channel = chanel;
      isLoading = false;
    });
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SatsangDescrip(channelId: widget.channelId),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 140.0,
              image: NetworkImage(video.thumbnailUrl.toString()),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : Scaffold(
            body: SizedBox(
              // width: MediaQuery.of(context).size.width,
              height: 900.0,
              child: ListView.builder(
                itemCount:channel!.videos!.length,
                itemBuilder: (context, index) {
                  Video video = channel!.videos![index];
                  if (index == 0) {
                    return Column(
                      children: [
                        VideoScreen(id: video.id.toString()),
                        const SizedBox(height: 10.0,),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("${video.title}",
                          style: const TextStyle(
                            fontSize: 20.0
                          ),),
                        )

                      ],
                    );
                  } else {
                    video = channel!.videos![index - 1];
                    return _buildVideo(video);
                  }
                },
              ),
            ),
          );
  }
}
