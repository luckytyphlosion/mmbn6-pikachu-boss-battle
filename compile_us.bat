TextPet.exe run-script "generateCompressedText.tps"
TextPet.exe run-script "generateText.tps"
TextPet.exe run-script "generateCompressedText_JP.tps"
TextPet.exe run-script "generateText_JP.tps"

TextPet.exe ^
	Load-Plugins "plugins" ^
	Game MMBN6 ^
	Set-Compression Off ^
	Read-Text-Archives "allstars\\text" --recursive --format tpl ^
	Write-Text-Archives "temp\\" --format msg

PixelPet.exe run-script "generateImages.pps"
armips compile.asm -sym "MEGAMAN6_FXX_BR6E00.sym" -equ _version 0