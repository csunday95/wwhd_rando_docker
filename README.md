## DKP latest WUT build image

### Requirements
 - Docker installed on your system

### To Build Locally

`docker build -t [desired-image-tag] .`

### To retrieve from Github Packages

 - create a Github [Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) with at least `read:packages` permission scope
 - run `cat ~/TOKEN.txt | docker login https://docker.pkg.github.com -u USERNAME --password-stdin` [as recommended](https://docs.github.com/en/packages/guides/configuring-docker-for-use-with-github-packages#authenticating-to-github-packages) with the generated personal access token
 - run `docker pull docker.pkg.github.com/csunday95/wwhd_rando_docker/wwhd_rando_build:latest` or for whichever 
 desired tagged image

### to build target 

The default behavior of the container is to build whatever wut project is mounted to the `/src` volume.
A project build may then be executed with:

`docker run -v "$(pwd):/src" docker.pkg.github.com/csunday95/wwhd_rando_docker/wwhd_rando_build:latest`

or, if you built the image locally:

`docker run -v "$(pwd):/src" [image-tag-from-above]`

By default, `build.sh` will run, which will create a `build` directory in the directory you mounted to 
`/src` and build the project in place there. Currently the build system assumes the wut CMAKE setup, but
the pure make system may be supported later.
