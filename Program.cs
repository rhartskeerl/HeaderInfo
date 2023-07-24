using System.Text;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", (HttpContext httpContext) => {
    var response = new StringBuilder();
    foreach(var header in httpContext.Request.Headers)
    {
        response.AppendLine($"{header.Key}: {header.Value}");
    }
    return response.ToString();
});

app.Run();
