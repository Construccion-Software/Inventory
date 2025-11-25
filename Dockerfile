FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
# Nota: Railway asigna dinámicamente PORT; no es necesario exponer 8080 en producción,
# pero lo dejamos para pruebas locales.
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish "InventoryService.Api/InventoryService.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
# Hace que Kestrel escuche en el puerto que Railway pase mediante la variable PORT
ENV ASPNETCORE_URLS=http://*:${PORT:-8080}
ENTRYPOINT ["dotnet", "InventoryService.Api.dll"]
