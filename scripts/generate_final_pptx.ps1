# generate_final_pptx.ps1 - Final Presentation Assembly

$outputPath = "C:\Users\SRI RAMA SAI BHAVANA\desktop\frontend-slides\final_presentation.pptx"
$slideFiles = Get-ChildItem -Filter "slide*.html" | Sort-Object {[int]($_.BaseName -replace 'slide', '')}

Write-Host "Found $($slideFiles.Count) slide files."
Write-Host "Presentation Order:"
foreach ($f in $slideFiles) { Write-Host " - $($f.Name)" }

# Initialize PowerPoint
$ppt = New-Object -ComObject PowerPoint.Application
$pres = $ppt.Presentations.Add()
$pres.PageSetup.SlideSize = 14 # 16:9

foreach ($f in $slideFiles) {
    $content = Get-Content $f.FullName -Raw
    
    # Simple Regex extraction for Title and Subtitle
    $title = ""
    if ($content -match '<h2>(.*?)</h2>') { $title = $matches[1] -replace '<br>', ' ' }
    elseif ($content -match '<h1>(.*?)</h1>') { $title = $matches[1] }
    
    $subtitle = ""
    if ($content -match '<p class="subtitle">(.*?)</p>') { $subtitle = $matches[1] }

    # Add Slide
    $slide = $pres.Slides.Add($pres.Slides.Count + 1, 2) # ppLayoutText
    $slide.FollowMasterBackground = 0
    $slide.Background.Fill.ForeColor.RGB = 0x170602 # Dark Navy
    $slide.Background.Fill.Solid()

    # Title
    $slide.Shapes.Title.TextFrame.TextRange.Text = $title
    $slide.Shapes.Title.TextFrame.TextRange.Font.Color.RGB = 0xFFFFFF
    $slide.Shapes.Title.TextFrame.TextRange.Font.Size = 36

    # Body
    $body = $slide.Shapes.Item(2)
    $bodyText = ""
    if ($subtitle) { $bodyText += "$subtitle`r`n`r`n" }
    
    # Extract list items/cards if any
    $matches = [regex]::Matches($content, '<div class=".*?text">(.*?)</div>|<div class=".*?h">(.*?)</div>|<h3>(.*?)</h3>')
    foreach ($m in $matches) {
        $val = ($m.Groups[1].Value + $m.Groups[2].Value + $m.Groups[3].Value).Trim()
        if ($val -and $val -ne $title) {
            $bodyText += "• $val`r`n"
        }
    }

    $body.TextFrame.TextRange.Text = $bodyText
    $body.TextFrame.TextRange.Font.Color.RGB = 0xCCCCCC
    $body.TextFrame.TextRange.Font.Size = 20
}

# Save
if (Test-Path $outputPath) { Remove-Item $outputPath }
$pres.SaveAs($outputPath)
$pres.Close()
$ppt.Quit()

Write-Host "`nExport Status: SUCCESS"
Write-Host "Total Slides: $($slideFiles.Count)"
Write-Host "Output Location: $outputPath"
