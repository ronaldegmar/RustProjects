FROM ubuntu:18.04
MAINTAINER Ronald Barrios 

RUN apt-get update && apt-get install -y \
        apt-transport-https \
	    ca-certificates \
	    curl \
	    wget \
	    vim \
	    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH
ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8080
ENV USER=root
RUN cargo new app --bin --vcs none
WORKDIR /app
RUN rustup override set nightly
COPY Cargo.toml ./
COPY src/main.rs ./src/
RUN cargo build
CMD ["cargo", "run"]


# docker run --name rust -d ubuntu:18.04 /bin/bash -c "while true; do ping 8.8.8.8; done"
# docker run --name rust -d rust-rdbr:1.1 /bin/bash -c "while true; do ping 8.8.8.8; done"
# docker run --name rocket -d -p 8080:8080 rocket-rdbr:1.0
