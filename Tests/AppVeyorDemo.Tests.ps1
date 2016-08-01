$PSVersion    = $PSVersionTable.PSVersion.Major
$AppVeyorDemo = "$PSScriptRoot\..\AppVeyorDemo.psm1"

Describe "AppVeyorDemo PS$PSVersion" {
    Copy-Item $AppVeyorDemo TestDrive:\script.ps1 -Force
    Mock Export-ModuleMember {return $true}
    . 'TestDrive:\script.ps1'
    
    Context 'Strict mode' { 
        Set-StrictMode -Version latest

        It 'Get-SomeInt should return int' {
          Get-SomeInt | Should BeOfType System.Int32
        }

        It 'Get-SomeInt should be > 0' {
          Get-SomeInt  | Should BeGreaterThan 0
        }
        
        It 'Get-SomeInt should be < 0' {
          Get-SomeInt  | Should BeLessThan 100
        }         
    }
}
