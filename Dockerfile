FROM mono:6.8.0

ARG NUGET_VERSION=5.5.1

RUN curl -o /usr/bin/nuget https://dist.nuget.org/win-x86-commandline/v${NUGET_VERSION}/nuget.exe 	&& \
    chmod +x /usr/bin/nuget

ENTRYPOINT [ "mono", "/usr/bin/nuget" ]
