param (
# Request to enter the apiKey (mandatory)
    [Parameter(Mandatory=$true)]
    [string]$apiKey,
# Request to enter the users email (mandatory)
    [Parameter(Mandatory=$true)]
    [string]${profile.email}
)

# Okta API endpoint URL - Repleace ENTER URL HERE with your okta url
$oktaUrl = "https://ENTER URL HERE/api/v1/users/${profile.email}/lifecycle/deactivate"

# Create headers for the API request
$headers = @{
    "Accept" = "application/json"
    "Content-Type" = "application/json"
    "Authorization" = "SSWS $apiKey"
}

# Send the API request to deactivate the user
$response = Invoke-RestMethod -Method Post -Uri $oktaUrl -Headers $headers

# Check if the user was deactivated successfully
if ($response.status -eq $200) {
    Write-Host "Success! User '${profile.email}' has been deactivated."
} else {
    Write-Host "Error deactivating user or status unknown"
}