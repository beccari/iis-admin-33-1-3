# Powershell IIS Admin 33 1/3

This is a Powershell Module project that helps sysadmin to manage and monitor IIS with some handy functions extra IIS functions (not really since there is only ONE FUNCTION for now).

Please refer the main IISAdminstration Powershell Cmdlets https://docs.microsoft.com/en-us/iis/get-started/whats-new-in-iis-10/iisadministration-powershell-cmdlets for more info

# System Requirements

* Powershell 5 or higher

# Installing

Just clone this repo  and run

`copy -Force -Recurse .\IISAdmin33 $env:PSModulePath.Split(';')[0]`

> Restart the Powershell Session in order to get the updated version

# Running

## Get-IISCurrentRequests
This method will run forever until a `Ctrl+C` hit.

Will fetch the requests from all **WorkerProcess** every 1sec.


```
⨯ ⚡ beccari@RAYGUN  ~  Get-IISCurrentRequests
IIS Web Core         1906 GET  /do/Theme.mvc/GetTheme/azul_escuro...
IIS Web Core         1891 GET  /do/Timezone.mvc/Culture
```


## Restart-IIS
This method combines two different commands:
- stop w3svc
- iisreset

```
⨯ ⚡ beccari@RAYGUN  ~                                                                                  [11:56]
❯ Restart-IIS
Stopping W3SVC first ...
WARNING: Waiting for service 'World Wide Web Publishing Service (w3svc)' to stop...
Calling for a IIReset...

Attempting stop...
Internet services successfully stopped
Attempting start...
Internet services successfully restarted
All Done!
```
