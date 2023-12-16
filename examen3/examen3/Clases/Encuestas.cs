using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace examen3.Clases
{
    public class Encuestas
    {
        public static int numEncuesta { get; set; }
        public static string nombre { get; set; }
        public static string edad { get; set; }
        public static string correo { get; set; }
        public static string partido { get; set; }


        public Encuestas(int NumEncuesta, string Nombre, String Edad, String Correo, String Partido)
        {
            numEncuesta = NumEncuesta;
            nombre = Nombre;
            edad = Edad;
            correo = Correo;
            partido = Partido;

        }

        public static int Agregar(string Nombre, String Edad, String Correo, String Partido)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGARENCUEST", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", Nombre));
                    cmd.Parameters.Add(new SqlParameter("@Edad", Edad));
                    cmd.Parameters.Add(new SqlParameter("@Correo", Correo));
                    cmd.Parameters.Add(new SqlParameter("@PartidoPolitico", Partido));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
    }
}