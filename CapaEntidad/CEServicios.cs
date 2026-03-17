using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class CEServicios
    {
        private String IdServicio;
        private string NombreServicio;
        private string Descripcion;
        private string Categoria;

        public string IdServicio1 { get => IdServicio; set => IdServicio = value; }
        public string NombreServicio1 { get => NombreServicio; set => NombreServicio = value; }
        public string Descripcion1 { get => Descripcion; set => Descripcion = value; }
        public string Categoria1 { get => Categoria; set => Categoria = value; }
    }
}
