Return-Path: vtol@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3ae220e
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 15:16:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 904e1384
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 15:16:54 +0000 (UTC)
Received: from [192.168.112.193] ([149.233.207.110]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Me8ws-1exUXk0Ues-00Pysg
 for <wireguard@lists.zx2c4.com>; Mon, 07 May 2018 17:19:14 +0200
Subject: Re: WG endpoint node exit to inet and DNS resolver
To: wireguard <wireguard@lists.zx2c4.com>
References: <c940ea93-e022-27ba-f906-783b0a7d3c1a@gmx.net>
 <CAHLp1Yk-33m1X5nkoVA7ofA8=h7uTdXP9x+DWmFzHkxAhq-g_g@mail.gmail.com>
 <586e6364-d143-2b9b-8ea0-940072a9db9a@gmx.net>
 <CAHLp1YmAf+hD+iHD+cZPorqMp-m=Aw_nJ5E2TcQYrXt-y7FZNQ@mail.gmail.com>
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Message-ID: <e9cc36c1-7d2c-125f-71fe-cad39fa4bd1a@gmx.net>
Date: Mon, 7 May 2018 17:19:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAHLp1YmAf+hD+iHD+cZPorqMp-m=Aw_nJ5E2TcQYrXt-y7FZNQ@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms020000030204070006020901"
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

--------------ms020000030204070006020901
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


>     Had hoped there would a way for the clients to utilize the
>     endpoint node's DNS resolver.
>
>
> There are many ways to do that. You could setup post-up scripts that=20
> modify resolv.conf when the wg interface is up. You could run a=20
> caching dns server on your lan that talks to your gateway dns resolver.=


I am utilizing unbound as DNS resolver on the endpoint node and thus in=20
the resolv.conf the nameserver reads 127.0.0.1. The lan peers are not=20
local on the endpoint node but connecting remotely over inet. Thus was=20
my question whether WG has a mechanism to tell the lan peers to use=20
their own DNS resolver or the DNS resolver of the endpoint node.=20
Understanding now each WG uses its own resolver setup. Perhaps got=20
confused with the WG's Android app requiring the input for setting a DNS =

resolver.

>
>     forwarding is enabled in the kernel. Currently I am trying to set
>     it up=C2=A0 with the name space solution
>     (https://www.wireguard.com/netns/
>     <https://www.wireguard.com/netns/>) which perhaps do not require
>     iptable rules, at least there is no mentioning of it.
>
>
> I have not played with netns, so I cannot comment on that.

The name space solution did not work out. eth0 (and its public ip)=C2=A0 =

vanished into the namespace (physical), suppose that is intended (by the =

way of the tutorial). Subsequent inet connection is gone (till netds del =

physical) and thus the endpoint is not accessible anymore remotely over=20
the inet. Maybe I am missing something, that is way I set it up:

# The loopback network interface
auto lo wg0 eth0
iface lo inet loopback

# The primary network interface
allow-hotplug eth0
iface eth0 inet static
 =C2=A0=C2=A0=C2=A0 address <endpoint node public ip>
 =C2=A0=C2=A0=C2=A0 netmask 255.255.255.255
 =C2=A0=C2=A0=C2=A0 broadcast <endpoint node public ip>
 =C2=A0=C2=A0=C2=A0 network <endpoint node public ip>
 =C2=A0=C2=A0=C2=A0 gateway <ISP gateway ip>
 =C2=A0=C2=A0=C2=A0 # dns-* options are implemented by the resolvconf pac=
kage, if installed

iface wg0 inet static
 =C2=A0=C2=A0=C2=A0 address 192.168.120.1
 =C2=A0=C2=A0=C2=A0 pre-up ip netns add physical
 =C2=A0=C2=A0=C2=A0 pre-up ip link set eth0 netns physical
 =C2=A0=C2=A0=C2=A0 pre-up ip -n physical addr add 192.168.12.52/24 dev e=
th0
 =C2=A0=C2=A0=C2=A0 pre-up ip -n physical link add wg0 type wireguard
 =C2=A0=C2=A0=C2=A0 pre-up ip -n physical link set wg0 netns 1
 =C2=A0=C2=A0=C2=A0 pre-up wg setconf wg0 /etc/wireguard/wg0.conf
 =C2=A0=C2=A0=C2=A0 up ip link set wg0 up
 =C2=A0=C2=A0=C2=A0 post-up ip route add <ISP gateway ip> dev wg0
 =C2=A0=C2=A0=C2=A0 post-up ip route add default via <ISP gateway ip>=C2=A0=
 dev wg0
 =C2=A0=C2=A0=C2=A0 post-up sysctl -w net.ipv4.ip_forward=3D1

>
>     Being a of peer-to-peer concept WG is then not really suited as
>     VPN gateway?
>
>
> It certainly is suited for tunneling all traffic through the tunnel.=20
> There are a few blog posts around describing how to do this.

Worked my way through a lot of those and haven't got it working, that=20
being the cause of initiating the submission to the mailing list.



--------------ms020000030204070006020901
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
BwEwHAYJKoZIhvcNAQkFMQ8XDTE4MDUwNzE1MTkxMlowLwYJKoZIhvcNAQkEMSIEIKSZmLDn
YSGJHZZUm0mOitu+MuOaA+wNzAH9O1hFSzRfMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgweAYJKwYBBAGCNxAEMWswaTBWMQswCQYD
VQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMTAwLgYDVQQDEydTd2lzc1NpZ24gUGVy
c29uYWwgU2lsdmVyIENBIDIwMTQgLSBHMjICDwJu3YOf5w0/hCaCYPOQJDB6BgsqhkiG9w0B
CRACCzFroGkwVjELMAkGA1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEwMC4GA1UE
AxMnU3dpc3NTaWduIFBlcnNvbmFsIFNpbHZlciBDQSAyMDE0IC0gRzIyAg8Cbt2Dn+cNP4Qm
gmDzkCQwDQYJKoZIhvcNAQEBBQAEggEAK/g1LRjCPQLNXBhAayPCZ8CAtbd9OFu8OEO60O+s
94osudGKBMuIgiFEa2+VdgH5vL/5yZ+OmTC/VwUzdYYWGLG9swylPpOt9yi8uE/hy7x+SXC3
ikMNq5Cr9t3oKJe6qFS8pb+BkBm1pUKB6Fk616IVLSDxo8peRRqzBfQQI5Boq3/nhy9gUKqN
7IQhZGzhxtemnFJ0uW5dwzmNIuu5/ZoaHi7iUTP4Mfb6zRzMaJupHzV/WqO6yW3/ziq/39dD
HcU2ErcJ59SUesCFOaKXWHyY+xNcXwIRJAUjJzz86+6mTyCzheBxtO3d5gP+zMypGPmQ1AcW
FlHp8YpqIGrp0gAAAAAAAA==
--------------ms020000030204070006020901--
