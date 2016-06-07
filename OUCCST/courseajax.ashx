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
        using (var db = new CstwebEntities())
        {
            var se = (from it in db.lesson
                      where it.id == lesid
                      select it).ToList();

            StringBuilder sb = new StringBuilder("{");
            sb.Append("\"id\":\"" + se[0].id+"\"");
            sb.Append(",\"lesnum\":\"" + se[0].lesnum + "\"");
            sb.Append(",\"lesgoal\":\"" + se[0].lesgoal + "\"");
            if (se[0].lesbook != null)
            {
                sb.Append(",\"lesbook\":\"" + se[0].lesbook + "\"");
            }
            else
            {
                sb.Append(",\"lesbook\":\"" + "无" + "\"");
            }
            sb.Append(",\"lestest\":\"" + se[0].lestest + "\"");
            string file = se[0].lesfile.Replace("\\","/");
            file = file.Substring(1, file.Length - 1);
            sb.Append(",\"lesfile\":\"" + file + "\"");
            sb.Append("}");
            res.Write(sb.ToString());
            res.End();
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}