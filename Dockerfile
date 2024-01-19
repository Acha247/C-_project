FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /App

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY --from=build-env /App/out .
EXPOSE 80
<<<<<<< HEAD
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
=======
ENTRYPOINT ["dotnet", "MyWebApp.dll"]

>>>>>>> 65c0f7c71bfb7f54f7ad0ac3b6a118b7aa635c8e
