$size = Get-PartitionSupportedSize -DriveLetter D
Resize-Partition -DriveLetter D -Size $size.SizeMax