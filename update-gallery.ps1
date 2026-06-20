$ErrorActionPreference = "Stop"

$categories = [ordered]@{
    torta = "images/torta"
    mezeskalacs = "images/mezeskalacs"
    cukorvirag = "images/cukorvirag"
    sutemenyek = "images/sutemenyek"
    ajandekok = "images/ajandekok"
    versenyek = "images/versenyek"
}

$extensions = @(".jpg", ".jpeg", ".png", ".webp")
$output = @()

$output += "window.galleryData = {"

foreach ($category in $categories.GetEnumerator())
{
    $folder = Join-Path $PSScriptRoot $category.Value
    $files = @()

    if (Test-Path -LiteralPath $folder)
    {
        $files =
            Get-ChildItem -LiteralPath $folder -File |
            Where-Object { $extensions -contains $_.Extension.ToLowerInvariant() } |
            Sort-Object Name
    }

    $output += "    $($category.Key): ["

    foreach ($file in $files)
    {
        $src =
            "$($category.Value)/$($file.Name)" -replace "\\", "/"

        $altName =
            [System.IO.Path]::GetFileNameWithoutExtension($file.Name) -replace "[-_]+", " "

        $output += "        { src: ""$src"", alt: ""$altName"" },"
    }

    $output += "    ],"
}

$output += "};"

Set-Content -LiteralPath (Join-Path $PSScriptRoot "gallery-data.js") -Value $output -Encoding UTF8
