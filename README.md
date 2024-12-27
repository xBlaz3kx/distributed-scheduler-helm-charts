# Distributed Scheduler Helm Charts

This repository contains Helm charts for the Distributed Scheduler.

## Prerequisites

You'll need to have installed:

- Kubernetes 1.12+
- Helm v3 (see [Helm installation guide](https://helm.sh/docs/intro/install/))

## Usage

Add the Distributed Scheduler Helm repository:

```bash
helm repo add distributed-scheduler https://distributed-scheduler.ghrc.io/
```

Install the Distributed Scheduler chart:

```bash
helm install distributed-scheduler distributed-scheduler/distributed-scheduler
```

## Configuration

The following table lists the configurable parameters of the Distributed Scheduler chart and their default values.

| Parameter          | Description                            | Default                                               |
|--------------------|----------------------------------------|-------------------------------------------------------|
| `image.repository` | Distributed Scheduler image repository | `ghcr.io/distributed-scheduler/distributed-scheduler` |
| `image.tag`        | Distributed Scheduler image tag        | `latest`                                              |

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull
requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.


