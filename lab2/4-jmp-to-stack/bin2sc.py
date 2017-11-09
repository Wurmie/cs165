#!/usr/bin/env python
import sys
if __name__ == "__main__":

	shellcode = "\""

	for b in open("readflag.bin", "rb").read():
		shellcode += "\\x" + b.encode("hex")
	shellcode += "\""
print shellcode