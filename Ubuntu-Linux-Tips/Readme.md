### Index

1. [Count lines on files](#count-lines-on-files)


***

### Count lines on files

[Source](http://cmdlinetips.com/2011/08/how-to-count-the-number-of-lines-words-and-characters-in-a-text-file-from-terminal/)

To count the number of lines, use “wc” with “l” as
```
wc -l yourTextFile
wc -l *
```
To count the number of words, use “wc” with “w” option as
```
wc -w yourTextFile
```
And to count the total number of characters, use “wc” with “c” as
```
wc -c yourTextFile
```
#### More Counting: Count a Certain Type of Files in a Directory

One can also cleverly use the “wc” command on terminal and find the number of files (or files of certain type) in a directory. For example, to find the number of pdf files in a directory
```
ls -l *.pdf | wc -l
```

