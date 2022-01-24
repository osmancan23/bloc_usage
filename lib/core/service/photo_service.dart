import 'package:bloc_usage/core/model/gallery_model.dart';
import 'package:vexana/vexana.dart';

class PhotoService {
  INetworkManager networkManager = NetworkManager(options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/photos"));

  Future<List<GalleryModel>?> getPhotos() async {
    var response = await networkManager.send<GalleryModel, List<GalleryModel>>("https://jsonplaceholder.typicode.com/photos",
        parseModel: GalleryModel(), method: RequestType.GET);
    return response.data;
  }
}
