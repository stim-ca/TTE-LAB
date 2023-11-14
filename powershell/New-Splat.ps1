# Made by Co-work Cody
Function New-Splat {
    [CmdletBinding()]
    Param
    (
        [string][Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $True,
            Position = 0)]
        [ValidateNotNullOrEmpty()]
        $Name
    )

    try {

        $Parameters = (get-command -name $Name).parameters | Out-GridView -PassThru | Select-Object Name
        
        $output = "`$$($Name.Replace('-', ''))_Properties = @{`n"

        foreach ($parameter in $parameters) {
            $output += "`t$($parameter.Name) = `"`"`n"
        }

        $output += "}"
        Write-Host $output

    }
    catch {

    }
}