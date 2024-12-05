# Get image which have .net core 6
FROM mcr.microsoft.com/dotnet/sdk:6.0 

# Specific working folder
WORKDIR /app

# Copy source code from this path to container
COPY . .

# run this command to build 
RUN dotnet restore

# Run .NET
CMD ["dotnet", "run", "--urls", "http://0.0.0.0:5214"]
