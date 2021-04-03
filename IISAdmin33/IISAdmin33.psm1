<#

.Synopsis
IIS Admin Functions developed by Mercado Eletronico

.Paramer Recipe
N/A

.Example
Get-IISCurrentRequests -forever

#>

Function Get-IISCurrentRequests {
    while (1) {
        Clear
        Write-Host "Showing IIS Requests for all WorkerProcess. Hit Ctrl+C to Stop...`n"
        $wp = Get-WmiObject WorkerProcess -Namespace root\WebAdministration

        foreach($w in $wp)
        {
            $w | Invoke-WmiMethod -Name GetExecutingRequests | Select-Object -ExpandProperty OutputElement | Select CurrentModule,TimeElapsed,Verb,Url
        }

        Sleep 1;
    }
    
}

Function Restart-IIS {
    Write-Host "Stopping W3SVC first ..."
    Stop-Service w3svc
    Write-Host "Calling for a IIReset... "
    iisreset.exe
    Write-Host "All Done!"
}

Export-ModuleMember -Function Get-IISCurrentRequests
Export-ModuleMember -Function Restart-IIS