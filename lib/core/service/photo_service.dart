import 'package:vexana/vexana.dart';

import '../model/gallery_model.dart';

class PhotoService {
  INetworkManager networkManager = NetworkManager(options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/photos"));

  Future<List<GalleryModel>?> getPhotos() async {
    var response = await networkManager.send<GalleryModel, List<GalleryModel>>("https://jsonplaceholder.typicode.com/photos",
        parseModel: GalleryModel(), method: RequestType.GET);
    return response.data;
  }
}
