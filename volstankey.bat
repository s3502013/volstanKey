set profile=Win7SP1x86
set image=e:\Images\Memory\SC-WKS02-Snapshot1.vmsn

mkdir e:\ram

REM Standard volatility outputs saved to file

volatility -f %image% --profile=%profile% pslist > e:\ram\pslist.txt
volatility -f %image% --profile=%profile% pstree > e:\ram\pstree.txt
volatility -f %image% --profile=%profile% psscan > e:\ram\psscan.txt
volatility -f %image% --profile=%profile% netscan > e:\ram\netscan.txt
volatility -f %image% --profile=%profile% envars > e:\ram\envars.txt

REM Standard persistence keys to scan
volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows\CurrentVersion\Run"
volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows\CurrentVersion\RunOnce"
volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows\CurrentVersion\RunOnce\Setup"
volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows\CurrentVersion\RunServices"
volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows\CurrentVersion\RunServicesOnce"

volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows NT\CurrentVersion\Winlogon"
volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit"

volatility -f %image% --profile=%profile% printkey -K "Microsoft\Windows\CurrentVersion\Policies\Explorer\run"

volatility -f %image% --profile=%profile% printkey -K "System\CurrentControlSet\Services"
