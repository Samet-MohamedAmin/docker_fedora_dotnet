# fedora/dotnet docker image
fedora image to compile and execute csharp programs.
based on `fedora:29` image using `mono`.

## How to run
after pulling the image from docker hub: https://hub.docker.com/r/sametma/dotnet  
`docker pull sametma/dotnet`

### Test
The default command of the image is test running a simple c# hello wrold program `/root/Test.cs`.
``` bash
[MohamedAmin@samet dotnet]$ sudo docker run sametma/dotnet
Hello Mono World
```

### compile and run c# programs
`docker run -v $DIR:/dotnet -e FILE=$FILE sametma/dotnet <command>`
where:
- `$DIR`: absolute path for where your c# code exist
- `$FILE`: is the name of the file inside `$DIR` to compile or to execute **without .cs or .exe extension**
- `<command>`: can have three values:
    - `c` : compile
    - `x` : execute
    - `cx`: compile and execute
    
    
### compile multiple times
Loading a container each compilation may be really exhausting. So you can run a container in detached mode (in background) and execute sequential compilation without reloading a container each time.
- run in background: `docker run -v $DIR:/dotnet -e FILE=$FILE sametma/dotnet --name <container_name> -it -d bash` 
- execute commands: `docker exec <container_name> <command>`

## What's next?
- [ ] make a lightweight image
- [ ] add support for multiple dotnet applications (asp, core, microsfot tools)
 
