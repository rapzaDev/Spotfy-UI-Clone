import 'package:flutter/material.dart';

class AlbumView extends StatefulWidget {
  final List data;
  final List musicNames;
  const AlbumView({super.key, required this.data, required this.musicNames});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  ScrollController? scrollController;

  double imageOpacity = 1;
  double imageSize = 0;
  double initialImageSize = 240;
  double containerImageHeight = 500;
  double containerInitialHeight = 500;

  bool showTopBar = false;

  @override
  void initState() {
    super.initState();
    imageSize = initialImageSize;

    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialImageSize - scrollController!.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }

        containerImageHeight =
            containerInitialHeight - scrollController!.offset;
        if (containerImageHeight < 0) {
          containerImageHeight = 0;
        }

        imageOpacity = imageSize / initialImageSize;

        if (scrollController!.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: containerImageHeight,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.pink,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: imageOpacity.clamp(0, 1),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 20),
                            blurRadius: 32,
                            spreadRadius: 16,
                          ),
                        ],
                      ),
                      child: Image(
                        image: AssetImage("assets/radio5.png"),
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 140),
                ],
              ),
            ),
            SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          SizedBox(height: initialImageSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Image(
                                      image:
                                          const AssetImage("assets/logo.png"),
                                      width: screenWidth * .06,
                                      height: screenHeight * .06,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      "Spotfy",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1,888,132 likes ",
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    circleSeparator(3),
                                    Text(
                                      " 5h 3m",
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.favorite),
                                        SizedBox(width: 16),
                                        Icon(
                                          Icons.more_vert,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          previewButton(),
                          const SizedBox(height: 30),
                          musicsNamesList(),
                          const SizedBox(height: 50),
                          Text(
                            "You might also like",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            height: 400,
                            child: albumViewOtherAlbuns(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                color: showTopBar
                    ? const Color(0xffc61855).withOpacity(1)
                    : Colors.transparent.withOpacity(0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SafeArea(
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.keyboard_arrow_left),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: showTopBar ? 1 : 0,
                          duration: const Duration(milliseconds: 250),
                          child: Text(
                            "90s Pop Rock",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 50 -
                              containerImageHeight.clamp(
                                85.0,
                                double.infinity,
                              ),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff14d860),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                  size: 32,
                                ),
                              ),
                              Container(
                                width: 18,
                                height: 18,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 39, 41, 41),
                                ),
                                child: const Icon(
                                  Icons.shuffle,
                                  color: Color(0xff14d860),
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget previewButton() {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(130, 35)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.all(
            const BorderSide(
              width: 2,
              color: Colors.white24,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Preview",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget circleSeparator(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget musicsNamesList() {
    final index = widget.musicNames.length;
    final musicNamesData = widget.musicNames;

    List<Widget> getList() {
      List<Widget> children = [];
      for (var i = 0; i < index; i++) {
        children.add(
          Text(
            musicNamesData[i]["band"],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

        children.add(const SizedBox(width: 5));

        children.add(
          Text(
            musicNamesData[i]["music"],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
              fontWeight: FontWeight.w400,
            ),
          ),
        );

        children.add(const SizedBox(width: 7));

        children.add(Container(
          margin: const EdgeInsets.symmetric(vertical: 9),
          child: circleSeparator(4),
        ));

        children.add(const SizedBox(width: 7));
      }

      children.add(
        const Text(
          "and more",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      return children;
    }

    return Wrap(
      runSpacing: 10,
      children: getList(),
    );
  }

  Widget albumViewOtherAlbuns() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage(
                          widget.data[index]["image"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: widget.data.length,
          ),
        ),
      ],
    );
  }
}
