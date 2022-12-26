# generate a recipe file for dependencies
FROM --platform=linux/amd64 rust as planner
WORKDIR /usr/src/app
RUN cargo install cargo-chef
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

# build dependencies
FROM --platform=linux/amd64 rust as cacher
WORKDIR /usr/src/app
RUN cargo install cargo-chef
COPY --from=planner /usr/src/app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json

# use rust docker image as builder
FROM --platform=linux/amd64 rust as builder
COPY . /usr/src/app
WORKDIR /usr/src/app
COPY --from=cacher /usr/src/app/target target
COPY --from=cacher /usr/local/cargo /usr/local/cargo

FROM --platform=linux/amd64 gcr.io/distroless/cc-debian11 as development

COPY --from=builder /usr/src/app/target/release/actix-sqlx-docker /usr/src/test-app/actix-sqlx-docker
WORKDIR /usr/src/app

CMD ["./actix-sqlx-docker"]
