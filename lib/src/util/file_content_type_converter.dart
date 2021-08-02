const _fileContentType = {
  'png': 'image/png',
  'jpg': 'image/jpeg',
  'jpeg': 'image/jpeg',
  'doc': 'application/msword',
  'rtf': 'application/rtf',
  'gif': 'image/gif',
  'txt': 'text/plain',
  'pdf': 'application/pdf',
  'docx': 'application/msword',
  'webp': 'image/webp',
  'ogg': 'audio/ogg',
};

class FileContentTypeConverter {
  static String contentType(String fileName) => _fileContentType[fileName?.split('.')?.last];
}
