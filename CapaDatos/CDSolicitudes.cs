using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CDSolicitudes
    {
        CDConexion oconexion = new CDConexion();
        SqlCommand ocmd = new SqlCommand();

        public bool Insertar_Solicitud(CESolicitudes ousolicitudes)
        {
            try
            {
                ocmd.CommandType = System.Data.CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("BDSmartUrban");
                ocmd.CommandText = "SP_Insertar_Solicitud";
                ocmd.Parameters.Add("@idSolicitud", ousolicitudes.IdSolicitud1);
                ocmd.Parameters.Add("@idUsuario", ousolicitudes.IdUsuario1);
                ocmd.Parameters.Add("@idProveedor", ousolicitudes.IdProveedor1);
                ocmd.Parameters.Add("@FechaSolicitud", ousolicitudes.FechaSolicitud1);
                ocmd.Parameters.Add("@Descripcion", ousolicitudes.Descripcion1);

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
