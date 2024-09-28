
import 'package:intl/intl.dart';

String obtenerFormatoFecha(DateTime fecha){
  final ahora = DateTime.now();
  final diferencia = ahora.difference(fecha);

  if (diferencia.inDays == 0) {
    if (diferencia.inHours == 0) {
      if (diferencia.inMinutes == 0) {
        return 'Hace unos momentos';
      } else {
        return 'Hace ${diferencia.inMinutes} minutos';
      }
    } else {
      return 'Hace ${diferencia.inHours} horas';
    }
  } else if (diferencia.inDays == 1) {
    return 'Ayer';
  } else {
    return 'Publicado el ${DateFormat('d MMMM yyyy').format(fecha)}';
  }
}