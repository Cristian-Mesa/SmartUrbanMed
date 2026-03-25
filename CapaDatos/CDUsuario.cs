using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidad;

namespace CapaDatos
{
    public class CDUsuaio
    {
        CDConexion oconexion = new CDConexion();
        SqlCommand ocmd = new SqlCommand();

        public bool Insertar_Usuario(CEUsuarios ousuario)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("BDSmartUrban");
                ocmd.CommandText = "SP_Insertar_Usuario";
                ocmd.Parameters.Add("@Nombre", ousuario.Nombre1);
                ocmd.Parameters.Add("@Telefono", ousuario.Telefono1);
                ocmd.Parameters.Add("@Correo", ousuario.Email1);
                ocmd.Parameters.Add("@TipoUsuario", ousuario.TipoUsuario1);

                ocmd.ExecuteNonQuery();
                return true;

            }
            catch (Exception err)
            {
                throw new Exception(err.Message);
            }
        }
        public bool Eliminar_Usuario(CEUsuarios ousuario)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("BDSmartUrban");
                ocmd.CommandText = "SP_Eliminar_Usuario";
                ocmd.Parameters.Add("@IdUsuario", ousuario.IdUsario1);
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
