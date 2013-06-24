function help {
   echo "$0 <directory> <file to watch> <script to execute>"
}

if [ "$#" -ne 3 ]; then
   help
   exit 1
fi

while true; do
  change=$(inotifywait -e close_write $1)
  echo $change
  change=${change#./ * }
  if [ "$change" = "$2" ]; then ./$3; fi
done
