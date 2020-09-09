class Street{
  final int number;
  final String name;
 //constractor
  Street(this.number,this.name);
  //data maping
  Street.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        name = json['name'];
}