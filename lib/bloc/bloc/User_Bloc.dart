import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_ios/Controller/user_dbOperation.dart';
import 'package:notes_ios/bloc/events/crud_events.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/models/user.dart';

class User_BLoc extends Bloc<Crud_Events , Crud_State>{
  User_BLoc(initialState) : super(initialState){
    on<Create_Events<User>>(_createEvent);
    on<Update_Events<User>>(_updateEvent);
    on<Read_Events>(_readEvent);
    on<Delete_Events>(_deleteEvent);
  }

  final User_dbOperation _user_dbOperation = User_dbOperation();
  List<User> _user = <User>[];

  void _createEvent(Create_Events<User> event , Emitter emit) async{
    int newRowId = await _user_dbOperation.create(event.object);
    if(newRowId != -1){
      event.object.id = newRowId;
      _user.add(event.object);
      emit(ListReadState<User>(_user));
    }

    String massage = newRowId != 0 ? 'Create is Succesfuly ' : 'Create is Falied';
    emit(ProcessState(massage, newRowId!=0, ProcessType.create));
  }
  Future<bool> login({required email , required pass})async{
    return await _user_dbOperation.login(email: email, pass: pass);
  }
  void _updateEvent(Update_Events<User> event , Emitter emit) async{
    bool updated = await _user_dbOperation.update(event.object);
    if(updated){
      int index = _user.indexWhere((element) => element.id == event.object.id);
      _user[index] = event.object;
      emit(ListReadState<User>(_user));
    }
    String massage = updated? 'Updated is Succesfuly ' : 'Updated is Falied';
    emit(ProcessState(massage, updated, ProcessType.update));
  }
  void _readEvent(Read_Events event , Emitter emit) async{
    emit(LoadingState());
    _user = await _user_dbOperation.read();
    emit(ListReadState<User>(_user));
  }
  void _deleteEvent(Delete_Events event , Emitter emit) async{
    bool deleted = await _user_dbOperation.delete(_user.elementAt(event.index).id);
    if(deleted){
      _user.removeAt(event.index);
      emit(ListReadState<User>(_user));
    }
    String massage = deleted ? 'Deleted is Succesfuly ' : 'Deleted is Falied';
    emit(ProcessState(massage, deleted, ProcessType.delete));
  }
}