using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CDCalificaciones
    {
        CDConexion oconexion = new CDConexion();
        SqlCommand ocmd = new SqlCommand();

        public bool Insertar_Calificaciones(CECalificaciones oucalificacion) 
        {
            try
            {
                ocmd.CommandType = System.Data.CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("BDSmartUrban");
                ocmd.CommandText = "SP_Insertar_Calificaciones";
                ocmd.Parameters.Add("@idProveedor", oucalificacion.IdCalificacion1);
                ocmd.Parameters.Add("@NombreProveedor", oucalificacion.IdSolicitud1);
                ocmd.Parameters.Add("@Telefono", oucalificacion.Puntuacion1);
                ocmd.Parameters.Add("@Direccion", oucalificacion.Comentarios1);
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
