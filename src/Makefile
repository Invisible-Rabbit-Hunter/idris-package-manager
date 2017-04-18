all : git.o git.so

git.o : git.c git.h
	gcc -c git.c

git.so : git.c git.h
	gcc -fPIC -o git.so -shared git.c