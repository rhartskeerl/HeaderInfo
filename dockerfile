FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
COPY ./HeaderInfo.csproj ./HeaderInfo.csproj
RUN dotnet restore HeaderInfo.csproj
COPY . .
RUN dotnet build HeaderInfo.csproj -c Release -o /app/build

FROM build AS publish
RUN dotnet publish HeaderInfo.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HeaderInfo.dll"]
