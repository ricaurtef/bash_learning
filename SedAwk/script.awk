# Input file: /etc/passwd
# List each user's home directory in the passwd file.

# Author: Ruben Ricaurte <ricaurtef@gmail.com>

{
    text = "'s home directory is"
    print $1 text, $6
}
