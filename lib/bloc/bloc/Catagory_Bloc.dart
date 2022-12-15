import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_ios/Controller/category_dbOperation.dart';
import 'package:notes_ios/bloc/events/crud_events.dart';
import 'package:notes_ios/bloc/states/crud_state.dart';
import 'package:notes_ios/models/category.dart';

class Catagory_bloc extends Bloc<Crud_Events,Crud_State>{
  Catagory_bloc(initialState) : super(initialState){
    on<Create_Events<Catogory>>(_createEvent);
    on<Update_Events<Catogory>>(_updateEvent);
    on<Read_Events>(_readEvents);
    on<Delete_Events>(_deleteEvents);
  }
  final Category_Db_Operation _category_db_operation = Category_Db_Operation();
  List<Catogory> _catogory = <Catogory>[];
  void _createEvent(Create_Events<Catogory> event,Emitter emit) async{
    int newRowId = await _category_db_operation.create(event.object);
    if(newRowId !=0){
      event.object.id = newRowId;
      _catogory.add(event.object);
      emit(ListReadState<Catogory>(_catogory));
    }
    String massage = newRowId != 0 ? 'Create is Succesfuly ' : 'Create is Falied';
    emit(ProcessState(massage, newRowId!=0, ProcessType.create));
  }

  void _updateEvent(Update_Events<Catogory> event , Emitter emit)async{
   bool updated = await _category_db_operation.update(event.object);
   if(updated){
     int index = _catogory.indexWhere((element) => element.id == event.object.id);
     // print(Catogory().id);
     print(_catogory[index].title);
     print(event.object.title);
     if(index != -1){
       _catogory[index] = event.object;
       emit(ListReadState<Catogory>(_catogory));
     }
   }
   String massage = updated ? 'Update is Successfully ' : 'Update is Falied';
   emit(ProcessState(massage, updated, ProcessType.update));
  }

  void _deleteEvents(Delete_Events event,Emitter emit) async{

    bool deleted = await _category_db_operation.delete(_catogory.elementAt(event.index).id);
    print('grfgee ${_catogory.elementAt(event.index).title}');
    print(deleted);
    if(deleted){
      _catogory.removeAt(event.index);
      emit(ListReadState<Catogory>(_catogory));
    }
    String massage = deleted ? 'Deleted is Succesfuly ' : 'Deleted is Falied';
    emit(ProcessState(massage, deleted, ProcessType.delete));
  }

  void _readEvents(Read_Events event , Emitter emit) async {
    emit(LoadingState());
    _catogory = await _category_db_operation.read();
    emit(ListReadState<Catogory>(_catogory));
  }


}