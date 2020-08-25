#!/usr/bin/env bash

set -e

mono /usr/bin/nuget "$@"

if [ "$NUGET_SIGN_MODE" == "cms" ];then
    if [ "$1" == "pack" ] || [ "$1" == "sign" ];then
        if [ -z ${NUGET_SIGN_CERT+x} ]; then
            echo "WARN: Output not signed: no sign certificate"
            exit 1
        fi

        if [ -z ${NUGET_SIGN_KEY+x} ]; then
            echo "WARN: Output not signed: no sign key"
            exit 2
        fi

        i=1;
        OutputDirectory="."
        for k in "$@"
        do
        i=$((i + 1));
        case "${k,,}" in
            -outputdirectory)  OutputDirectory=${!i}; break;; 
            *)                                             ;;
        esac
        don
        echo "Singing all files in [$OutputDirectory] ..."
        echo -e $NUGET_SIGN_CERT > /tmp/cert.pem
        for nupkg in $OutputDirectory/*.nupkg; do
            [ -e "$nupkg" ] || continue
            echo "Processing: $nupkg"
            echo -e $NUGET_SIGN_KEY | openssl cms -sign -signer /tmp/cert.pem -inkey - -md sha256 -binary -noattr -outform PEM -md sha256 -nocerts -in "$nupkg" -out "$nupkg.sig"
        done

    fi
fi
