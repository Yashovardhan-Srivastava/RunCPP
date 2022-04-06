#!/bin/bash
echo "[INFO]: The Following files are currently present in the directory: ${pwd}"
ls
while getopts f: flag
do
    case "${flag}" in 
        f) file=${OPTARG} ;;
    esac
done

echo $file

readarray -d . -t arr <<< "$file"

OFile="${file%.*}.out" 

echo "[INFO]: Compiling the program."

g++ ${file} -o ${OFile}

echo "[INFO]: Compilation Completed. Now launching: ${OFile}"

"./${OFile}"
