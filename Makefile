all: output/keyrings/heads-keyring.gpg output/sha512sums.txt output/changelog

output/keyrings/heads-keyring.gpg: heads-keyring-gpg heads-keyring-gpg/0x*
	cat heads-keyring-gpg/0x* > output/keyrings/heads-keyring.gpg

output/sha512sums.txt: output/keyrings/heads-keyring.gpg
	cd output; sha512sum keyrings/* > sha512sums.txt

output/changelog: debian/changelog
	cp debian/changelog output/

clean:
	rm -f output/keyrings/*.gpg output/sha512sums.txt output/changelog output/keyrings/*~
