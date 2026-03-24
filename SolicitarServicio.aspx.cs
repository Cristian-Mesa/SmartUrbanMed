using System;
using System.Web.UI;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartUrban
{
    public partial class SolicitarServicio : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        [WebMethod(EnableSession = true)]
        public static string GuardarSolicitud(
            string tipo, string descripcion, string fecha,
            string usuario, string proveedor)
        {
            try
            {
                // ✅ Usa la clave correcta de connectionStrings
                string conexion = ConfigurationManager
                    .ConnectionStrings["BDSmartUrban"].ConnectionString;

                using (SqlConnection con = new SqlConnection(conexion))
                {
                    string query = @"
                        INSERT INTO Solicitudes 
                            (TipoServicio, Descripcion, FechaDeseada, Usuario, Proveedor, FechaSolicitud, Estado)
                        VALUES 
                            (@Tipo, @Descripcion, @FechaDeseada, @Usuario, @Proveedor, @FechaSolicitud, @Estado)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Tipo", tipo ?? "");
                        cmd.Parameters.AddWithValue("@Descripcion", descripcion ?? "");
                        cmd.Parameters.AddWithValue("@FechaDeseada",
                            string.IsNullOrEmpty(fecha) ? (object)DBNull.Value : DateTime.Parse(fecha));
                        cmd.Parameters.AddWithValue("@Usuario", usuario ?? "");
                        cmd.Parameters.AddWithValue("@Proveedor", proveedor ?? "");
                        cmd.Parameters.AddWithValue("@FechaSolicitud", DateTime.Now);
                        cmd.Parameters.AddWithValue("@Estado", "Pendiente");

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                return "ok";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}