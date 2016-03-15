//counter "c:\files\"

function counter($files){
	$files = get-item $files
	foreach ($file in $files){
		$lines = Get-Content -Path $file
		[int]$created = 0
		[int]$updated = 0
		[int]$deleted = 0	
		[int]$totalLinhas = 0
		foreach ($line in $lines){
			$found = $line -match '(\d+).{1,10}created'
			if ($found) {
				$created = $created + [int]$matches[1]
			}
			$found = $line -match '(\d+).{1,10}updated'
			if ($found) {
				$updated = $updated + [int]$matches[1]
			}
			$found = $line -match '(\d+).{1,10}deleted'
			if ($found) {
				$deleted = $deleted + [int]$matches[1]
			}
			$totalLinhas++
		}
		Write-Host "+$file ($totalLinhas linhas)"
		Write-Host "++created: $created"
		Write-Host "++updated.: $updated"
		Write-Host "++deleted.: $deleted"
		Write-Host "++total...:"($created + $updated + $deleted)
		Write-Host ""
	}
}