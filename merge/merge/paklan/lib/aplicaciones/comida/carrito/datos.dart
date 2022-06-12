class datos {
  List<Asst>? asst;

  datos({this.asst});

  datos.fromJson(Map<String, dynamic> json) {
    if (json['asst'] != null) {
      asst = <Asst>[];
      json['asst'].forEach((v) {
        asst!.add(new Asst.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.asst != null) {
      data['asst'] = this.asst!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Asst {
  String? nombre;
  List<Articulos>? articulos;

  Asst({this.nombre, this.articulos});

  Asst.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    if (json['articulos'] != null) {
      articulos = <Articulos>[];
      json['articulos'].forEach((v) {
        articulos!.add(new Articulos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    if (this.articulos != null) {
      data['articulos'] = this.articulos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articulos {
  String? nombre;
  String? descripcion;
  String? imagen;
  double? calificacion;
  double? precio;

  Articulos(
      {this.nombre,
      this.descripcion,
      this.imagen,
      this.calificacion,
      this.precio});

  Articulos.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    imagen = json['imagen'];
    calificacion = json['calificacion'];
    precio = json['precio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['imagen'] = this.imagen;
    data['calificacion'] = this.calificacion;
    data['precio'] = this.precio;
    return data;
  }
}

class carrito {
  final String nombre;
  final double precio;
  final int cantidad;

  carrito(this.nombre, this.precio, this.cantidad);
}
