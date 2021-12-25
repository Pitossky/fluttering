import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_ui/data.dart';
import 'package:instagram_ui/screens/navigation_screen.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCard extends ConsumerWidget {
  final Video video;
  final bool requirePadding;
  final VoidCallback? afterTapping;

  const VideoCard({
    Key? key,
    required this.video,
    this.requirePadding = false,
    this.afterTapping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedVideoProvider.state).state = video;
        ref
            .read(miniPlayerControllerProvider.state)
            .state
            .animateToHeight(state: PanelState.MAX);
        if(afterTapping != null) afterTapping!();
      },
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: requirePadding ? 12.0 : 0,
                ),
                child: Image.network(
                  video.thumbnailUrl,
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: requirePadding ? 20.0 : 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: Text(
                    video.duration,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => print("Navigate to profile"),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                      video.author.profileImageUrl,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 15.0,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      Flexible(
                        child: Text(
                          '${video.author.username} • ${video.viewCount} views • '
                          '${timeago.format(video.timestamp)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 14.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_vert,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
