#!/bin/bash
# taken from https://www.openwall.com/lists/oss-security/2024/03/29/4 and adapted
path="$(ldd $(which sshd) | grep liblzma | grep -o '/[^ ]*')"
[ "$path" == "" ] && echo "probably not vulnerable" && exit
if hexdump -ve '1/1 "%.2x"' "$path" | grep -q f30f1efa554889f54c89ce5389fb81e7000000804883ec28488954241848894c2410
then
	echo probably vulnerable
else
	echo probably not vulnerable
fi
