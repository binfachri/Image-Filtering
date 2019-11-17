import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryGridView extends StatefulWidget {
  @override
  _GalleryGridViewState createState() => _GalleryGridViewState();
}

class _GalleryGridViewState extends State<GalleryGridView> {
  Future<List<AssetEntity>> getAllImagesFromGallery() async {
    bool isPermissionsAccepted = await PhotoManager.requestPermission();

    if (isPermissionsAccepted) {
      List<AssetPathEntity> assetPathEntityList =
          await PhotoManager.getAssetPathList(hasVideo: false);
      List<AssetEntity> assetEntityList =
          await assetPathEntityList[0].assetList;

      return assetEntityList;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) => Center(
        child: FutureBuilder(
          future: getAllImagesFromGallery(),
          builder: (context, snapshot) {
            if (snapshot.data != null &&
                snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                padding: const EdgeInsets.all(4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => FutureBuilder(
                      future: snapshot.data[snapshot.data.length - index - 1]
                          .thumbDataWithSize(250, 250),
                      builder: (context, snapshot) {
                        if (snapshot.data != null &&
                            snapshot.connectionState == ConnectionState.done) {
                          return Material(
                            elevation: 8.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            child: InkWell(
                              onTap: () {},
                              child: Hero(
                                tag: "tag",
                                child: FadeInImage(
                                  placeholder: AssetImage(
                                      'assets/images/preloadImage.png'),
                                  fit: BoxFit.cover,
                                  image: MemoryImage(snapshot.data),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Image.asset('assets/images/preloadImage.png');
                        }
                      },
                    ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      );
}
