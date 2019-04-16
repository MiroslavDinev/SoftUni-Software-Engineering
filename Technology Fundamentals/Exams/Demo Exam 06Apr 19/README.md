Problem 1. Dictionary
=====================

*Gencho is in the library, looking for words and their definitions to fill in
his dictionary in order to be able to crack an encrypted code and find an
ancient relic.*

Your task is to take every word and **insert it** into the dictionary **with its
definition**. A word may have **one or more definitions**. You will receive all
the words and definitions, separated by **" \| "**, and each word and its
definition will be separated by **": "**.

After this you will have to check the words you have in the dictionary. Now you
will receive only words, again separated by **" \| "**. For **each word** you
get you will have to print it and **all of its definitions,** ordered by
**length** of the definition **in descending order** (**if it exists in the
dictionary**) in the following format:

**"{word}:"**

**" –{definition1}"**

**" –{definition2}"**

**" –{definition3}"**

**. . .**

In the end, you will receive one more command, which will be either **"End"** or
**"List"**. If the command is **"End"**, you should break the program. If the
command is **"List"**, you should print all of the words, ordered
alphabetically, separated by space (**" "**).

Input
-----

Three **strings**. The first one will have pairs of words and descriptions,
separated by **" \| "** and each word separated from its description by **":
"**. The second **string** will have only words, separated by **" \| "**. The
third **string** will be a command – either **"End"** or **"List"**.

Output
------

For **each word** that is called you have to print it **with all of its
definitions ordered by their length (descending)**. In the end you have to print
**all the words, ordered alphabetically**, separated by **a single space** if
you have the command **"List"**. For all of the words you have to print them in
the format:

**"{word}:"**

**" –{definition1}"**

**" –{definition2}"**

**" –{definition3}"**

**. . .**

Examples
--------

| **Input**                                                                                                                                                                                                                                                                |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| programmer: an animal, which turns coffee into code \| developer: a magician Pesho \| Gosho List                                                                                                                                                                         |
| **Output**                                                                                                                                                                                                                                                               |
| developer programmer                                                                                                                                                                                                                                                     |
| **Input**                                                                                                                                                                                                                                                                |
| tackle: the equipment required for a task or sport \| code: write code for a computer program \| bit: a small piece, part, or quantity of something \| tackle: make determined efforts to deal with a problem \| bit: a short time or distance bit \| code \| tackle End |
| **Output**                                                                                                                                                                                                                                                               |
| bit -a small piece, part, or quantity of something -a short time or distance code -write code for a computer program tackle -make determined efforts to deal with a problem -the equipment required for a task or sport                                                  |

Problem 2. Deciphering
======================

*Now that Gencho has filled his dictionary, he starts deciphering the old books
to find in which one the relics and their locations are documented.*

You will receive **two lines**. The first one will have an **encrypted string**,
which you will have to decode. On the second line you will receive **two letters
or substrings**, separated by **a single space**.  
First you will have to decode the first line by **reducing** the ASCII value of
each character in it **by 3**. Then you should get the **two substrings** of the
second line. You must find **every** occurrence of the **first substring** in
the now decrypted text and replace it with the **second substring**.

Also, you don't know which book you have taken, so you must check if it is
**valid**. A valid text contains only lowercase letters, from **'d'** onwards,
and the symbols **'{'**, **'}'**, **'\|'**, **'\#'**. If the text is invalid,
you should not try to decipher it and you should print **"This is not the book
you are looking for."**.

Input
-----

Two lines, one with text to decipher and one with two substrings to replace in
the text.

Output
------

One line with the deciphered text.

Examples
--------

| **Input**                                                                           |
|-------------------------------------------------------------------------------------|
| wkhfn\#\|rx\#jhqfkr\#phf\#exw\#\|rxu\#uholf\#lv\#khfgohg\#lq\#hfrwkhu\#sohfhw ec an |
| **Output**                                                                          |
| thank you gencho man but your relic is handled in another planet                    |
| **Input**                                                                           |
| arx\#vkdww\#qrw\#sdvv t l                                                           |
| **Output**                                                                          |
| This is not the book you are looking for.                                           |
