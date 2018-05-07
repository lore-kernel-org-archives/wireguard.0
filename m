Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed297ff1
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 22:10:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9abdedac
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 22:10:29 +0000 (UTC)
Received: from [192.168.112.193] ([84.46.42.142]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0M9wrU-1f9EnE0zkG-00B1aG for
 <wireguard@lists.zx2c4.com>; Tue, 08 May 2018 00:12:52 +0200
To: wireguard <wireguard@lists.zx2c4.com>
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Android app
Message-ID: <03358128-4d1c-d64f-5a90-5a7de94e0309@gmx.net>
Date: Tue, 8 May 2018 00:12:50 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms000608020208050203030801"
Reply-To: vtol@gmx.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a cryptographically signed message in MIME format.

--------------ms000608020208050203030801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

4.9.0-6-amd64 #1 SMP Debian 4.9.88-1 as WG endpoint node
WG 0.0.20180420-1
DHCP no
Firewall off (both ends, except unknown for the GSM provider in between)
wg-quick not utilized
Android 8.1.0 (security patch level april 2018) not rooted
kernel 4.4.78
wg app 0.4.2


- establishing a connection is taking a long time > 1 min
- connection/handshake showing on the debian side but neither peer is=20
ping-able from the other. there is no indicator on the android end to=20
determine whether the connection is actually established, at least not=20
in the wg app.
- connection still showing in debian=C2=A0 even 10 min after the android =
peer=20
disconnected
- if the android peer fails to connect or the debain wg end shut down=20
the lock key symbol is showing in the android status bar, somewhat=20
misleading indicative that there is an actual connection in place whilst =

it is not. slider in the wg app on android remains green colored on the=20
right hand/edge whether the connection is active or not
- in debian the port of the android peer is showing a different port=20
than actually being used by the android app
- connection state of the android peer showing as close in network tool
- no connection status information in the android app


--------------ms000608020208050203030801
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
DKcwggXhMIIEyaADAgECAg8Cbt2Dn+cNP4QmgmDzkCQwDQYJKoZIhvcNAQELBQAwVjELMAkG
A1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UEAxMnU3dpc3NTaWduIFBl
cnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyMB4XDTE1MDcyODEzMTI0MVoXDTIwMDcyODEz
MTI0MVowPTEdMBsGA1UECxMURW1haWwgVmFsaWRhdGVkIE9ubHkxHDAaBgNVBAMUE0VtYWls
OiB2dG9sQGdteC5uZXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC5ASUjAK09
ZNNidaYU+dqDFt9qDwYvCxByPGry3JbqFQBBWqTTEsHvzT+lnqGHqq+orjCtHqylQldPkDjo
cplXz6cbsw4j8YHQXcMT5V9rEyFuq+doP6eOfsvwwXGR45Iuly9Aho4RGjfh80O0CPMCdP39
yceF+dqVN1AQSElweHQUU49IY1IyZXQjoXaP8Qr2/6BlAEAT3XDZqeDwYKGUWWbVSdEhZKwG
p0YyQrazaNMsC5BYFMW/rvzzw1Wa4ByoDgzjjLmr9ydW6oQeuYpCStjZzqlcRFCVCNXDAuyU
EBYd5P16ESG4VhpQ8Mz9GVqNUZYw+zvZ3Js8KOd+wh+7AgMBAAGjggLDMIICvzAOBgNVHQ8B
Af8EBAMCBLAwEwYDVR0lBAwwCgYIKwYBBQUHAwQwHQYDVR0OBBYEFHNiDG+WSt7wCElvgksu
82Yv88f4MB8GA1UdIwQYMBaAFPDHozKRtevKtVh3FadOvhpdYUMlMIH/BgNVHR8EgfcwgfQw
R6BFoEOGQWh0dHA6Ly9jcmwuc3dpc3NzaWduLm5ldC9GMEM3QTMzMjkxQjVFQkNBQjU1ODc3
MTVBNzRFQkUxQTVENjE0MzI1MIGooIGloIGihoGfbGRhcDovL2RpcmVjdG9yeS5zd2lzc3Np
Z24ubmV0L0NOPUYwQzdBMzMyOTFCNUVCQ0FCNTU4NzcxNUE3NEVCRTFBNUQ2MTQzMjUlMkNP
PVN3aXNzU2lnbiUyQ0M9Q0g/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVj
dENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MGEGA1UdIARaMFgwVgYJYIV0AVkBAwEGMEkw
RwYIKwYBBQUHAgEWO2h0dHA6Ly9yZXBvc2l0b3J5LnN3aXNzc2lnbi5jb20vU3dpc3NTaWdu
LVNpbHZlci1DUC1DUFMucGRmMIHZBggrBgEFBQcBAQSBzDCByTBkBggrBgEFBQcwAoZYaHR0
cDovL3N3aXNzc2lnbi5uZXQvY2dpLWJpbi9hdXRob3JpdHkvZG93bmxvYWQvRjBDN0EzMzI5
MUI1RUJDQUI1NTg3NzE1QTc0RUJFMUE1RDYxNDMyNTBhBggrBgEFBQcwAYZVaHR0cDovL3Np
bHZlci1wZXJzb25hbC1nMi5vY3NwLnN3aXNzc2lnbi5uZXQvRjBDN0EzMzI5MUI1RUJDQUI1
NTg3NzE1QTc0RUJFMUE1RDYxNDMyNTAXBgNVHREEEDAOgQx2dG9sQGdteC5uZXQwDQYJKoZI
hvcNAQELBQADggEBAAbOyN+VjfLdPkM7pWiiy0r2Zw0FqfJ0Mh0plsc9LHL/aF1Yaru+Ku7N
DhCnT53sfgM4yqpczWq9M3ZqdV9QO6kWf2xuRqzgmeRYOaMq82zkKNdowVavWK5NnktRTmsk
PT46eGpu46y0fq0xuogA01ji4RaIkNBx+dLAS24mfDDBwmJv64ge9Zw6cnz1Ov09jrDyH+ig
VjcxHia5u3LKcRWvymIGY9NByDJouCbSFMYPZMzWtRvwG/myp0HmaQ+dlFPcGOTpNebyNiTr
hl2IPEUrWC4JqJon4+H2WnQhmViJP43AZtSZY3OvU1Ya/KdMP7Hn2ctdbbO/vNuqN0v9avIw
gga+MIIEpqADAgECAg8FRNZOrR7TNtUyQF0AuTYwDQYJKoZIhvcNAQELBQAwRzELMAkGA1UE
BhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEhMB8GA1UEAxMYU3dpc3NTaWduIFNpbHZl
ciBDQSAtIEcyMB4XDTE0MDkxOTIwMzY0OVoXDTI5MDkxNTIwMzY0OVowVjELMAkGA1UEBhMC
Q0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UEAxMnU3dpc3NTaWduIFBlcnNvbmFs
IFNpbHZlciBDQSAyMDE0IC0gRzIyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
yzmxOYX++smhvMODqQ5KLYRyHv9oxafEHewP16iLEx6z0RaLQNwPU28BPezoZLWX24O8qKjA
hDhYXgMUK+bKMO8AsusTORmSRyohAOVyzcIxYg7MVir/d8RjjJjCb3jXtbbM6X0fM6aRBSr+
0VLW9Oyc/k1MalLhhXZiu7lo5lJj/MEhkZJdGdjcgNEZ40kWVwIOGUSFqynJL/rGbWsKofb3
/2thNRUmlJQCaSVdafe9XmuC2ZAMBvlDBSJJ6zbQIFpjEOM4IdV/FitBikZ68mfopNC6Hn8k
J3WYlEktVsRUM5GdYvnVX95bqRWYnJRTwYDpCRcVtBuAKTKh0K8TpwIDAQABo4ICljCCApIw
DgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFPDHozKRtevK
tVh3FadOvhpdYUMlMB8GA1UdIwQYMBaAFBegzcHkQbY6WzvLRZ29HMKY+oZYMIH/BgNVHR8E
gfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwuc3dpc3NzaWduLm5ldC8xN0EwQ0RDMUU0NDFCNjNB
NUIzQkNCNDU5REJEMUNDMjk4RkE4NjU4MIGooIGloIGihoGfbGRhcDovL2RpcmVjdG9yeS5z
d2lzc3NpZ24ubmV0L0NOPTE3QTBDREMxRTQ0MUI2M0E1QjNCQ0I0NTlEQkQxQ0MyOThGQTg2
NTglMkNPPVN3aXNzU2lnbiUyQ0M9Q0g/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNl
P29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MGEGA1UdIARaMFgwVgYJYIV0AVkB
AwEGMEkwRwYIKwYBBQUHAgEWO2h0dHA6Ly9yZXBvc2l0b3J5LnN3aXNzc2lnbi5jb20vU3dp
c3NTaWduLVNpbHZlci1DUC1DUFMucGRmMIHGBggrBgEFBQcBAQSBuTCBtjBkBggrBgEFBQcw
AoZYaHR0cDovL3N3aXNzc2lnbi5uZXQvY2dpLWJpbi9hdXRob3JpdHkvZG93bmxvYWQvMTdB
MENEQzFFNDQxQjYzQTVCM0JDQjQ1OURCRDFDQzI5OEZBODY1ODBOBggrBgEFBQcwAYZCaHR0
cDovL29jc3Auc3dpc3NzaWduLm5ldC8xN0EwQ0RDMUU0NDFCNjNBNUIzQkNCNDU5REJEMUND
Mjk4RkE4NjU4MA0GCSqGSIb3DQEBCwUAA4ICAQDDeadXt3utUWj1RIxBlSgBfHTWO2q8be+n
1005mR1ojcoI2dBxsRk1k2+CxhxJuFHuTPlsCm/Ypfv++zBeANKUq8QSUbqqiqtq3RnXK0r3
FrJrUc90Wymic96X/thPICF9aQywUOWNWIyALuUXHN1jeqrvBfnDaZ7kjHFiXELuOvLN4BLv
i1zpzlMoMuyVCxlUoiGN+n9Qp0+8GXuya4wpP3c+yiPHaVpBnX1mMW96cXnaqWU663/XENUL
X1QZfM43JSSEUNCvQDTCX5LiepHzL0JHG588QvvZX6W8cEWO76A5kPWheGzXwGdZGeEA3lz8
eOhP3buskS5yi/zqR29DKLy7uY6UvvpQ3VCTG0wYtnb/w0cKWbTNbVXYarZfyS/BlDY+vq5A
NQYg7eACTC00RQ5Dr6L02JAV5dDAm0RArjyPk1G8mWhzaXt1WJm31ARP3/GCcREde/wTHXdl
VWPXUnJ83TFHhqeV2KwmcT0j5hI79H+alob+K+qg8yYNdcYWjDEg5xFHoeeparClsoEe3D3Q
oeNu1fBmphx915KITQAHC3Hnc+dz5FRlafw3jfEeb3Dup2yzUkVnWdYFSLEh6Zco2dn0tKag
ZyM2vGBHDlwof12TijG6jTE2FMd6Qp1vIMFsKvgWD2rZAJQyuz1VscXDoQ2xeXdUHeAzgn7u
6jGCA2UwggNhAgEBMGkwVjELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEw
MC4GA1UEAxMnU3dpc3NTaWduIFBlcnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyAg8Cbt2D
n+cNP4QmgmDzkCQwDQYJYIZIAWUDBAIBBQCgggHNMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
BwEwHAYJKoZIhvcNAQkFMQ8XDTE4MDUwNzIyMTI1MFowLwYJKoZIhvcNAQkEMSIEIK1+XGHt
VGEHiW9+ce691k0F8jF4CRvSFdkNakc24L5qMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYBBAGCNxAEMWswaTBWMQswCQYD
VQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMTAwLgYDVQQDEydTd2lzc1NpZ24gUGVy
c29uYWwgU2lsdmVyIENBIDIwMTQgLSBHMjICDwJu3YOf5w0/hCaCYPOQJDB6BgsqhkiG9w0B
CRACCzFroGkwVjELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UE
AxMnU3dpc3NTaWduIFBlcnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyAg8Cbt2Dn+cNP4Qm
gmDzkCQwDQYJKoZIhvcNAQEBBQAEggEAWC/vvmVTgRO6vVlLiGr5udwr3hiioOmD13nGfc0v
usk4anY8qIGnSq4Cmha3yW2xVaMzFglY1uQcDpQAmxbMyHwV6i6BLGFjejHEKS5q1KhKSvSW
kmTmfpftkU418z61t7ulbNj/pSfraAQPSCGIeQg9oVUPT1mUSinRXyD3tdQHkR6J+WgGuMC/
nrfL4I/uAdi8T4RxsCK0PHxy+vOFO++YG0iGPHfe6NQM7Z7Y0h3+eXw6pPvmgQzFtoYFjSd8
jru3AYzHVUA/nJ5OCta45WVH3aEeueRMZ5OqtbkAGmR7yFTGJAfnU27dEADnl/oJ+43EOmg1
QvpWDEa9R6l5kAAAAAAAAA==
--------------ms000608020208050203030801--
