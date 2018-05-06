Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f48e4b2
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 19:37:03 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 852c9a13
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 19:37:03 +0000 (UTC)
Received: from [192.168.112.193] ([149.233.207.110]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MaZWz-1evG3Q409x-00KCRZ
 for <wireguard@lists.zx2c4.com>; Sun, 06 May 2018 21:39:18 +0200
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
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Message-ID: <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
Date: Sun, 6 May 2018 21:39:19 +0200
MIME-Version: 1.0
In-Reply-To: <7qQvJLeSZV3rJnkg9rIdA6yznDPzhIFVR_qUa0hBhmCdr_onJsjzXvKVIlp-ovJiRaX1eENGmtrtcZ_7xsHY7heX2qOvouN8pXTt_J3RurQ=@protonmail.ch>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms080605010603090903010708"
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

--------------ms080605010603090903010708
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


> Several people described to you that there is no exposure as every inva=
lid
> packet will be silently dropped and you still insist there is a flaw in=
 WG
> which will hurt it's adoption.

Perhaps a bit of misunderstanding here. Nowhere I stated that WG in=20
particularly has a flaw but exposing potential attack surfaces=20
unnecessarily.

Having searched the net for wireguard vetting/(security) audit/scrutiny=20
I came up empty. Thus so far any statement on WG security seems to be=20
stemming from the horse's mouth (no pun intended just the old saying).

With a thread model considering every piece of software being flawed in=20
mind, and with whatever CVE unearthed being a point in case, it should=20
be of little surprise that the question of mitigating surface exposure=20
is raised. Once WG would gain traction beyond a niche app it is likely=20
to be subjected to malicious attacks with increased frequency.

I am having trouble seeing a server admin going happy with WG spawning=20
all over the network (0.0.0.0) and neither being able to constrain=20
ipv4/6 sockets. But again that is just my opinion whilst you may have=20
sampled some to the contrary from server/system admins.

Truly understanding and appreciating simplicity and ease of use but=20
without options to fine tune some (security) aspects of the app, and=20
which don't need to be exposed in the default setup, it may fall short=20
for certain deployment markets/adaption. Yet the latter should not be my =

concern.

This thread started as question of how to and perhaps my end tuning it=20
more into a suggestion but I am far from asking for it. Like stated=20
earlier everyone is at liberty to deploy either this app or another,=20
whatever suits. It seems moot to ride this subject any further.

> For constructive discussion I propose this:
> present us PoC which will show that listening on 0.0.0.0 and ::1 can be=

> exploited with WG and binding it exclusively to x.x.x.x will help to mi=
tigate
> it.

It would not be within my capacity to produce such PoC. But then not=20
every potential WG user (system/server admin) will be able too. Will=20
that stop them from wanting to be in control of sockets/binds?

> At least try to describe such scenario. That would move this discussion=

> forward and may even lead to WG code improvements.
>
> =E2=80=8BJordan

Any sort of attack inside a corporate lan, probably brute force or=20
cypher cracking/padding attempts, with zero knowledge of the network=20
layout since WG is offering on the wildcard and ipv4/ipv6 sockets and no =

limit to unsuccessful connection attempts (unless I missed that). All it =

needs is a compromised machine in the lan with malicious code incl. a=20
suitable udp port scanner/probe.



--------------ms080605010603090903010708
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
BwEwHAYJKoZIhvcNAQkFMQ8XDTE4MDUwNjE5MzkxOVowLwYJKoZIhvcNAQkEMSIEIDBkTQdM
8h4ywpLo7T7OCBybzzvXjV/qacPsVolO3RjNMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYBBAGCNxAEMWswaTBWMQswCQYD
VQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMTAwLgYDVQQDEydTd2lzc1NpZ24gUGVy
c29uYWwgU2lsdmVyIENBIDIwMTQgLSBHMjICDwJu3YOf5w0/hCaCYPOQJDB6BgsqhkiG9w0B
CRACCzFroGkwVjELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UE
AxMnU3dpc3NTaWduIFBlcnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyAg8Cbt2Dn+cNP4Qm
gmDzkCQwDQYJKoZIhvcNAQEBBQAEggEAiEiKW72STWYP5SGDck12Bfa734SCxolKjkkt6VNh
6kybhPxyJCecU5zyBin87Wf/+jXthSWwMYZJ2N3E08sb4MoAjjomZcbgbjbQcf7ACUGKk0NP
XRx6iFGxAYOgvRp0tWxCs760z3n01c8aPkU1d5ZrKPfXd1JSVXHpMdJpGZTfHYRGz2K5erO6
EWJ90QP72iuN477XXR9duWOkcqrvINg2CfRovUL3wbJFeIczbF5miQP7bICoo1T9X8pqMCGR
VlTP5AarrKjSolX8tjQiv9vWyy6MZs2DS3wiXlmHL49nNLraC2SwnQ0IJ9RyC+rolWvLhk6G
20mkVj/MH8B4AAAAAAAAAA==
--------------ms080605010603090903010708--
