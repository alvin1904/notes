To display information about the file system usage

```
df -Th
```

To display sorted list of installed applications.

```
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
```
