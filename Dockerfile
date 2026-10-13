FROM kasmweb/core-ubuntu-noble:1.19.0-rolling-daily
USER root

ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

# Leave empty to install the latest release, or pass e.g. --build-arg DESIGNCRAFT_VERSION=0.7.1
ARG DESIGNCRAFT_VERSION=""

COPY ./src/designcraft $INST_SCRIPTS/designcraft/
RUN DESIGNCRAFT_VERSION=${DESIGNCRAFT_VERSION} bash $INST_SCRIPTS/designcraft/install_designcraft.sh && rm -rf $INST_SCRIPTS/designcraft/

COPY ./src/designcraft/custom_startup.sh $STARTUPDIR/custom_startup.sh
RUN chmod +x $STARTUPDIR/custom_startup.sh

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
