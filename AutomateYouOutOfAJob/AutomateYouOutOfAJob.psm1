Get-ChildItem -Path Public
| ForEach-Object {
    . $PSItem
}
