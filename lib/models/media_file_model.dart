import 'dart:io';

class MediaFileModel {
  String? id;
  String fileName;
  String extension;
  int size;
  File? file;
  String? uploadToken;

  MediaFileModel({
    this.id,
    required this.fileName,
    required this.extension,
    required this.size,
    this.file,
    this.uploadToken,
  });
}
