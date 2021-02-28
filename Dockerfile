FROM alpine:latest AS builder

# Add deps
RUN apk --no-cache add \
         autoconf \
         build-base \
	 gcc \
         git \
         make \
         musl-dev \
         libsodium-dev

# Clone source from GitHub
RUN git clone --depth 1 https://github.com/cathugger/mkp224o.git /usr/src/mkp224o

# Build
WORKDIR /usr/src/mkp224o
RUN ./autogen.sh
# x86_64 optimised configure options taken from OPTIMISATION.txt file in Git repo
RUN ./configure --enable-amd64-51-30k --enable-intfilter
RUN make

# Runtime Container
FROM alpine:latest
LABEL name "mkp224o"
LABEL version "2.27.2021"

COPY --from=builder /usr/src/mkp224o/mkp224o /usr/bin/mkp224o

RUN apk --no-cache add libsodium

WORKDIR /tmp

ENTRYPOINT ["/usr/bin/mkp224o"]
CMD ["-f","/wordlist.txt","-d","/results","-s","-v"]
