Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA49C71157
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Jun 2025 20:38:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e8dfb33;
	Wed, 18 Jun 2025 20:38:49 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 44d70a2c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jun 2025 20:38:46 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-adb4e36904bso6094066b.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Jun 2025 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxpowered-net.20230601.gappssmtp.com; s=20230601; t=1750279126; x=1750883926;
 darn=lists.zx2c4.com; 
 h=autocrypt:subject:from:content-language:to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ejpn0XGYVimWks0QkI1O/BiEqzc47s20u4JN/KFYtMk=;
 b=seSAfsBWo3MIKGCihR3Xbe5nTKhGWe9+I4/X5hLnEtqoNGO9tIYU+Kfk24JXWt/Dtm
 3yNATKNnysHbehsnXxjnbEebHjQ4E4loPjJJNZ6eFJDtYUjTlzvUWNXLX+UZeh1FnYHU
 66owDKLr0EFBM7m9vQk4EIxu8kkTBstt9W4TakhDV/mzt0iPBBWFp9IAlYX097AeNcMI
 y44ij7TnWcsSb8Emuyz9ttDAmoN10s12elsg4O8bBZKT+8XY2x+blPRzCJ/D9yurO4XH
 aNiDJyXuqvvROcc3pBqRgCU8SHpTYFz6oQVDwApxE2rWzAVr/H0Zgzscc3Yp6d+4UJst
 nsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750279126; x=1750883926;
 h=autocrypt:subject:from:content-language:to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ejpn0XGYVimWks0QkI1O/BiEqzc47s20u4JN/KFYtMk=;
 b=NLWnDa0xq8PF0bsIE5ldZejVOur+ago03NVncPUfSgJ0C4P7tFLY8h3st8HKN86C7V
 H9gZac5lZ/RTy8cKytZ5V2U+u7OL1Ig/bWiqJSREoYmPY+aCziBf9fosuvs4gC7e2Sj3
 upru6fd42adEc8r0VCRKSIOGWx3LcYJLMkJPlz0ubnhuOU6SS2/MMT9Iiud4AoPyfC3g
 u5e0TWqxSyDeEdCAn4clf4iO9+axXOx2vmhO1eiOYR52BBZgIgUO1PFOdNtB9J85ZqxA
 mQYOGy3+x/ezYGWdoPDl5YFs6Py49h4OyjD92/2cTGA0IiF+dMeewSxO4b7AgGa+jeTn
 Bxfw==
X-Gm-Message-State: AOJu0YxJdaWx+cS2WJxQTq681W39vp6PX8lUGzZq4RcMI8p5+24WNWt1
 j8nguikBthnehUP/KOlO3gK/kUWfwrjwbytss8RivVwxjAq1NxzrRl/LRltuf373ngH78AY+eFP
 rbZ6H
X-Gm-Gg: ASbGncvnn/O1cy5ADvwXEBE4HhfCONeju1tQMruMcFUaOJUlswgJoA2oT5sRtRWei1e
 oiIAtR3CKscmFvDjLbNjnnyX/blJ+WZ6O4lyRSmLAqdkGArHOPl+ncnEnJykdN0y23aoktfkXba
 FAlBuvgRH4P4uZmssSf0QDFBpSAlwXtAF45Irb0v0S7JpSOSObsn3nvn+GNCb01zFY947TfKsKc
 OtFmnnHTEi0c6bQ+krn67ZIBEUWIexZ+eyWTm9Lw1DsbWW9lWPZzlWGBDaQoaPADHmNcYOfaxKe
 9xAcDBD75U3eaS+sR0MKwlxWlEDxE8RHqAe+ZZLa5hJvEIH73PMH72yvScqrFA4jZ1Bp0VKpq0m
 IWxfc7AHXqaSsO7HiOTSRBKM9WfsIScP6lyWE3YxLryrx2vml2eEkQcNgWUgK+Q==
X-Google-Smtp-Source: AGHT+IGqie/Jm3UHS9ELfRYdBQH8v/f53XUtH5l33/Mj2hKFspVN4+nmGoeipnXPYOcCj3xB5Ru2DQ==
X-Received: by 2002:a17:907:7241:b0:ad2:3f9a:649f with SMTP id
 a640c23a62f3a-adfad60d405mr1725483166b.42.1750279125831; 
 Wed, 18 Jun 2025 13:38:45 -0700 (PDT)
Received: from [192.168.178.122] (31.29.52.21.dynamic-pppoe.dt.ipv4.wtnet.de.
 [31.29.52.21]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c5c3bsm1122230666b.61.2025.06.18.13.38.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 13:38:44 -0700 (PDT)
Message-ID: <01a00e74-0eca-4914-9507-f2b96118b0e7@tuxpowered.net>
Date: Wed, 18 Jun 2025 22:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
Content-Language: en-GB
From: Kajetan Staszkiewicz <vegeta@tuxpowered.net>
Subject: [PATCH] Wireguard-Apple: Restore iOS-like NWPath handling on MacOS app
Autocrypt: addr=vegeta@tuxpowered.net; keydata=
 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
 Wbiwhrslf0hn78s=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9p76gJmYmw8VfOOS0LM0O5qz"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9p76gJmYmw8VfOOS0LM0O5qz
Content-Type: multipart/mixed; boundary="------------eBV2mVJ4Ijwg0bgp0a0eRA6f";
 protected-headers="v1"
From: Kajetan Staszkiewicz <vegeta@tuxpowered.net>
To: wireguard@lists.zx2c4.com
Message-ID: <01a00e74-0eca-4914-9507-f2b96118b0e7@tuxpowered.net>
Subject: [PATCH] Wireguard-Apple: Restore iOS-like NWPath handling on MacOS
 app

--------------eBV2mVJ4Ijwg0bgp0a0eRA6f
Content-Type: multipart/mixed; boundary="------------wJF7e1CKb0qMRamxkWr6K8KR"

--------------wJF7e1CKb0qMRamxkWr6K8KR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I've sent this already when the mailing list was down, maybe it went
unnoticed:

Sometimes after a network path change, especially when only
"unsatisfied" network path is available, for example when a laptop
loses all LAN and WiFi networks, further network path changes are
ignored. When "satisfied" networks disappear the cloned route for the
bound socket is removed by the system and WireGuard packets are routed
through the tunnel. This will result in an non-operational tunnel.

The iOS code does not manifest this behaviour, as it properly disables
the tunnel when no "satisfied" networks are available. Remove the
special MacOS case, use the iOS code on MacOS app.

--=20
| pozdrawiam / regards | Powered by Debian and FreeBSD  |
| Kajetan Staszkiewicz |   www: http://tuxpowered.net   |
|                      | matrix: @vegeta:tuxpowered.net |
`----------------------^--------------------------------'

--------------wJF7e1CKb0qMRamxkWr6K8KR
Content-Type: text/plain; charset=UTF-8;
 name="0001-Restore-iOS-like-NWPath-handling-on-MacOS-app.patch"
Content-Disposition: attachment;
 filename="0001-Restore-iOS-like-NWPath-handling-on-MacOS-app.patch"
Content-Transfer-Encoding: base64

RnJvbSAwZGMxNjMwZjU0MjAxZGFjMDA1MTI1YjA2NTI2NWI3YjMzOTRiYzI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLYWpldGFuIFN0YXN6a2lld2ljeiA8dmVnZXRhQHR1
eHBvd2VyZWQubmV0PgpEYXRlOiBNb24sIDI3IEphbiAyMDI1IDEyOjQ4OjM2ICswMTAwClN1
YmplY3Q6IFtQQVRDSF0gUmVzdG9yZSBpT1MtbGlrZSBOV1BhdGggaGFuZGxpbmcgb24gTWFj
T1MgYXBwCgpTb21ldGltZXMgYWZ0ZXIgYSBuZXR3b3JrIHBhdGggY2hhbmdlLCBlc3BlY2lh
bGx5IHdoZW4gb25seSAidW5zYXRpc2ZpZWQiCm5ldHdvcmsgcGF0aCBpcyBhdmFpbGFibGUs
IGZvciBleGFtcGxlIHdoZW4gYSBsYXB0b3AgbG9zZXMgYWxsIExBTgphbmQgV2lGaSBuZXR3
b3JrcywgZnVydGhlciBuZXR3b3JrIHBhdGggY2hhbmdlcyBhcmUgaWdub3JlZC4gV2hlbiAi
c2F0aXNmaWVkIgpuZXR3b3JrcyBkaXNhcHBlYXIgdGhlIGNsb25lZCByb3V0ZSBmb3IgdGhl
IGJvdW5kIHNvY2tldCBpcyByZW1vdmVkIGJ5IHRoZQpzeXN0ZW0gYW5kIFdpcmVHdWFyZCBw
YWNrZXRzIGFyZSByb3V0ZWQgdGhyb3VnaCB0aGUgdHVubmVsLiBUaGlzIHdpbGwgcmVzdWx0
CmluIGFuIG5vbi1vcGVyYXRpb25hbCB0dW5uZWwuCgpUaGUgaU9TIGNvZGUgZG9lcyBub3Qg
bWFuaWZlc3QgdGhpcyBiZWhhdmlvdXIsIGFzIGl0IHByb3Blcmx5IGRpc2FibGVzCnRoZSB0
dW5uZWwgd2hlbiBubyAic2F0aXNmaWVkIiBuZXR3b3JrcyBhcmUgYXZhaWxhYmxlLiBSZW1v
dmUgdGhlIHNwZWNpYWwKTWFjT1MgY2FzZSwgdXNlIHRoZSBpT1MgY29kZSBvbiBNYWNPUyBh
cHAuCi0tLQogU291cmNlcy9XaXJlR3VhcmRLaXQvV2lyZUd1YXJkQWRhcHRlci5zd2lmdCB8
IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL1NvdXJjZXMvV2lyZUd1YXJkS2l0L1dpcmVHdWFyZEFkYXB0ZXIuc3dpZnQgYi9Tb3Vy
Y2VzL1dpcmVHdWFyZEtpdC9XaXJlR3VhcmRBZGFwdGVyLnN3aWZ0CmluZGV4IGY3YmUxOWIu
LmY1YmYxMTUgMTAwNjQ0Ci0tLSBhL1NvdXJjZXMvV2lyZUd1YXJkS2l0L1dpcmVHdWFyZEFk
YXB0ZXIuc3dpZnQKKysrIGIvU291cmNlcy9XaXJlR3VhcmRLaXQvV2lyZUd1YXJkQWRhcHRl
ci5zd2lmdApAQCAtNDA5LDI1ICs0MDksMjAgQEAgcHVibGljIGNsYXNzIFdpcmVHdWFyZEFk
YXB0ZXIgewogICAgICAgICAgICAgICAgIHNlbGYubG9nSGFuZGxlciguZXJyb3IsICJGYWls
ZWQgdG8gcmVzb2x2ZSBlbmRwb2ludCBcKHJlc29sdXRpb25FcnJvci5hZGRyZXNzKTogXChy
ZXNvbHV0aW9uRXJyb3IuZXJyb3JEZXNjcmlwdGlvbiA/PyAiKG5pbCkiKSIpCiAgICAgICAg
ICAgICB9CiAgICAgICAgIH0KICAgICB9CiAKICAgICAvLy8gSGVscGVyIG1ldGhvZCB1c2Vk
IGJ5IG5ldHdvcmsgcGF0aCBtb25pdG9yLgogICAgIC8vLyAtIFBhcmFtZXRlciBwYXRoOiBu
ZXcgbmV0d29yayBwYXRoCiAgICAgcHJpdmF0ZSBmdW5jIGRpZFJlY2VpdmVQYXRoVXBkYXRl
KHBhdGg6IE5ldHdvcmsuTldQYXRoKSB7CiAgICAgICAgIHNlbGYubG9nSGFuZGxlcigudmVy
Ym9zZSwgIk5ldHdvcmsgY2hhbmdlIGRldGVjdGVkIHdpdGggXChwYXRoLnN0YXR1cykgcm91
dGUgYW5kIGludGVyZmFjZSBvcmRlciBcKHBhdGguYXZhaWxhYmxlSW50ZXJmYWNlcykiKQog
Ci0gICAgICAgICNpZiBvcyhtYWNPUykKLSAgICAgICAgaWYgY2FzZSAuc3RhcnRlZChsZXQg
aGFuZGxlLCBfKSA9IHNlbGYuc3RhdGUgewotICAgICAgICAgICAgd2dCdW1wU29ja2V0cyho
YW5kbGUpCi0gICAgICAgIH0KLSAgICAgICAgI2Vsc2VpZiBvcyhpT1MpCiAgICAgICAgIHN3
aXRjaCBzZWxmLnN0YXRlIHsKICAgICAgICAgY2FzZSAuc3RhcnRlZChsZXQgaGFuZGxlLCBs
ZXQgc2V0dGluZ3NHZW5lcmF0b3IpOgogICAgICAgICAgICAgaWYgcGF0aC5zdGF0dXMuaXNT
YXRpc2ZpYWJsZSB7CiAgICAgICAgICAgICAgICAgbGV0ICh3Z0NvbmZpZywgcmVzb2x1dGlv
blJlc3VsdHMpID0gc2V0dGluZ3NHZW5lcmF0b3IuZW5kcG9pbnRVYXBpQ29uZmlndXJhdGlv
bigpCiAgICAgICAgICAgICAgICAgc2VsZi5sb2dFbmRwb2ludFJlc29sdXRpb25SZXN1bHRz
KHJlc29sdXRpb25SZXN1bHRzKQogCiAgICAgICAgICAgICAgICAgd2dTZXRDb25maWcoaGFu
ZGxlLCB3Z0NvbmZpZykKICAgICAgICAgICAgICAgICB3Z0Rpc2FibGVTb21lUm9hbWluZ0Zv
ckJyb2tlbk1vYmlsZVNlbWFudGljcyhoYW5kbGUpCiAgICAgICAgICAgICAgICAgd2dCdW1w
U29ja2V0cyhoYW5kbGUpCiAgICAgICAgICAgICB9IGVsc2UgewpAQCAtNDUzLDIzICs0NDgs
MjAgQEAgcHVibGljIGNsYXNzIFdpcmVHdWFyZEFkYXB0ZXIgewogICAgICAgICAgICAgICAg
ICAgICBzZXR0aW5nc0dlbmVyYXRvcgogICAgICAgICAgICAgICAgICkKICAgICAgICAgICAg
IH0gY2F0Y2ggewogICAgICAgICAgICAgICAgIHNlbGYubG9nSGFuZGxlciguZXJyb3IsICJG
YWlsZWQgdG8gcmVzdGFydCBiYWNrZW5kOiBcKGVycm9yLmxvY2FsaXplZERlc2NyaXB0aW9u
KSIpCiAgICAgICAgICAgICB9CiAKICAgICAgICAgY2FzZSAuc3RvcHBlZDoKICAgICAgICAg
ICAgIC8vIG5vLW9wCiAgICAgICAgICAgICBicmVhawogICAgICAgICB9Ci0gICAgICAgICNl
bHNlCi0gICAgICAgICNlcnJvcigiVW5zdXBwb3J0ZWQiKQotICAgICAgICAjZW5kaWYKICAg
ICB9CiB9CiAKIC8vLyBBIGVudW0gZGVzY3JpYmluZyBXaXJlR3VhcmQgbG9nIGxldmVscyBk
ZWZpbmVkIGluIGBhcGktYXBwbGUuZ29gLgogcHVibGljIGVudW0gV2lyZUd1YXJkTG9nTGV2
ZWw6IEludDMyIHsKICAgICBjYXNlIHZlcmJvc2UgPSAwCiAgICAgY2FzZSBlcnJvciA9IDEK
IH0KIAogcHJpdmF0ZSBleHRlbnNpb24gTmV0d29yay5OV1BhdGguU3RhdHVzIHsKLS0gCjIu
NDcuMAoK

--------------wJF7e1CKb0qMRamxkWr6K8KR--

--------------eBV2mVJ4Ijwg0bgp0a0eRA6f--

--------------9p76gJmYmw8VfOOS0LM0O5qz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEfSEIcxY9kDeZvSZsgKrXf6bzAFMFAmhTI9MFAwAAAAAACgkQgKrXf6bzAFMM
2BAAoV3mugoknb5TBcQOhb+N1zUBfAPbKMNoqK0zG6s0nng2HwCPjdEIeVeIKAlSv9yBtHHQN5M4
4A/hVSUI20gGHJNHUi2ZvsTenK1rFdxgXSzu2p6ogQGDeCuYIxKg7mIiYaFqXm/FUx2EmYKslMAG
gTqaZ79iEY5AFTaIxzHR11Pw6PoqKaC7dipKQtwM34yO7dRO4AjyQ2IDuc9f9ZrU2HgLU41P3nul
kh36Re7PK1WN8KnFzQMRtBA2PthYOV1yPtX5+pgW9aJs10pkOw37RYHG+cdWIdDeKsoEmZP5PUcV
ifipUqjqbHTWRNSbW0IrMSWXJCLRteXxkfhZiU9nE3In6wg3QJgA2oC8HGf9aK7OtQ1L/AOGReIJ
wmELaISJEp9GbDdotdx/0ka7zwOOSQxMTb3so/4MTO37PUCBhzWjeweKmjZM9+x2aqZRaeLuTUj7
O+ATYrXygHzKAg8j+vKF3ktQnvVDTeq3z0qmG2ETica7swp1pDOyynKRHOwFPZnqVpSLLlIw0OJ8
0dwF4SH1ofmwuOUFvndrLk39gYujHnxTOC1sOnZX7d/wragSOYFLcVNWbm16+KXQfI1a8o/isg5a
3Oo+4FneWqO+Onr97vNCB5MNa+/WLSqlz8I5TRzKXt2sM7oUziECDB4GQiULMLxzl9fNejoY5zjc
ibw=
=WKmv
-----END PGP SIGNATURE-----

--------------9p76gJmYmw8VfOOS0LM0O5qz--
