<?php
if ($argc < 3) {
	fwrite(STDERR, "pren (preg-rename): preg_replace でカレントディレクトリのファイルをリネームする\n\n");
	fwrite(STDERR, "Usage: pren '/pattern/' 'replacement' [do]\n");
	fwrite(STDERR, "  実行するには最後に do をつけます\n");
	exit;
}
$dir = '.';
$pattern = $argv[1];
$replacement = $argv[2];
$do = ($argv[3] ?? null) === 'do';
$dh = opendir($dir);
if (!$dh) {
	fwrite(STDERR, "ディレクトリ開けん\n");
	exit;
}

while (($file = readdir($dh)) !== false) {
	if ($file === '.' || $file === '..') continue;

	$newFile = preg_replace($pattern, $replacement, $file);
	if ($newFile !== $file) {
		echo "$dir/$file => $dir/$newFile\n";
		if ($do) {
			rename("$dir/$file", "$dir/$newFile");
		}
	}
}
