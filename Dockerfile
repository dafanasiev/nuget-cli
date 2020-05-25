FROM mono:6.8.0

RUN curl -o /usr/bin/nuget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe 	&& \
    chmod +x /usr/bin/nuget

ENTRYPOINT [ "mono", "/usr/bin/nuget" ]
