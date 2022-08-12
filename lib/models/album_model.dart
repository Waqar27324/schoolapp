import 'package:schoolphotoapp/models/media_file_model.dart';
import 'package:schoolphotoapp/models/student_model.dart';

enum UploadStatus { notStarted, inProgress, paused, completed, failed }

class AlbumModel {
  String? id;
  String? title;
  String? description;
  DateTime createdAt;
  DateTime updatedAt;
  int totalFiles;
  int successfullyUploadedFiles;
  String albumLink;
  double totalSize;
  UploadStatus uploadStatus = UploadStatus.notStarted;
  double uploadProgress = 0.0;
  List<MediaFileModel>? mediaFilesList;
  List<MediaFileModel>? failedMediaFilesList;
  List<StudentModel>? sharedWithStudentsList;

  AlbumModel(
      {this.id,
      this.title,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      required this.totalFiles,
      required this.successfullyUploadedFiles,
      required this.albumLink,
      required this.totalSize,
      required this.uploadStatus,
      required this.uploadProgress,
      this.mediaFilesList,
      this.failedMediaFilesList,
      this.sharedWithStudentsList});
}

List<AlbumModel> dymmyAlbumsData = [
  AlbumModel(
    id: '1',
    title: 'Images and Videos',
    description: 'This is album 1',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 2,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
  AlbumModel(
    id: '2',
    title: 'Videos',
    description: 'This is album 2',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 2,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
  AlbumModel(
    id: '3',
    title: 'Videos',
    description: 'This is album 3',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 5,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
  AlbumModel(
    id: '4',
    title: 'Images',
    description: 'This is album 4',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 4,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
  AlbumModel(
    id: '5',
    title: 'Images and Videos',
    description: 'This is album 5',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 2,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
  AlbumModel(
    id: '6',
    title: 'Images and Videos',
    description: 'This is album 6',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 3,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
  AlbumModel(
    id: '7',
    title: 'Images and Videos',
    description: 'This is album 7',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    totalFiles: 5,
    successfullyUploadedFiles: 5,
    uploadStatus: UploadStatus.notStarted,
    albumLink: 'www.googlePhotos.com',
    totalSize: 20.0,
    uploadProgress: 45.0,
    mediaFilesList: mediaFiles,
    failedMediaFilesList: mediaFiles,
    sharedWithStudentsList: dummyStudentsData,
  ),
];

List<MediaFileModel> mediaFiles = [
  MediaFileModel(
    id: '1',
    fileName: 'image1.jpg',
    extension: 'jpg',
    size: 20,
    uploadToken: '12345',
  ),
  MediaFileModel(
    id: '2',
    fileName: 'image2.jpg',
    extension: 'jpg',
    size: 20,
    uploadToken: '12345',
  ),
  MediaFileModel(
    id: '3',
    fileName: 'image3.jpg',
    extension: 'jpg',
    size: 20,
    uploadToken: '12345',
  ),
  MediaFileModel(
    id: '4',
    fileName: 'image4.jpg',
    extension: 'jpg',
    size: 20,
    uploadToken: '12345',
  ),
  MediaFileModel(
    id: '5',
    fileName: 'image5.jpg',
    extension: 'jpg',
    size: 20,
    uploadToken: '12345',
  ),
];
