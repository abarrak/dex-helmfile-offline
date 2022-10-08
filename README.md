# Dex Helmfile - Offline Example

A helm release repo for deploying dex server in offline environment (no internet).

# Deployment

```bash
$ ./offline.sh
$ export $(cat .env | xargs)
$ helmfile fetch
$ helmfile build > ./output/final-$(date +%Y-%d-%m-at-%H-%M).yml
```

In case `helmfile` binary is not available in the target environment, just template plain manifests.

```bash
$ helmfile template > ./output/plain-final-$(date +%Y-%d-%m-at-%H-%M).yml
```

Finally, on the production node load the offline `./output` directory and sync or apply the change.


# Usage

Pass the API server aguments as follows:

```bash
--oidc-issuer-url=https://internal.cluster.lan/auth
--oidc-client-id=kubernetes
--oidc-username-claim=email
--oidc-groups-claim=groups
--oidc-groups-prefix='oidc:'
```

Use `kubelogin` script to issue credentials for end users.

# Author

Abdullah Barrak (@abarrak).
