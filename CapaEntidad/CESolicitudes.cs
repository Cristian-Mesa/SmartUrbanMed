using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class CESolicitudes
    {

        private String IdSolicitud;
        private string IdUsuario;
        private string IdProveedor;
        private DateTime FechaSolicitud;
        private string Descripcion;

        public string IdSolicitud1 { get => IdSolicitud; set => IdSolicitud = value; }
        public string IdUsuario1 { get => IdUsuario; set => IdUsuario = value; }
        public string IdProveedor1 { get => IdProveedor; set => IdProveedor = value; }
        public DateTime FechaSolicitud1 { get => FechaSolicitud; set => FechaSolicitud = value; }
        public string Descripcion1 { get => Descripcion; set => Descripcion = value; }
    }
}
