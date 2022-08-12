import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:schoolphotoapp/models/image_model.dart';
import 'package:schoolphotoapp/models/media_file_model.dart';
import 'package:schoolphotoapp/models/util_progrss_model.dart';
import 'package:schoolphotoapp/services/base_model.dart';
import 'package:schoolphotoapp/services/firestore_service.dart';
import 'package:schoolphotoapp/services/photo_api_sevice.dart';
import 'package:schoolphotoapp/utils/enums/view_state.dart';
import 'package:schoolphotoapp/viewmodels/auth_view_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseModel {
  List<MediaFileModel> mediaFilesList = [];
  List<File> files = [];
  final ImagePicker _picker = ImagePicker();
  FilePickerResult? result;

  bool isInProgressStatus = false;

  double progressValue = 0;
  int progressPercentValue = 0;

  pickAndUploadFile(bool isCameraSelected, context) async {
    files = [];
    mediaFilesList = [];
    final XFile? photo;
    if (isCameraSelected) {
      photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        files[0] = photo as File;
        print(photo.path);
        await uploadMediaItemsAndGetListOfTokens(context);
      } else {}
    } else {
      result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
      );
      if (result != null) {
        files = result!.paths.map((path) => File(path!)).toList();
        print(files[0].path);
        await uploadMediaItemsAndGetListOfTokens(context);
      } else {}
    }
  }

  int currentUploadIndex = -1;

  Future<void> uploadMediaItemsAndGetListOfTokens(context) async {
    var authProvider =
        Provider.of<FirebaseAuthViewModel>(context, listen: false);
    if (authProvider.authHeaders == null) {
      return;
    }
    currentUploadIndex = 0;

    isInProgressStatus = true;
    setState(ViewState.Busy);

    await getImagesModel(files);
    print(mediaFilesList.length);
    for (int i = 0; i < mediaFilesList.length; i++) {
      var tokenResult = await PhotosApiService.uploadMediaItemDio(
          image: mediaFilesList[i].file!,
          authHeaders: await authProvider.authHeaders,
          filename: mediaFilesList[i].fileName,
          callback: setUploadProgress);
      if (tokenResult != null && tokenResult.isNotEmpty) {
        ///////////////////////////////////////////////////////
        // just temporary solution for uploading fail image ///
        ///////////////////////////////////////////////////////
        if (i != 1) {
          mediaFilesList[i].uploadToken = tokenResult;
        }
        ///////////////////////////////////////////////////////
        /// ended ///
        ///////////////////////////////////////////////////////

        // mediaFilesList[i].uploadToken = tokenResult;
        if (i != mediaFilesList.length - 1) {
          currentUploadIndex++;
        }

        setState(ViewState.Idle);
      }
    }
    final response = await PhotosApiService().uploadMediaFiles(
        files,
        mediaFilesList,
        setUploadProgress,
        await authProvider.authHeaders,
        context,
        null);
    if (response != null) {
      print("Non Null Received from as dio reponse");
      if (response.statusCode == 200) {
        print("Success with 200 status code");
        await uploadMediaItemsDataToFirestore(response);
        files = [];
        isInProgressStatus = false;
        currentUploadIndex = -1;
        setState(ViewState.Idle);
      } else {
        print("Success with status code is not = 200");
        files = [];
        currentUploadIndex = -1;
        isInProgressStatus = false;
        currentUploadIndex = -1;
        setState(ViewState.Idle);
      }
    } else {
      currentUploadIndex = -1;
      setState(ViewState.Idle);
      print("Null Received from as dio reponse");
    }
  }

  Future<void> getImagesModel(List<File> files) async {
    for (var file in files) {
      mediaFilesList.add(MediaFileModel(
        file: file,
        fileName: path.basename(file.path),
        size: await file.length(),
        extension: path.extension(file.path),
      ));
    }
  }

  PublishSubject<int> publishSubject = PublishSubject<int>();
  void setUploadProgress(int sentBytes, int totalBytes) {
    double progressValue =
        Util.remap(sentBytes.toDouble(), 0, totalBytes.toDouble(), 0, 1);

    progressValue = double.parse(progressValue.toStringAsFixed(2));

    if (progressValue != progressValue) progressValue = progressValue;

    progressPercentValue = (progressValue * 100.0).toInt();
    publishSubject.add(progressPercentValue);
    if (progressPercentValue == 100) {
      print("IM COMPLE|TEDDDDDDDDDDDD");
      progressPercentValue = 100;
    }
  }

  uploadMediaItemsDataToFirestore(Response<dynamic> resoponse) async {
    final result = await FirestoreService().uploadNewMediaItemsActivity();
  }

  bool checkFailedMediaFile() {
    if (mediaFilesList.isNotEmpty) {
      int index =
          mediaFilesList.indexWhere((element) => element.uploadToken == null);
      if (index != -1) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  List<MediaFileModel> failedMediaFilesList = [];

  startRetryProcessForSingleFile(
      context, MediaFileModel selectedMediaFile, int selectedIndex) async {
    await copyFailedMediaFilesToFailedList();
    await retrySelectedMediaFile(context, selectedMediaFile, selectedIndex);
  }

  copyFailedMediaFilesToFailedList() {
    if (checkFailedMediaFile()) {
      for (int i = 0; i < mediaFilesList.length; i++) {
        if (mediaFilesList[i].uploadToken == null) {
          failedMediaFilesList.add(mediaFilesList[i]);
        }
      }
    }
  }

  // Future<void> retryToUploadFailedMediaFiles(context);
  bool isRetryingSingleFile = false;
  Future<void> retrySelectedMediaFile(
      context, MediaFileModel selectedMediaFile, int selectedIndex) async {
    var authProvider =
        Provider.of<FirebaseAuthViewModel>(context, listen: false);
    if (authProvider.authHeaders == null) {
      return;
    }
    isRetryingSingleFile = true;
    currentUploadIndex = selectedIndex;
    isInProgressStatus = true;
    setState(ViewState.Busy);

    var tokenResult = await PhotosApiService.uploadMediaItemDio(
        image: selectedMediaFile.file,
        authHeaders: await authProvider.authHeaders,
        filename: selectedMediaFile.fileName,
        callback: setUploadProgress);
    if (tokenResult != null && tokenResult.isNotEmpty) {
      selectedMediaFile.uploadToken = tokenResult;
      // if (i != mediaFilesList.length - 1) {
      //   currentUploadIndex++;
      // }
      // setState(ViewState.Idle);
    }

    if (tokenResult == null) {
      isRetryingSingleFile = false;
      isInProgressStatus = false;
      currentUploadIndex = -1;
      setState(ViewState.Idle);
      return;
    }

    final response = await PhotosApiService().uploadMediaFiles(
        files,
        null,
        setUploadProgress,
        await authProvider.authHeaders,
        context,
        selectedMediaFile);
    if (response != null) {
      print("Non Null Received from as dio reponse");
      if (response.statusCode == 200) {
        print("Success with 200 status code");
        // await uploadMediaItemsDataToFirestore(response);
        await removeMediaFileFromFailedList(selectedMediaFile);
        files = []; // remove single failed media item from failed list
        isInProgressStatus = false;
        isRetryingSingleFile = false;

        currentUploadIndex = -1;
        setState(ViewState.Idle);
      } else {
        print("Success with status code is not = 200");
        // await removeMediaFileFromFailedList(selectedMediaFile);
        files = []; // remove single failed media item from failed list
        currentUploadIndex = -1;
        isRetryingSingleFile = false;

        isInProgressStatus = false;
        setState(ViewState.Idle);
      }
    } else {
      isRetryingSingleFile = false;
      isInProgressStatus = false;

      currentUploadIndex = -1;
      setState(ViewState.Idle);
      print("Null Received from as dio reponse");
    }
  }

  Future removeMediaFileFromFailedList(selectedMediaFile) async {
    if (failedMediaFilesList.isEmpty) {
      return;
    }
    int index = failedMediaFilesList.indexWhere((element) =>
        element.fileName == selectedMediaFile.fileName &&
        element.size == selectedMediaFile.size &&
        element.extension == selectedMediaFile.extension);
    if (index != -1) {
      failedMediaFilesList.removeAt(index);
    }
  }
}
