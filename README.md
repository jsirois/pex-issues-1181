To try this demo out:

1. Build and run the app:
    ```
    $ ./demo.sh 
    Requirement already satisfied: pip in ./pex.venv/lib/python3.7/site-packages (20.3.3)
    Requirement already satisfied: pex==2.1.24 in ./pex.venv/lib/python3.7/site-packages (2.1.24)
    Sending build context to Docker daemon  35.59MB
    Step 1/4 : FROM docker.io/nginx/unit:1.21.0-python3.7
     ---> 0c9cddb57740
    Step 2/4 : RUN apt update && apt install -y python3 python3-distutils
     ---> Using cache
     ---> 8da196b090b3
    Step 3/4 : COPY apigateway.pex /app.pex
     ---> Using cache
     ---> 51a89695cd78
    Step 4/4 : RUN PEX_TOOLS=1 ./app.pex venv /app
     ---> Using cache
     ---> 39cfb7e1c0b0
    Successfully built 39cfb7e1c0b0
    Successfully tagged pex-issues-1181:latest
    /usr/local/bin/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, launching Unit daemon to perform initial configuration...
    2021/01/20 18:19:01 [info] 11#11 unit started
    2021/01/20 18:19:01 [info] 13#13 discovery started
    2021/01/20 18:19:01 [notice] 13#13 module: python 3.7.3 "/usr/lib/unit/modules/python3.7.unit.so"
    2021/01/20 18:19:01 [info] 12#12 controller started
    2021/01/20 18:19:01 [notice] 12#12 process 13 exited with code 0
    2021/01/20 18:19:01 [info] 16#16 router started
    2021/01/20 18:19:01 [info] 16#16 OpenSSL 1.1.1d  10 Sep 2019, 1010104f
    {
      "certificates": {},
      "config": {
        "listeners": {},
        "applications": {}
      }
    }
    /usr/local/bin/docker-entrypoint.sh: Looking for certificate bundles in /docker-entrypoint.d/...
    /usr/local/bin/docker-entrypoint.sh: Looking for configuration snippets in /docker-entrypoint.d/...
    /usr/local/bin/docker-entrypoint.sh: Applying configuration /docker-entrypoint.d/config.json
    /usr/local/bin/docker-entrypoint.sh: OK: HTTP response status code is '200'
    {
      "success": "Reconfiguration done."
    }

    /usr/local/bin/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/...
    /usr/local/bin/docker-entrypoint.sh: Stopping Unit daemon after initial configuration...
    /usr/local/bin/docker-entrypoint.sh: Waiting for control socket to be removed...
    2021/01/20 18:19:01 [notice] 12#12 process 15 exited with code 0
    2021/01/20 18:19:01 [notice] 12#12 process 16 exited with code 0

    /usr/local/bin/docker-entrypoint.sh: Unit initial configuration complete; ready for start up...

    2021/01/20 18:19:01 [info] 1#1 unit started
    2021/01/20 18:19:01 [info] 35#35 discovery started
    2021/01/20 18:19:01 [notice] 35#35 module: python 3.7.3 "/usr/lib/unit/modules/python3.7.unit.so"
    2021/01/20 18:19:01 [info] 1#1 controller started
    2021/01/20 18:19:01 [notice] 1#1 process 35 exited with code 0
    2021/01/20 18:19:01 [info] 37#37 router started
    2021/01/20 18:19:01 [info] 37#37 OpenSSL 1.1.1d  10 Sep 2019, 1010104f
    ```

2. Test the app:
    ```
    $ curl -s localhost:8000 | jq .
    {
      "Hello": "World"
    }
    $ curl -s localhost:8000/items/42?q=Slartibartfast | jq .
    {
      "item_id": 42,
      "q": "Slartibartfast"
    }
    ```

