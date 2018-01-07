[![Docker Build Status](https://img.shields.io/docker/build/cryptainer/scorecoin.svg?style=for-the-badge)](https://hub.docker.com/r/cryptainer/scorecoin/)
[![Docker Stars](https://img.shields.io/docker/stars/cryptainer/scorecoin.svg?style=for-the-badge)](https://hub.docker.com/r/cryptainer/scorecoin/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cryptainer/scorecoin.svg?style=for-the-badge)](https://hub.docker.com/r/cryptainer/scorecoin/)

# scorecoin-docker
This is a fully featured docker image for running a scorecoin wallet. It's initial purpose is the operation of a scorecoin masternode.

## Usage

A typical `cryptainer/scorecoin` masternode container can be started as follows:
```bash
docker run \
  -e conf_rpcuser=changeme \
  -e conf_rpcpassword=changeme \
  -e conf_rpcallowip=::/0 \
  -e conf_rpcport=22350 \
  -e conf_server=1 \
  -e conf_staking=0 \
  -e conf_port=17075 \
  -e conf_externalip=<your masternode public ip>
  -e conf_printtoconsole=1 \
  -e conf_masternode=1 \
  -e conf_masternodeaddr=<your masternode public ip>:17075 \
  -e conf_masternodeprivkey=<your masternode privatekey> \
  -v /path/to/data:/data \
  cryptainer/scorecoin
```

### Volumes
* `/data`: The `.Score` directory (blocks, chainstate,...)

### Configuration
The `Score.conf` gets generated on each container start based on the given environment variables prefixed with `conf_`.
For example, to set `masternode=1` you need to run the container as follows:
```bash
docker run -e conf_masternode=1 cryptainer/scorecoin
```

### Troubleshooting
Set `DEBUG=1` in order to have all configuration printed to stdout during container startup.

## Contribute
In order to contribute a patch, the workflow is as follows:

1. Fork repository
2. Create feature branch
3. Commit patches
4. Submit pull request

In general commits should be atomic and diffs should be easy to read. For this reason do not mix any formatting fixes or code moves with actual code changes.

Commit messages should be verbose by default, consisting of a short subject line (50 chars max), a blank line and detailed explanatory text as separate paragraph(s); unless the title alone is self-explanatory (like "Corrected typo in main.cpp") then a single title line is sufficient. Commit messages should be helpful to people reading your code in the future, so explain the reasoning for your decisions. Further explanation [here](http://chris.beams.io/posts/git-commit/).

## License
Released under the MIT license, under the same terms as [Scorecoin](https://github.com/marksteven2017/Scorecoin) itself. See [LICENSE](LICENSE) for more info.

## Donations
Do you like this project and want to say thanks? Your donation is always welcome:

Score: `ShMGN74xmCdTvEwMbUWi1SyJprcjkyFCCr`

Bitcoin: `1DDA5GbMPGpEtmerJeJLTfJsaLennyYTot`