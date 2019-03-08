#/bin/sh



if test $# -ne 1
then
  echo "Set a directory name"
  exit
fi

directory=$1
process="./replace_string_in_file.py"
target="C"


echo $directory

for file in $(ls $directory)
do
  file=`echo $file`
  extension=`echo ${file##*.}` ## -> extension only
  nameonly=`echo ${file%.*}`  ## -> filename without the extension
  fullname="$directory/$file"
  
  #echo $file
  #echo $extension
  #echo $nameonly
  #echo $fullname

  if test "$extension" = "$target"
  then
    cmd=`printf "$process $fullname"`
    echo $cmd
    eval $cmd
  fi


done
