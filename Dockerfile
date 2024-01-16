FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /App

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0  AS runtime

WORKDIR /app
COPY  --from=build /App/out .

EXPOSE 5000
ENTRYPOINT [ "dotnet", "MyWebApp.dll" ]
