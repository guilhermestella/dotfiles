for file in ~/.zshrc.d/*; do
  [ -f "$file" ] && . "$file"
done
