# syntax=docker/dockerfile:1
ARG TARGET_BRANCH=main
FROM robotichead/nearbeach-base:$TARGET_BRANCH

RUN echo "**** install NearBeach Latest ****" && \
    pip install NearBeach

RUN echo "**** copy over the crontab configuration ****"
COPY --chown=nearbeach:nearbeach crontab /etc/crontabs/nearbeach

RUN echo "**** setup of working directory ****"
WORKDIR /oceansuite
RUN chown nearbeach:nearbeach /oceansuite

USER nearbeach

RUN echo "**** copy everything into the destination ****"
COPY --chown=nearbeach:nearbeach . .
RUN chmod u+x setup_db_and_run_server.sh

RUN echo "**** run the setup database and run server scripts ****"
CMD './setup_db_and_run_server.sh'
