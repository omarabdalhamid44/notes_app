abstract class Crud_Events{}

class Create_Events<T> extends Crud_Events{
  final T object;

  Create_Events(this.object);
}
class Update_Events<T> extends Crud_Events{
  final T object;

  Update_Events(this.object);
}
class Delete_Events extends Crud_Events{
  final int index;

  Delete_Events(this.index);
}
class Read_Events extends Crud_Events{}
