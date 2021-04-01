<#

.Synopsis
IIS Admin Functions developed by Mercaado Eletronico

.Paramer Recipe
N/A

.Example
Get-IISCurrentRequests -forever

#>

Function Get-IISCurrentRequests {
    Write-Host "Show IIS Requests for all WorkerProcess. Hit Ctrl+C to Stop."
    while (1) {
        Clear
        $wp = Get-WmiObject WorkerProcess -Namespace root\WebAdministration

        foreach($w in $wp)
        {
            $w | Invoke-WmiMethod -Name GetExecutingRequests | Select-Object -ExpandProperty OutputElement | Select CurrentModule,TimeElapsed,Verb,Url
        }

        Sleep 1;
    }
    
}

Export-ModuleMember -Function Get-IISCurrentRequests