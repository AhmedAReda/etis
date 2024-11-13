import 'package:etislat/core/service/sqldb.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:googleapis/drive/v3.dart' as gdrive;
import 'package:googleapis_auth/auth_io.dart' as auth show AuthClient;
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DriveScopeRepo {
  final SharedPreferences sharedprefrences;
  final SqlDb mysql;

  DriveScopeRepo({required this.sharedprefrences, required this.mysql});
  final String clientId1 ='';

  Future<File?> getDatabaseFile() async {
    String databasePath = await getDatabasesPath(); // Get the databases path
    String path = p.join(databasePath, 'note1.db'); // Combine with the db name
    return File(path); // Return the file object
  }

  Future<void> uploadDatabaseToDrive(File file) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId: clientId1, scopes: [gdrive.DriveApi.driveFileScope]);

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final auth.AuthClient? client =
            await googleSignIn.authenticatedClient();

        if (client != null) {
          final gdrive.DriveApi driveApi = gdrive.DriveApi(client);

          // Check if the "note.db" file already exists on Google Drive
          gdrive.FileList files =
              await driveApi.files.list(q: "name = 'note1.db'");

          if (files.files != null && files.files!.isNotEmpty) {
            // File exists, update it
            var existingFile = files.files!.first;
            var fileId = existingFile.id;

            if (fileId != null) {
              // Update the existing file
              var fileStream = file.openRead();
              var media = gdrive.Media(fileStream, file.lengthSync());

              await driveApi.files.update(
                gdrive
                    .File(), // Empty File object since we're just updating the content
                fileId,
                uploadMedia: media,
              );
            }
          } else {
            // File does not exist, upload as a new file
            var newFile = gdrive.File();
            newFile.name = p.basename(file.path); // Name the file as note.db

            var fileStream = file.openRead();

            await driveApi.files.create(
              newFile,
              uploadMedia: gdrive.Media(fileStream, file.lengthSync()),
            );
          }
        }
      }
    } catch (e) {}
  }

  Future<void> restoreDatabaseFromDrive() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
          clientId: clientId1, scopes: [gdrive.DriveApi.driveFileScope]);

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final auth.AuthClient? client =
            await googleSignIn.authenticatedClient();

        if (client != null) {
          final gdrive.DriveApi driveApi = gdrive.DriveApi(client);

          // Search for the "note.db" file on Google Drive
          gdrive.FileList files =
              await driveApi.files.list(q: "name = 'note1.db'");

          if (files.files != null && files.files!.isNotEmpty) {
            var driveFile = files.files!.first;
            var fileId = driveFile.id;

            if (fileId != null) {
              // Download the file content as bytes
              var media = await driveApi.files.get(
                fileId,
                downloadOptions: gdrive.DownloadOptions.fullMedia,
              ) as gdrive.Media;

              // Convert the stream into a list of bytes
              List<int> dataBytes = await media.stream.fold<List<int>>(
                [],
                (List<int> previous, List<int> element) =>
                    previous..addAll(element),
              );

              // Save it locally
              String databasePath = await getDatabasesPath();
              String path = p.join(databasePath, 'note1.db');
              File localFile = File(path);

              // Write the data to the file
              await localFile.writeAsBytes(dataBytes, flush: true);
            }
          } else {}
        }
      }
    } catch (e) {}
  }

  Future<void> upload1() async {
    try {
      // Get the database file "note.db"
      File? file = await getDatabaseFile();

      if (file != null) {
        // Upload the file to Google Drive
        await uploadDatabaseToDrive(file);
      }
    } catch (e) {}
  }

  GoogleSignInAccount? _googleUser;
  Future<String?> signIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: clientId1,
        scopes: [gdrive.DriveApi.driveFileScope],
      );

      _googleUser = await googleSignIn.signIn();

      if (_googleUser != null) {
        sharedprefrences.setString('email', _googleUser!.email);

        return _googleUser!.email; // Return the user's email
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    await googleSignIn.signOut();
    _googleUser = null; // Clear the signed-in user
    sharedprefrences.setString('email', 'null');
    await deleteDataBae();
    //  print('22 ------------- ${_googleUser!.email}');
  }

  GoogleSignInAccount? get googleUser => _googleUser;

  Future<String> getemail() async {
    String? email = sharedprefrences.getString('email');
    return email ?? 'No Email Found';
  }

  Future<void> deleteDataBae() async {
    await mysql.mydeletedatabase();
  }
}
