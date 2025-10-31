FROM python:3

ADD https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz /tmp/openshift-client.tar.gz
RUN tar -C /usr/local/bin -xf /tmp/openshift-client.tar.gz

# Install pause command
COPY --from=gcr.io/google_containers/pause:latest /pause /bin/
# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt -y update && \
  apt -y install \
    git \
    rsync \
    vim && \
  apt clean

# Set working directory to a path that will stable
# writable by default on OpenShift
WORKDIR /tmp
