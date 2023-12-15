This project is used in https://github.com/waku-org/go-zerokit-rln to bypass the 500mb limit for go modules
```
git clone https://github.com/waku-org/go-zerokit-rln_arm
cd go-zerokit-rln_arm
git submodule init
git submodule update --recursive
make
```

# Updating zerokit
```bash
export ZEROKIT_COMMIT=master    # Use a commit, branch or tag
cd zerokit
git pull
git checkout ${ZEROKIT_COMMIT}
cd ..
make
git add zerokit
git add libs/*/librln.a
git commit -m "chore: bump zerokit"
git push
```

# Adding a new architecture
1. Edit `./scripts/build.sh` to add the new architecture. Refer to this list of [supported targets](https://github.com/cross-rs/cross#supported-targets)
2. Edit `./rln/link.go` to add a **cgo** build tag for the new architecture
