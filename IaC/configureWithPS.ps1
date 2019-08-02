# This is an IaC script to provision the web and database into azure
# for the ms-learn module for DB's
#
[CmdletBinding()]
param(
    [Parameter(Mandatory = $True)]
    [string]
    $resourceGroupName,

    [Parameter(Mandatory = $True)]
    [string]
    $servername,

    [Parameter(Mandatory = $True)]
    [string]
    $dbName
)

# # Uninstall AzureRM
# #
# Write-Output "uninstalling AzureRM..."
# Uninstall-AzureRm
# Write-Output "done uninstalling AzureRM"

# setup backup for sql server
#
Write-Output "installing az.sql power shell..."
Install-Module -Name Az.Sql -AllowClobber -Scope CurrentUser -Force
Write-Output "done installing az.sql powershell"

Write-Output "creating backup plan..."
Set-AzSqlInstanceDatabaseBackupShortTermRetentionPolicy -ResourceGroupName $resourceGroupName -InstanceName $servername -DatabaseName $dbName -RetentionDays 35
Write-Output "done creating backup plan"


