import 'package:code_structure/core/others/base_view_model.dart';

class TimelineViewModel extends BaseViewModel {
  List<String> videoUrls = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ];

  Map<String, String> videoThumbnails = {
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4':
        'https://img.youtube.com/vi/aqz-KE-bpKQ/maxresdefault.jpg',
  };
}
