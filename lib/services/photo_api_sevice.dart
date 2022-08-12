import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:schoolphotoapp/models/media_file_model.dart';
import 'package:schoolphotoapp/models/response_model.dart';

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class PhotosApiService {
  // List<ImageModel> imageModelList = [];
  List<ResponseModel> mediaItems = [];
  List<ResponseModel> failedItems = [];

  Future<Response?> uploadMediaFiles(
      List<File> file,
      List<MediaFileModel>? imageModelList,
      OnUploadProgressCallback setUploadProgress,
      Map<String, String>? authHeaders,
      context,
      MediaFileModel? singleMediaFile) async {
    // var authProvider =
    //     Provider.of<FirebaseAuthViewModel>(context, listen: false);
    // if (authProvider.authHeaders == null) {
    //   return;
    // }
    // // await getImagesModel(file);
    // print("authHeader RESULT" + await authProvider.authHeaders.toString());
    // for (int i = 0; i < imageModelList.length; i++) {
    //   var tokenResult =
    //       // await uploadMediaItem(
    //       //     imageModelList[i].file!, authHeaders, imageModelList[i].fileName!);
    //       await uploadMediaItemDio(
    //           image: imageModelList[i].file!,
    //           authHeaders: authHeaders,
    //           filename: imageModelList[i].fileName!,
    //           callback: setUploadProgress);
    //   if (tokenResult.isNotEmpty) {
    //     imageModelList[i].token = tokenResult;
    //   }
    // }
    final headers = <String, String>{};
    headers.addAll(authHeaders!);
    headers['Content-type'] = 'application/json';
    // headers['Accept'] = 'application/json';
    print(headers);
    // List<String> tokens = [];
    // imageModelList.forEach((element) {
    //   tokens.add(element.uploadToken.toString());
    // });
    try {
      dio.Response response;
      var client = dio.Dio();

      try {
        final response = await client.post(
          'https://photoslibrary.googleapis.com/v1/mediaItems:batchCreate',
          data: (imageModelList != null)
              ? {
                  'newMediaItems': imageModelList.map((element) {
                    return {
                      'description': '',
                      'simpleMediaItem': {
                        "fileName": "image",
                        'uploadToken': element.uploadToken,
                      },
                    };
                  }).toList(),
                }
              : {
                  "newMediaItems": [
                    {
                      "description": "",
                      "simpleMediaItem": {
                        "uploadToken": singleMediaFile!.uploadToken,
                        "fileName": ""
                      }
                    }
                  ]
                },
          options: dio.Options(method: 'POST', headers: headers),
          //onSendProgress: _setUploadProgress,
        );

/////////////////////////////////////////////////
        if (response.data != null) {
          print(response.data);
          //return jsonDecode(responseBody);
        } else {
          print("ITS NULLLL");
        }
        return response;
      } on dio.DioError catch (e) {
        print(e.response?.data);
        return null;
      }
    } on SocketException catch (e) {
      print("\im andled");
      print(e.message);
      return null;
    }
  }

  static Future uploadMediaItemDio(
      {required OnUploadProgressCallback callback,
      File? image,
      authHeaders,
      String? filename}) async {
    dio.Response response;
    var client = dio.Dio();

    try {
      int? imageLength = await image?.length();
      Uint8List img = image!.readAsBytesSync();

      final headers = <String, String>{};
      headers.addAll(await authHeaders);
      headers['Content-type'] = 'application/octet-stream';
      headers['X-Goog-Upload-Protocol'] = 'raw';
      headers['X-Goog-Upload-File-Name'] = filename ?? "";
      headers['Content-Length'] = image.lengthSync().toString();
      headers['Connection'] = "keep-alive";
      headers['Accept'] = "*/*";

//  'Accept': "*/*",
//     'Content-Length': image.length,
//     'Connection': 'keep-alive',
      final response = await client.post(
        'https://photoslibrary.googleapis.com/v1/uploads',
        // data: image?.readAsBytesSync(),
        data: Stream.fromIterable(img.map((e) => [e])),
        options: dio.Options(method: 'POST', headers: headers),
        onSendProgress: callback,
      );

/////////////////////////////////////////////////
      if (response.data != null) {
        print(response.data);
        return response.data;
        //return jsonDecode(responseBody);
      } else {
        print("ITS NULLLL");
        return null;
      }
    } on dio.DioError catch (e) {
      print(e.response?.data);
      return e.response?.data;
    }
  }

  // Future<void> getImagesModel(List<File> files) async {
  //   for (var file in files) {
  //     imageModelList.add(ImageModel(
  //       file: file,
  //       fileName: path.basename(file.path),
  //     ));
  //   }
  // }
  // void _setUploadProgress(int sentBytes, int totalBytes) {
  //   double __progressValue =
  //       Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);
  //   __progressValue = double.parse(__progressValue.toStringAsFixed(2));
  //   if (__progressValue != _progressValue) _progressValue = __progressValue;
  //   _progressPercentValue = (_progressValue * 100.0).toInt();
  //   print("PROGwRESS: $_progressPercentValue %");
  //   if (_progressPercentValue == 100) {
  //     print("IM COMPLE|TEDDDDDDDDDDDD");
  //     // Future.delayed(800.milliseconds).then((value) => {if (Get.isDialogOpen ?? false) Get.back()});
  //   }
  //   // update();
  // }

}
