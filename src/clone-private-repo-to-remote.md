1. Generate key on remote `sudo ssh-keygen`
2. Copy created ssh to local machine `scp obaranovkyi@192.168.99.101:~/.ssh/id_rsa.pub .`
3. Open github > settings > deploy keys and add that public key 
4. On remote clone it using ssh link for example: `git@github.com:obaranovskyi/cmdenglishassist.git`
