FROM fedora:29

RUN dnf update -y
RUN dnf install mono-devel -y

RUN dnf clean all

USER root

# add compile and execute aliases
RUN echo -e '#!/bin/bash\nmcs $DIR/$FILE.cs' > /usr/bin/c
RUN echo -e '#!/bin/bash\nmono $DIR/$FILE.exe' > /usr/bin/x
RUN echo -e '#!/bin/bash\nc && x' > /usr/bin/cx

RUN chmod +x /usr/bin/{c,x,cx}

# environment variables
ENV DIR=/dotnet
ENV FILE=Test

WORKDIR $DIR

# just for testing
COPY Test.cs /root/test/Test.cs
RUN mcs /root/test/$FILE.cs

CMD [ "mono", "/root/test/Test.exe" ]

