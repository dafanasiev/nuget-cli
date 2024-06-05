FROM mono:6.12.0.107

ARG NUGET_VERSION=6.10.0

RUN curl -o /usr/bin/nuget https://dist.nuget.org/win-x86-commandline/v${NUGET_VERSION}/nuget.exe 	&& \
    chmod +x /usr/bin/nuget

COPY "docker-entrypoint.sh" "/docker-entrypoint.sh"

ENTRYPOINT ["/docker-entrypoint.sh"]
