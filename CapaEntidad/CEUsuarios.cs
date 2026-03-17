using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class CEUsuarios
    {
        private String IdUsario;
        private string Nombre;
        private string Telefono;
        private string Email;
        private string TipoUsuario;

        public string IdUsario1 { get => IdUsario; set => IdUsario = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public string Telefono1 { get => Telefono; set => Telefono = value; }
        public string Email1 { get => Email; set => Email = value; }
        public string TipoUsuario1 { get => TipoUsuario; set => TipoUsuario = value; }
    }
}
