import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/queue.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_state.dart';
///Constants
final String CLIENT_ID='adfc433ec9af460f91ebb31d17d86827';
final String REDIRECT_URL='http://timondev.site';

///Variables
String userId = '';
Queue queue = Queue();
PlaybackFilter activePbFilter = PlaybackFilter(name: '');

bool remoteConnection = false;
bool checkingCon = false;
late Stream<ConnectionStatus> conStatusBroadcast;
late Stream<PlayerState> playerStateStream;
PlayerState? playerStateCache;
