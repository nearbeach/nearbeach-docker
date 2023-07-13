# syntax=docker/dockerfile:1
ARG TARGET_BRANCH=main
FROM robotichead/nearbeach-base:$TARGET_BRANCH

RUN echo "**** install NearBeach Latest ****" && \
    pip install NearBeach

# Create the private folder directory
RUN echo "**** Making private directory *****" && \
    mkdir oceansuite && \
    mkdir oceansuite/private

# Setup of Working Directory
WORKDIR /oceansuite
RUN chown nearbeach:nearbeach /oceansuite
    
USER nearbeach
# Copy everything into the destination
COPY --chown=nearbeach:nearbeach . .
RUN chmod u+x setup_db_and_run_server.sh

CMD './setup_db_and_run_server.sh'
