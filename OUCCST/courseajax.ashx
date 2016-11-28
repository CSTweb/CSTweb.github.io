<%@ WebHandler Language="C#" Class="courseajax" %>

using System;
using System.Web;
using System.Linq;
using System.Text;

public class courseajax : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        HttpResponse res = context.Response;
        HttpRequest req = context.Request;
        res.ContentType = "text/plain";
        string id = context.Request.Form["id"];
        int lesid = Convert.ToInt16(id);
        try
        {
            using (var db = new CstwebEntities())
            {
                lesson se = db.lesson.First(a => a.id == lesid);
                
                StringBuilder sb = new StringBuilder("{");
                sb.Append("\"id\":\"" + se.id + "\"");
                sb.Append(",\"lesname\":\"" + se.classname + "\"");
                /*
                sb.Append(",\"lesnum\":\"" + se.lesnum + "\"");
                sb.Append(",\"lesgoal\":\"" + se.lesgoal + "\"");
                if (se.lesbook != null)
                {
                    sb.Append(",\"lesbook\":\"" + se.lesbook + "\"");
                }
                else
                {
                    sb.Append(",\"lesbook\":\"" + "无" + "\"");
                }
                sb.Append(",\"lestest\":\"" + se.lestest + "\"");*/
                if (se.lesfile != null)
                {
                    string file = se.lesfile.Replace("\\", "/");
                    file = file.Substring(1, file.Length - 1);
                    sb.Append(",\"lesfile\":\"" + file + "\"");
                }
                else
                {
                    sb.Append(",\"lesfile\":\"" + "#" + "\"");
                }
                sb.Append(",\"lesetc\":\"" + se.etc.Replace("\"", "'") + "\"");
                sb.Append("}");
                res.Write(sb.ToString());
                //res.Write(sb);
                res.End();
            }
        }
        catch { }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}