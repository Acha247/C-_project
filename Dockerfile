FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY *.sln .
COPY /MyWebApp/*.csproj  ./
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0  

WORKDIR /app
COPY  --from=build /app/publish .

EXPOSE 5000
ENTRYPOINT [ "dotnet", "/app/publish/MyWebApp.dll" ]
