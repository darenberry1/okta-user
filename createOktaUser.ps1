param (
# Request to enter the apiKey (mandatory)
    [Parameter(Mandatory=$true)]
    [string]$apiKey,
# Request to enter the users firstName (mandatory)
    [Parameter(Mandatory=$true)]
    [string]$firstName,
# Request to enter the users lastName (mandatory)
    [Parameter(Mandatory=$true)]
    [string]$lastName,
# Request to enter the users password (mandatory)
    [Parameter(Mandatory=$true)]
    [secureString]$password,
# Request to enter the users email (mandatory)
    [Parameter(Mandatory=$true)]
    [string]$email
)

# Okta API endpoint URL - Repleace ENTER URL HERE with your okta url
$oktaUrl = "https://ENTER URL HERE/api/v1/users"

# Create headers for the API request
$headers = @{
    "Accept" = "application/json"
    "Content-Type" = "application/json"
    "Authorization" = "SSWS $apiKey"
}

# Create a body for the API request
$body = @{
    "profile" = @{
        "firstName" = $firstName
        "lastName" = $lastName
        "email" = $email
        "login" = $email
    }
    "credentials" = @{
        "password" = @{
            "value" = $password
        }
    }
} | ConvertTo-Json

# Send the API request to create the user
$response = Invoke-RestMethod -Method Post -Uri $oktaUrl -Headers $headers -Body $body

# Check if the user was created successfully
if ($response.status -eq "ACTIVE") {
    Write-Host "User '$email' created successfully in Okta."
} else {
    Write-Host "Error creating user in Okta."
}