using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class CECalificaciones
    {
        private int IdCalificacion;
        private int IdSolicitud;
        private int Puntuacion;
        private string Comentarios;

        public int IdCalificacion1 { get => IdCalificacion; set => IdCalificacion = value; }
        public int IdSolicitud1 { get => IdSolicitud; set => IdSolicitud = value; }
        public int Puntuacion1 { get => Puntuacion; set => Puntuacion = value; }
        public string Comentarios1 { get => Comentarios; set => Comentarios = value; }
    }
}
