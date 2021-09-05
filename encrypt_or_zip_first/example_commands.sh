#!/bin/bash
#create a very repetitive text file. just the word derp over and over again
python -c "print 'derp'*1000" > bigderp.txt
#compress the file we just made. no encryption
zip smallderp.zip bigderp.txt

#use gpg with a static phrase of "herpaderp" to encrypt the uncompressed file. This will automatically compress the file too.
gpg --batch --output autocompressderpencrypt.txt.gpg --passphrase herpaderp --symmetric bigderp.txt

#use gpg with a static phrase of "herpaderp" to encrypt the uncompressed file. note that this has NO encryption.
gpg --batch --output derpencrypt.txt.gpg --passphrase herpaderp --symmetric --compress-level 0 bigderp.txt

#use gpg with the same static phrase of "herpaderp" to encrypt the file we made and manually compressed with zip.
gpg --batch --output zip-then-encrypt.zip.gpg --passphrase herpaderp --symmetric --compress-level 0 smallderp.zip

#use zip to try to compress the file that we encrypted earlier that had NOT been compressed.
zip encrypt-then-zip.zip derpencrypt.txt.gpg

#use XXD to look at the file that is neither encrypted nor compressed to see the plaintext. 
xxd -b bigderp.txt | head -n 20

#use XXD to look at the zipped file that was not encrypted
xxd -b smallderp.zip | head -n 20

#use XXD to look at the file we encrypted before zipping
xxd -b encrypt_then_zip.zip | head -n 20

#use ent to check the entropy of the file that we encypted and then tried to zip
ent encrypt-then-zip.zip

#use ent to check the entropy of the zipped file with no encryption
ent smallderp.zip

#use ent to check the entropy of the zipped file that was encrypted but never compressed
ent derpencrypt.txt.gpg

#use ent to check the entropy of the file that we zipped and then encrypted
ent zip-then-encrypt.zip.gpg

#use ent to check the entropy of the file we used the default compression that comes with gpg
ent autocompressderpencrypt.txt.gpg

#use ls -al to check file sizes
ls -al
