#!/bin/bash
#dir="tmp"
mkdir "$dir"
# Para cada arquivo `.desktop` incluíndo ocultos (mas não o diretório pai).
for file in .[!.]* *.desktop; do
	# Se for um arquivo
	if [[ -f "$file" ]]; then
		new_name="$(grep -Po "(?<=Name=).*\$" "$file").desktop"
		if [[ "$?" -ne 0 ]]; then
			echo "No \`Name\` property found to $file"
			continue
		fi
		# Renomei-o com base na propriedade `Name` no seu conteúdo
		echo "$file > $new_name"
		#new_path="./$dir/$new_name"
		mv "$file" "$new_name"
	fi
done

