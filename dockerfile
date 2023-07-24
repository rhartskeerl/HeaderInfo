FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /

COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /
COPY --from=build ./publish .
ENTRYPOINT ["dotnet", "HeaderInfo.dll"]
