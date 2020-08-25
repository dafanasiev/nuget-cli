# About
This image run [nuget cli](https://nuget.org) as entrypoint.

# Detached [CMS Sign](https://en.wikipedia.org/wiki/Cryptographic_Message_Syntax)

`nuget sign` command doesn't work well in linux, see [nuget issue](https://github.com/NuGet/Home/issues/7939)

```sh
NUGET_SIGN_CERT=$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' cert.pem)
NUGET_SIGN_KEY=$(awk 'NF {sub(/\r/, ""); printf "%s\\n",$0;}' key_nopass.pem)

docker run .... \
    -e NUGET_SIGN_MODE=cms \
    -e NUGET_SIGN_CERT=$NUGET_SIGN_CERT \
    -e NUGET_SIGN_KEY=$NUGET_SIGN_KEY \
    dafanasiev/nuget-cli:xxxx
    pack ..... -OutputDirectory $PWD

```
