Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9fa0031
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 09:33:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5699d1de
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 09:33:29 +0000 (UTC)
Received: from [192.168.112.193] ([84.46.42.142]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Mb8HX-1f0mKe1a39-00KjeI for
 <wireguard@lists.zx2c4.com>; Tue, 08 May 2018 11:35:55 +0200
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
 <153cabd7-f27d-0886-53ba-f4c620af409b@gmx.net>
 <CAHLp1Yki+g4PxJFYFkv1wqyv3siY4niYmCu7T-0tpKZQwkx7nw@mail.gmail.com>
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Message-ID: <f656495e-4999-bff5-f508-cc2faf9aa76e@gmx.net>
Date: Tue, 8 May 2018 11:35:53 +0200
MIME-Version: 1.0
In-Reply-To: <CAHLp1Yki+g4PxJFYFkv1wqyv3siY4niYmCu7T-0tpKZQwkx7nw@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms060805020902000303000201"
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

--------------ms060805020902000303000201
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

>
> You keep bringing this lack of security audit as if it was a big deal, =

> but you don't get any intrinsic security from an audit: It's just an=20
> paid assessment that professionals have read the code and have not=20
> spotted obviously hazardous constructs. What you really want is that=20
> hundreds of people, as opposed to a handful of security analysts, can=20
> read the code and analyze it. Openvpn is 100+ KLOC, which makes it=20
> impossible for a single programmer to read in a reasonable amount of=20
> time, and it thus requires this kind of paid assessment. On the other=20
> hand, Wireguard is less than 4KLOC, which is the real deal maker: no=20
> unnecessary bloat and an increased likeliness that more people can=20
> read it. Keeping it small is a difficult task and credits should be=20
> given to the authors for staying strong about it. You claim that the=20
> lack of a security audit is a reason to add more code for supporting=20
> binding to a particular interface/ip, but I bet a lot of people on=20
> this list think that it would actually hurt security because it would=20
> grow the code base for no good reason.

Surely your bet would pay off and I would be a fool to contest it. ;)

A security audit may not stop short at just (academically) accessing the =

codebase but also include an assessment of how of the code is actually=20
behaving in a (simulated) real world (complex network) scenario. It may=20
even be subjected to a bounty contest to put it through the wringer.

The current concept of WG has indeed certain pros over other VPN=20
solutions, but like most everything else in life, it has its cons too=20
and it will be determined by the user what suits best. Time will tell=20
the adoption/penetration level of WG is achieving. For me unfortunately=20
the cons (not just what is mentioned in this thread) are outweighing the =

pros in WG's current state and thus departing from WG for the time being =

but keeping an eye on future developments.

Nonetheless it has been a pleasure to engage with the enthusiastic=20
community of WG. Bon chance (as we French like to say)!=C2=A0 ;)



--------------ms060805020902000303000201
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
BwEwHAYJKoZIhvcNAQkFMQ8XDTE4MDUwODA5MzU1M1owLwYJKoZIhvcNAQkEMSIEIGxPwbJd
/75N26ybISRPjqiARai1HboBfbvOJTlKz3pfMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYBBAGCNxAEMWswaTBWMQswCQYD
VQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMTAwLgYDVQQDEydTd2lzc1NpZ24gUGVy
c29uYWwgU2lsdmVyIENBIDIwMTQgLSBHMjICDwJu3YOf5w0/hCaCYPOQJDB6BgsqhkiG9w0B
CRACCzFroGkwVjELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UE
AxMnU3dpc3NTaWduIFBlcnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyAg8Cbt2Dn+cNP4Qm
gmDzkCQwDQYJKoZIhvcNAQEBBQAEggEAslRRZJ6+v7KpJnrhz/B6Qamfc5KVXNlOAG7lLlyP
/ATTBbF59FhzzZvMOWtwf+JXebiieToF71pckqCmAl62qFXdPEOuJJotFGIMEpeXeiG6BL8f
wg+8lj5XPJc1DGWquRIe+LJ7rPqLYmeNhxJLw/1YFVYcv6UhX9z6T4N4bk1N5enwprnj+1Qd
CyNjaqH4DzyEdhb4lmb8f16JSkguSH3HNTog6SfZ28NnFpds4eZlrSZ7hmEzCwaIpAqHvz3Z
sCG/u4rcZxKGheWXgzAq8GcoWDkhfY6dujrziM/u5u4UADvv7IjmTUK3/RhxVNE8Vpey3leg
K8Gl1mog4+DEoAAAAAAAAA==
--------------ms060805020902000303000201--
