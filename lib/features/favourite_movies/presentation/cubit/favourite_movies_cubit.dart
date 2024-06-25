import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

part 'favourite_movies_state.dart';

class FavouriteMoviesCubit extends Cubit<FavouriteMoviesState> {
  FavouriteMoviesCubit() : super(FavouriteMoviesInitial());

  initSql() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Movies.db');
    print('here is version 2');
    await openDatabase(path, version: 3,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE MOVIES (id INTEGER PRIMARY KEY,title TEXT, image TEXT, description TEXT, movieId INT NOT NULL UNIQUE)');
    });
  }

  // List<Map>goalsList = [];
  void getData() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Movies.db');

    Database database = await openDatabase(path);
    await database.rawQuery('SELECT * FROM MOVIES').then((value) {
      emit(GetDataSuccessState(value));
    }).catchError((onError) {
      print(onError.toString());
      emit(ErrorState(onError.toString()));
    });
  }

  void insertData(String name, String image, description, movieId) async {
    print('insertttt');
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Movies.db');

    Database database = await openDatabase(path);

    await database.rawInsert(
        'INSERT INTO MOVIES(title, image, description, movieId) VALUES(?, ?, ?, ?)',
        [name, image, description, movieId]).then((value) {
      print(value);
      emit(InsertDataSuccessState());
    }).catchError((onError) {
      emit(ErrorState(onError.toString()));
      print(onError.toString());
    });
    database.close();
  }

  void removeData(int id) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Movies.db');

    Database database = await openDatabase(path);
    await database
        .rawDelete('DELETE FROM MOVIES WHERE movieId = ?', ['$id']).then((value) {
      emit(DeleteDataSuccessState());
    }).catchError((onError) {
      emit(ErrorState(onError));
      print(onError.toString());
    });
  }

  void onDeleteDataBase() async {
    print('deleteeee');
    String databasePath = await getDatabasesPath();
    String pathName = join(databasePath, 'movies.dp');
    await deleteDatabase(pathName);
    emit(DeleteDataBaseSuccessState());
  }
}

