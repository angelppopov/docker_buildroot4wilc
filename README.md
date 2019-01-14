# **Buildroot4wilc Dockerfile**

![License][mit-image]

## `Dockerfile` to create an image for Buildroot

Create to run under Ubunutu `16.04` host because Ubunutu `18.04` caused build issues.

### Target Environment

`SOM-EK and the WILC3000-SD`

### View images

```bash
docker images
```

### View running containers

```bash
docker ps
```

### View all containers

```bash
docker ps -a
```

### What's a Docker Image

```text
An image is an inert, immutable, file that's essentially a snapshot of a container.
Images are created with the build command, and they'll produce a container when started with run.
Images are stored in a Docker registry such as registry.hub.docker.com.
Because they can become quite large, images are designed to be composed of layers of other images,
allowing a miminal amount of data to be sent when transferring images over the network.

*The key benefit of Docker is that it allows users to package an application
with all of its dependencies into a standardized unit for s/w development.
```

> `Containers provide most of the isolation of virtual machines at a fraction of the computing power`

See [Docker Tutorial](https://docker-curriculum.com) for more info.

### Docker commands

```bash
# Build Docker image
docker build -t buildroot4wilc .

# Run Docker
docker run -w /home -it buildroot4wilc bash

# List Docker images
docker images -a

# Purging all unused / dangling images, containers, volumes & networks
docker images -f dangling=true
docker system prune
docker system prune -a

# Remove a Docker image
docker rmi Image Image

# Delete all containers
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)
```

### *Notes*

* Image size: ~ 8.5 GB
* An instance of an image is called a container.
* Object ~ instance of a Class.
* Container ~ instance of a Image.
* Image is the `Recipe` && Container is the `Cake`

#### Links

* [Buildroot](https://buildroot.org/)
* [How_to_build_Buildroot_for_AT91](http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRootBuild#How_to_build_Buildroot_for_AT91)
* [SAMA5D27-SOM1-EK1](https://www.microchip.com/developmenttools/ProductDetails/ATSAMA5D27-SOM1-EK1)
* [WILC3000-SD](https://www.microchip.com/developmenttools/ProductDetails/PartNO/AC164158)

### `Todo`

> gitlab.com
* Write ci script & run ci/cd on local-machine ( gitlab-ci)

> github.com
* Configure for Travis (CI/CD)

### HISTORY

* 0.0.2 - Maintain in Github now.  Minor text edits.

* 0.0.1 - Initial release.

[npm-image]: https://img.shields.io/npm/v/markdownlint.svg
[npm-url]: https://www.npmjs.com/package/markdownlint
[travis-image]: https://img.shields.io/travis/DavidAnson/markdownlint/master.svg
[travis-url]: https://travis-ci.org/DavidAnson/markdownlint
[coveralls-image]: https://img.shields.io/coveralls/DavidAnson/markdownlint/master.svg
[coveralls-url]: https://coveralls.io/r/DavidAnson/markdownlint
[license-image]: https://img.shields.io/npm/l/markdownlint.svg
[license-url]: https://opensource.org/licenses/MIT
[mit-image]: https://img.shields.io/badge/license-MIT-brightgreen.svg

[1]: https://buildroot.org/downloads/manual/manual.html#outside-br-custom
[2]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[3]: https://buildroot.org/docs.html
[4]: http://www.at91.com/linux4sam/bin/view/Linux4SAM/SDCardBootNotice
[5]: https://etcher.io/

[comment]: <> (Badges --> https://shields.io/#/)
[comment]: <> (Markdown --> https://github.com/DavidAnson/markdownlint)
[comment]: <> (Table generator: https://www.tablesgenerator.com/markdown_tables#)
[comment]: <> (Markdown --> https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#emphasis)
