# __           __         __     ______              __                _______
#|  |--.---.-.|  |_.----.|  |--.|   __ \.---.-.----.|  |--.-----.----.|   |   |.-----.-----.-----.----.
#|  _  |  _  ||   _|  __||     ||   __ <|  _  |  __||    <|  -__|   _||   |   ||  _  |  _  |  -__|   _|
#|_____|___._||____|____||__|__||______/|___._|____||__|__|_____|__|  |_______||   __|   __|_____|__|  
#                                                                              |__|  |__|
# Batch Backup Script for Linux 
# By WinterLily 
# https://github.com/WinterLily/batchBackerUpper.sh
#
# Get directory information
#
## Get source directory
#
defaultSource=$(pwd)
echo "[?] - Please enter the directory you'd like to backup: [Default: $defaultSource]"
echo "[?][?] - Relative filepaths will sometimes result in an error, but should still work in most cases."
read sourceDir
#
if [$sourceDir = ""]; then
  echo "[-][-] - No directory entered, defaulting to $defaultSource..."
  sourceDir="$defaultSource"
fi
if [ ! -d "$sourceDir" ]; then
  echo "[!][!] - Directory does not exist, exiting..."
  exit 1
fi
#
## Get destination directory
#
defaultDestination=$(pwd)
#
echo "[?] - Please enter the directory you'd like to backup: [Default: $defaultDestination]"
echo "[?][?] - Relative filepaths will sometimes result in an error, but should still work in most cases."
read backupDir
#
if [$backupDir -eq ""]; then
  echo "[-][-] - No directory entered, defaulting to $defaultDestination..."
  backupDir="$defaultDestination"
fi
if [ ! -d "$backupDir" ]; then
  echo "[!][!] - Directory does not exist, exiting..."
  exit 1
fi
#
# Get user input for find command
#
echo "[?] - Please enter a regex string for the files you want to backup:"
read fileRegex
#
# Test File Regex
#
testFind=$(find $sourceDir -type f -name "$fileRegex")
if [ "$testFind" = "" ]; then
  echo "[!][!] - No files found matching regex, exiting..."
  exit 1
fi
#
echo $testFind
echo "[?] - The above files will be backed up, are you sure you'd like to continue? (y/n)"
read filesConfirm
#
if [ "$filesConfirm" != "y" ]; then
  echo "[!][!] - Cancelling backup operation..."
  exit 1
fi
#
# Run backup
#
echo "[+] - Backing up files..."
for file in $(find $sourceDir -type f -name "$fileRegex")
do
    dateSuffix=$(date -r $file -u +"%Y%m%d%H%M%S")
    echo "[+][+] - File last modified at: $dateSuffix"
    echo "[+][+] - Backing up $file to $backupDir/${file##*/}.$dateSuffix"
    cp -p "$file" "$backupDir/${file##*/}.$dateSuffix"
    echo "[+][+] - Backup file info:"
                ls -l "$backupDir/${file##*/}.$dateSuffix"
done
