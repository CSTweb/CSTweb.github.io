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
                exchange se = db.exchange.First(a => a.id == lesid);
                
                StringBuilder sb = new StringBuilder("{");
                sb.Append("\"id\":\"" + se.id + "\"");
                sb.Append(",\"exurl\":\"" + se.photo + "\"");
                sb.Append(",\"exname\":\"" + se.name + "\"");
                sb.Append(",\"exemail\":\"" + se.email + "\"");
                sb.Append(",\"exmajor\":\"" + se.major + "\"");
                sb.Append(",\"exnation\":\"" + se.nation + "\"");
                sb.Append(",\"exhome\":\"" + se.home + "\"");
                /*
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
                sb.Append(",\"exetc\":\"" + se.ect + "\"");
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