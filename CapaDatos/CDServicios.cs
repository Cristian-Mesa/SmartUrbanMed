using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CDServicios
    {
        CDConexion oconexion = new CDConexion();
        SqlCommand ocmd = new SqlCommand();

        public bool Insertar_Servicios(CEServicios ouservicio)
        {
            try
            {
                ocmd.CommandType = System.Data.CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("BDSmartUrban");
                ocmd.CommandText = "SP_Insertar_Servicios";
                ocmd.Parameters.Add("@idServicio", ouservicio.IdServicio1);
                ocmd.Parameters.Add("@NombreServicio", ouservicio.NombreServicio1);
                ocmd.Parameters.Add("@Descripcion", ouservicio.Descripcion1);
                ocmd.Parameters.Add("@Categoria", ouservicio.Categoria1);
             

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
