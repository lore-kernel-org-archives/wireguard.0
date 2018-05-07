Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 103f1904
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 16:32:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49679469
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 16:32:14 +0000 (UTC)
Received: from [192.168.112.193] ([149.233.207.110]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LzskF-1eCXgu2VQx-0153xa
 for <wireguard@lists.zx2c4.com>; Mon, 07 May 2018 18:34:36 +0200
Subject: Re: WG interface to ipv4
To: wireguard <wireguard@lists.zx2c4.com>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net> <874ljk24jh.fsf@toke.dk>
 <dfcc55c3-795b-dfa2-7034-74b537519ea4@gmx.net>
 <7qQvJLeSZV3rJnkg9rIdA6yznDPzhIFVR_qUa0hBhmCdr_onJsjzXvKVIlp-ovJiRaX1eENGmtrtcZ_7xsHY7heX2qOvouN8pXTt_J3RurQ=@protonmail.ch>
 <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
 <CAHLp1Y=3n-b2x+51hv2-4w2w4_GdLAwKZ00jhKvPGHg+-PiWPg@mail.gmail.com>
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Message-ID: <153cabd7-f27d-0886-53ba-f4c620af409b@gmx.net>
Date: Mon, 7 May 2018 18:34:32 +0200
MIME-Version: 1.0
In-Reply-To: <CAHLp1Y=3n-b2x+51hv2-4w2w4_GdLAwKZ00jhKvPGHg+-PiWPg@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms060503080402080805030805"
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

--------------ms060503080402080805030805
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


> There is no need for a nob in wireguard to ensure that the wireguard=20
> traffic goes through a specific interface or is bound to a specific ip =

> address.

All those statements are solely off the WG community and are certainly=20
commendable. However, there is no (regular) external audit of WG, at=20
least publicly available, neither confirming or contradicting. Intel=20
probably thought their CPU programming as safe and sound until is was=20
not, or maybe they knew and just buggered along till found out.

If the consensus is that WG does not need a knob then that is fine by=20
all accounts and no sweat off anybody's brow.

> You can use iptables if you want to drop packets that are not for the=20
> intended interface / ip address.
Sure, that has been repeatedly mentioned but there also folks who like=20
to start at the source and not the tail end but that seems to be rather=20
a matter of perspective/flavor.
Notwithstanding seen a bit of a fair share of netfilter rules getting=20
convoluted in a complex network landscape and creating havoc, but then=20
those sysmin folks might not have really know what they were doing.
> You can disable ipv6 if you don't want ipv6.
Yes, but that is no black/white (on/off), like mentioned previously.
> If you think that wireguard could be flawed, why would you trust this=20
> as a wireguard option?
Because there are tools for checking/auditing sockets/binds.
> If you do not trust it, enforce it from the outside.
Why not to start from the inside, I was about to ask, but reckon that=20
been explained lengthily in previous postings and hence no need to=20
invite the same all over again ;)


--------------ms060503080402080805030805
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
BwEwHAYJKoZIhvcNAQkFMQ8XDTE4MDUwNzE2MzQzMlowLwYJKoZIhvcNAQkEMSIEII/S4/PF
aTGvCDJO03aUkFHpCRKDcrpliLQYiBSWHCwOMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYBBAGCNxAEMWswaTBWMQswCQYD
VQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMTAwLgYDVQQDEydTd2lzc1NpZ24gUGVy
c29uYWwgU2lsdmVyIENBIDIwMTQgLSBHMjICDwJu3YOf5w0/hCaCYPOQJDB6BgsqhkiG9w0B
CRACCzFroGkwVjELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UE
AxMnU3dpc3NTaWduIFBlcnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyAg8Cbt2Dn+cNP4Qm
gmDzkCQwDQYJKoZIhvcNAQEBBQAEggEAntmKlJ9okCLKsSlOOIdOKxoVceVeVhvgSkd0VPxg
FZM68YKKEwA6oEW2FvBnuiUo4LahjQalOTWx+AMuaok414DvUyTSTwJxvG0fXL1eT+6t6/Ix
+l4Q2O84vq65lhS4a+uNRlQQ9mzTH+Az1GHptri3luoF6lUBseWkm7HkD/p6oeOOo7gKcOvc
tGFpbUPLN+dIoP3KWdwRSjAe2YegPHpPhEuQNj8AN/07YEnx3TxWq1ZO6Mczyxo7zSS6muaC
VM+MjNd5k17TJhGfSQybVXESdrHFlnAvnXRDPol8NoRGaPdPnVbflrHOcTPMvsIrB32AVkd6
Vg9oq3U1sMT9DgAAAAAAAA==
--------------ms060503080402080805030805--
