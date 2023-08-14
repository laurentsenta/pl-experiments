# a simple container that takes 3 args and generate a shell script that prints them
FROM alpine:3.12.0

ARG ARG_1=defaul_1
ARG ARG_2=defaul_2
ARG ARG_3=defaul_3

RUN echo "#!/bin/sh" > /script.sh
RUN echo "echo \"arg1: $ARG_1\"" >> /script.sh
RUN echo "echo \"arg2: $ARG_2\"" >> /script.sh
RUN echo "echo \"arg3: $ARG_3\"" >> /script.sh
# also echo the shell args
RUN echo "for arg in \"\$@\"" >> /script.sh
RUN echo "do" >> /script.sh
RUN echo "  echo \"arg: \$arg\"" >> /script.sh
RUN echo "done" >> /script.sh

RUN chmod +x /script.sh

ENTRYPOINT ["/script.sh"]