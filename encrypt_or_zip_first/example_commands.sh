python -c "print 'derp'*1000" > bigderp.txt
cat bigderp.txt
zip smallderp.zip bigderp.txt
gpg --batch --output autocompressderpencrypt.txt.gpg --passphrase herpaderp --symmetric bigderp.txt
gpg --batch --output derpencrypt.txt.gpg --passphrase herpaderp --symmetric --compress-level 0 bigderp.txt
gpg --batch --output zip-then-encrypt.zip.gpg --passphrase herpaderp --symmetric --compress-level 0 smallderp.zip
zip encrypt-then-zip.zip derpencrypt.txt.gpg
xxd -b bigderp.txt
xxd -b smallderp.zip
xxd -b encrypt_then_zip.zip
ent encrypt-then-zip.zip
ent smallderp.zip
ent derpencrypt.txt.gpg
ent zip-then-encrypt.zip.gpg
