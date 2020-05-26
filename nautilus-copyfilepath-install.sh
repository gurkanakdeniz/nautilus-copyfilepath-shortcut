# !/bin/sh

nautilusconfigpath=~/.config/nautilus/
filename="scripts-accels"
shortcut="<Control><Shift>c copypath"
FILE=~/.config/nautilus/$filename
if [ -f "$FILE" ]; then
   if grep -q "$shortcut" "$nautilusconfigpath$filename" ; then 
      echo "copypath shortcut found ignore shortcut write.."
   else
      echo "\n$shortcut" >> "$nautilusconfigpath$filename"
   fi
else 
   touch $nautilusconfigpath$filename
   echo -n "$shortcut" >> "$nautilusconfigpath$filename"
fi

nautilusscriptpath=~/.local/share/nautilus/scripts/
filename="copypath"

rm -rf $nautilusscriptpath$filename
touch $nautilusscriptpath$filename
chmod +x $nautilusscriptpath$filename

echo -n '# !/bin/sh

filepath="$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"
echo -n "$filepath" | tr -d '"'"'\\n'"'"' | xsel -b -i' >> $nautilusscriptpath$filename

nautilus -q

echo "success return of the jedi o-o-"
