enum ProcessType{
  create , update , delete
} // To Determine type operation
abstract class Crud_State {}

class ListReadState<T> extends Crud_State{
  final List<T> list;

  ListReadState(this.list);
}// To Read Data
class LoadingState extends Crud_State{} // To prepare Data

class ProcessState extends Crud_State{
  final String massage;
  final bool status;
  final ProcessType processType;

  ProcessState(this.massage, this.status, this.processType);
} // To return result request