using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CDProveedores
    {
        CDConexion oconexion = new CDConexion();
        SqlCommand ocmd = new SqlCommand();

        public bool Insertar_Proveedores(CEProveedores ouproveedor)
        {
            try
            {
                ocmd.CommandType = System.Data.CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("BDSmartUrban");
                ocmd.CommandText = "SP_Insertar_Proveedores";
                ocmd.Parameters.Add("@idProveedor", ouproveedor.IdProveedor1);
                ocmd.Parameters.Add("@NombreProveedor", ouproveedor.Nombre1);
                ocmd.Parameters.Add("@Telefono", ouproveedor.Telefono1);
                ocmd.Parameters.Add("@Direccion", ouproveedor.IdServicio1);
                ocmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception err)
            {
                throw new Exception(err.Message);
            }

        }
    }
}
