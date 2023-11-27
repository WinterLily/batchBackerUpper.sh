# batchBackerUpper.sh

This script is a batch backup tool for Linux systems. It allows you to easily backup files from a specified directory to a destination directory. The script prompts you to enter the source directory you want to backup from, as well as the destination directory where the backups will be stored. You can also specify a regex pattern to select specific files for backup.

## Prerequisites

- Linux operating system
- Bash shell

## Usage

1. Clone or download the backBackerUpper.sh script from [GitHub](https://github.com/WinterLily/batchBackerUpper.sh).
2. Open a terminal and navigate to the directory where the script is located.
3. Ensure that the script is executable:    
    ```
    chmod +x batchBackerUpper.sh
    ```
4. Run the script by executing the following command:
    
    ```
    ./batchBackerUpper.sh
    ```
    
5. Follow the prompts to enter the source directory, destination directory, and file regex pattern.
6. Review the list of files to be backed up and confirm the operation.
7. The script will create backups of the selected files in the specified destination directory with a date suffix appended to the filenames.

## Notes

- Ensure that you have the necessary permissions to read the files in the source directory and write to the destination directory.
- Relative filepaths may sometimes result in an error, but should still work in most cases.
- The script uses the `cp` command with the `p` option to preserve the file attributes (e.g., permissions, timestamps) during the backup process.

## Disclaimer

This script is provided as-is without any warranty. Use it at your own risk.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
