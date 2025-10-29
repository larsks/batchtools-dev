FROM python:3

ADD https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz /tmp/openshift-client.tar.gz
RUN tar -C /usr/local/bin -xf /tmp/openshift-client.tar.gz
RUN apt -y update && apt -y install rsync && apt clean
COPY requirements.txt /tmp
RUN pip install --root-user-action=ignore -r /tmp/requirements.txt
