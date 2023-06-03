* `curl cheat.sh` - Show how to use cheat.sh
* `curl cheat.sh/ls` - Show the cheat list for the 'ls' command
* `curl -s https://raw.githubusercontent.com/obaranovskyi/cmdenglishassist/main/install.sh | bash /dev/stdin` - Run remote bash script
* `curl -I https://...` - Fetch the headers only

## More examples:

```bash
curl -X POST http://localhost:3000/posts        \
  -H 'Content-Type: application/json'           \
  -d '{ "title": "new-post", "author": "some author" }'


curl -X PUT http://localhost:3000/posts/2       \
  -H 'Content-Type: application/json'           \
  -d '{ "title": "new-post-updated", "author": "some author updated" }'

curl -X DELETE http://localhost:3000/posts/1
```

