var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => 

    "Hello World! This is a simple example of an ASP.NET Core application running by CFT"

 );

app.Run();
