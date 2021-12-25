import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_ui/data.dart';
import 'package:instagram_ui/widgets/export.dart';
import 'package:miniplayer/miniplayer.dart';

import 'navigation_screen.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          controller: _scrollController,
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, child) {
                  final selectedVideo =
                      ref.watch(selectedVideoProvider.state).state;
                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              selectedVideo!.thumbnailUrl,
                              height: 220.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              iconSize: 30.0,
                              onPressed: () => ref
                                  .read(miniPlayerControllerProvider.state)
                                  .state
                                  .animateToHeight(state: PanelState.MIN),
                              icon: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.red,
                          ),
                        ),
                        VideoInformation(video: selectedVideo),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final getVideo = suggestedVideos[index];
                  return VideoCard(
                    video: getVideo,
                    requirePadding: true,
                    afterTapping: () => _scrollController!.animateTo(
                      0,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      curve: Curves.easeIn,
                    ),
                  );
                },
                childCount: suggestedVideos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
