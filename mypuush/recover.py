import sys

argin = sys.argv
linkfile = argin[1]
f = open(linkfile)
lines = f.readlines()
f.close
hasLink = False
i = -1
for line in reversed(lines):
    if len(line.split()) > 1:
        myline = line.split()[2]
        hasLink = True
        break
if not(hasLink):
    print(3)
    exit(3)
print(myline)
