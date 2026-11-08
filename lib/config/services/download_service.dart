import 'package:app/config/api_constants.dart';
import 'package:url_launcher/url_launcher.dart';

/// Download status values (same order as the former flutter_downloader enum,
/// so stored int values and `.index` comparisons keep working).
enum DownloadTaskStatus {
  undefined,
  enqueued,
  running,
  complete,
  failed,
  canceled,
  paused;

  static DownloadTaskStatus fromInt(int value) {
    if (value < 0 || value >= DownloadTaskStatus.values.length) {
      return DownloadTaskStatus.undefined;
    }
    return DownloadTaskStatus.values[value];
  }
}

/// Opens task files in the browser / external app.
/// Works the same on Android, iOS and Web (no background downloader needed).
class DownloadService {
  static Future<void> initialize() async {}

  static String absoluteUrl(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    final base = ApiConstants.baseUrl.endsWith('/')
        ? ApiConstants.baseUrl.substring(0, ApiConstants.baseUrl.length - 1)
        : ApiConstants.baseUrl;
    return url.startsWith('/') ? '$base$url' : '$base/$url';
  }

  static Future<bool> openFile(String url) async {
    final uri = Uri.parse(absoluteUrl(url));
    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }
}
