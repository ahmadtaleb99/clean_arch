void main (){
  String? x;
    int? s = null;

    int as = s.orZero();
  print(x.orEmpty());
  print('x.orEmpty()');
  print(x.orEmpty());
  print(as);
}

extension NotNullString on String?{
  String orEmpty () => this == null ? '' : this!;
}

extension NotEmptyInt on int?{
  int orZero () => this == null ? 0 : this!;
}

