wrk -d 20 -t 10 -c 200 -H "User-Agent: wrk" http://127.0.0.1:3000/stubs\?select\=uid\&id\=eq.1
