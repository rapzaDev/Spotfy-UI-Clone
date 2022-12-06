import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:spotfy_ui_clone/views/Home/components/album_card_musics.dart';
import 'package:spotfy_ui_clone/views/Home/components/musics.dart';
import 'package:spotfy_ui_clone/views/album_view.dart';
import 'components/musics_and_artists.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List _albumCardData = [];
  List? _musicListData;
  List? _recentMusicData;
  List? _radioMusicsData;
  List? _albumMusicNames;

  @override
  void initState() {
    super.initState();
    getAlbumCardData();
    getMusicsListData();
    getBasedOnRecentListeningMusicsListData();
    getRadioListData();
    getAlbumMusicsNames();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List musicListData = _musicListData ?? [];
    List recentMusicData = _recentMusicData ?? [];
    List radioMusicsData = _radioMusicsData ?? [];

    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xff1c7a74),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(1),
                      ]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Played",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.history),
                              SizedBox(width: 20),
                              Icon(Icons.settings),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AlbumCardList(
                      viewHeight: screenHeight,
                      data: _albumCardData,
                      onAlbumTap: onAlbumTap,
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Good evening",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const SizedBox(height: 16),
                          MusicsList(
                            data: musicListData,
                            height: screenHeight,
                            width: screenWidth,
                          ),
                          const SizedBox(height: 30),
                          MusicsAndArtists(
                            data: recentMusicData,
                            screenHeight: screenHeight,
                            title: "Based on your recent listening",
                          ),
                          MusicsAndArtists(
                            data: radioMusicsData,
                            screenHeight: screenHeight,
                            title: "Recommended Radio",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getAlbumCardData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/musics_album_cover.json")
        .then((data) {
      setState(() {
        _albumCardData = jsonDecode(data);
      });
    });
  }

  getMusicsListData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/good_evening.json")
        .then((data) {
      setState(() {
        _musicListData = jsonDecode(data);
      });
    });
  }

  getBasedOnRecentListeningMusicsListData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/recent_listening.json")
        .then((data) {
      setState(() {
        _recentMusicData = jsonDecode(data);
      });
    });
  }

  getRadioListData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/radio_musics.json")
        .then((data) {
      setState(() {
        _radioMusicsData = jsonDecode(data);
      });
    });
  }

  getAlbumMusicsNames() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/album_view_musics_names.json")
        .then((data) {
      setState(() {
        _albumMusicNames = jsonDecode(data);
      });
    });
  }

  onAlbumTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumView(
          data: _musicListData!,
          musicNames: _albumMusicNames!,
        ),
      ),
    );
  }
}
