Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CA7CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:47:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 15501139;
	Mon, 5 Oct 2026 07:00:43 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9b91f41f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Sep 2026 20:53:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so30539466b.2
 for <wireguard@lists.zx2c4.com>; Tue, 01 Sep 2026 13:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788295987; cv=none;
 d=google.com; s=arc-20260327;
 b=j5YSVOqL3EdvkybEmt/OsmpPZtUANZDME2kraXmcKuY+KboA3NfXrLGwVmpn1Tac3i
 wS+rb2I77BuQo0dJINYwbcGu86T1OqRKJhSlXvMRR2eKCy7NXApVa0Xne30dIyPT2DTT
 +/CW4CfT6+yaFuPf1fzf984IMO70yNj6uQlQNfJ0cBgn8WqC+N2BIgzDDPsgBTm5Mxsl
 pLCyqN4kJssG4UJtRuiKdeO/58U6iEwBLjd52rzbSxK9tVjRxKJhiA88CYkJnSm/ecTc
 41OFNtnxMFMIJ0BoaHFZ+NYnSmzV53NVYCTv4qmowSTTH77Xb6qRlgE2FquzsXBfj2lT
 ETKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:feedback-id
 :mime-version:from:dkim-signature;
 bh=zdoStS8DzkJxOwNMk5v7yYx5lV3dTeK4DyJpKcv/5BU=;
 fh=sPTCmxMy7djcbMSEUrSZkvlqpJgqRGw38wwYVoLxkqs=;
 b=CpkwJh7XoMl5lUZGTIE4CF1TZd5OMKAurssLY0DAeLS2z+IJZPX6SFBgalptmuVy+l
 103nUDp9XgP8OrI9oH04SL9yixmJmDXnWgOkMfyZFbTVnTHtFIPXVjEra5ahNUBdV1Wm
 X6/Ocp0Z3d1D2GiisPNiU74hv7ytt3VNGH8UvyNH9atQX6u7FV6RhCbbe+FHcsvPTQIE
 nKKNdYQ33lBMFzuhUZT5UJQ3m9PqB2aSx7EnxsqIXQIpqDC7O9vd2lE9u31SmPowpSZa
 mkF3Xs2pL/ePumi9lzNbrM6SKoXp0sddqgWLpw7v5SSxw+LqrsMnALgvhaj7zWtTjww/
 1cYw==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788295987; x=1788900787; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :feedback-id:mime-version:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=zdoStS8DzkJxOwNMk5v7yYx5lV3dTeK4DyJpKcv/5BU=;
 b=EFhc4B3xwu532pbzBL6U1nuDWuJEsKf/W6lruXUJ6OgZhovKcXP/s1K09TxP9QEzv/
 SLMigAL2oo3Fw7+wdjIUYh1wZoNmonsHgMn2w12hl0bwG+rX/nBOz14qO7XzwWUqiv9m
 uNI2I6geoJ7tiQzWy7gVIqg3CkefPeqoMTPc2wgRMCiTdlifWEInVNdbMZxZxSukF6dR
 0twFqMHCMvqFQJ4eQz2kPaWzeu0IZLyk5b82B7P8FJ5OFhO5MfJvZ5ZQJpS2tDMtbBXZ
 mpUR9m/ruKbA/23IVWq+rcl1QPQlLIdLYwjWP5ULLNleNu6OpcRsCW7/BUeQGyfaVsjx
 vOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788295987; x=1788900787;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :feedback-id:mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zdoStS8DzkJxOwNMk5v7yYx5lV3dTeK4DyJpKcv/5BU=;
 b=ipNo5X8rE7BAFxDEhqhDVukXE7wJHFAPqyh9zijZjff50lmWAEY6eKS9vKTuPOBFz8
 eUH8QmVe0El2kEQt/6KEfXJvytozBEl54DWayzBmgfYP9ZxGyyEsZJrV9uSitjuu+XTX
 Wo3DoleF0YwcNC8hRIY9biiHDKLrVYWTrPdlkqewq9ncnIfaPq1VsLOWO/IDoXMhJQye
 7+HanUZLlq1ckgFKI2CvV7oWDzUjv3hPf1Z0D3EnxEIjq8EhdLLMLE5gBYeO65LnK71E
 WQlCxf9TGqqomPSqh0+WXJuNvrEgzdo2andNLZCvyrrPkf+oR9Z2goYyg8XTXvIbadgN
 WlhQ==
X-Gm-Message-State: AFuF++nmHR14h2gXqA0P6+x7fXTYsm/4LEK3H/H5wL+BCwoiALs+ZbZF
 87aQBBxRRnPGFr6Z0ETFiQ81yDlRXbz7n7wI+rS5849nMequSOeSw+8oUrxowbjp55nP7Emub55
 g3HgbAOV+b/cjjE63f+VV87HlbpQHx+E7vQ==
X-Gm-Gg: AR+sD10y7EC1bx6q08eEio4d/alFJ6ADoz015PkKxh7RRaF6BDseZO7+nCuRzqYVYWf
 Z/56QIBzHE/8DSXWVuPyaTvFXli/pShkKhNv/C4fP8Tx3KVUEyba4nxk9jAQcqn91WKynQn7iaN
 KtpwNm665i7HgtcaVepGgDaoJmRC2aVJDAI+8YrAN8l+bAKoKNwpSa2DVGjx6OUv3auh0Ndd0H9
 xfWYsr6VdSNEdMykXpSqkDO4jyQjW1RuwrCWNfIa8Lww8vvlMciKRueWnGNBgN8OFk24c6u6dWs
 /OuYF/bJsyEY0VJd0QcmxbwHs4nExRqAGfjAWbHUcoi7l8k4CO6BEJu4nIrsSvpn32SOnYBfPLQ
 =
X-Received: by 2002:a17:907:7250:b0:c25:8d62:f992 with SMTP id
 a640c23a62f3a-c25d5555579mr2037866b.21.1788295986652; Tue, 01 Sep 2026
 13:53:06 -0700 (PDT)
Received: from 923746734024 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 13:53:05 -0700
Received: from 923746734024 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 13:53:05 -0700
From: Nat Gist <nat.gist@gmail.com>
Mime-Version: 1.0
X-Pm-Classification: PERSONAL;model=mailcat--20260702.pt
Feedback-Id: 124969244:user:proton
X-Pm-Message-Id: 01b8647f81f12cf486fcb0d75eb567761256ef74
X-Pm-Byoe: gv2DYGUi3-xNnpL00PLeRZ2sPQzsSp-u56rh6zey5Y294UiRrqWXvnZxqLIxIUPErucWBxrAIqOpEPiec_Jp2A==
Date: Tue, 1 Sep 2026 13:53:05 -0700
X-Gm-Features: AcwNN1WM2m3sMMnEIrtDFx34GC8Lb7OCao0lT_24vBDlSGo9nfSycsRSyBNmMGw
Message-ID: <CABzftJ5vMrTQni1ouLVt=5jcZNQtTF_NKR7swmJhtHp98BEBGw@mail.gmail.com>
Subject: Windows App is unable to resolve DNS for IPv6 only endpoints.
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

Problem description:
When using an ipv6 only endpoint the DNS resolution in windows app fails.

Steps to reproduce:
Using the windows app try to connect to an endpoint using it's
hostname where there is only an AAAA record and no A record.

Root Cause:
Trying to connect produces the following error
"Unable to resolve one or more DNS hostname endpoints: The requested
name is valid, but no data of the requested type was found."

The first half of the error message(before the :=C2=A0) comes from ErrorDNS=
Lookup
https://github.com/WireGuard/wireguard-windows/blob/4e6726c23ae9c5cb58e0c99=
10f3b7515621d133d/tunnel/service.go#L150

The second half(after the :) comes from WSANO_DATA documented here:
https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-ge=
taddrinfow

Looking at the implementation of
resolveHostnameOnce(https://github.com/WireGuard/wireguard-windows/blob/4e6=
726c23ae9c5cb58e0c9910f3b7515621d133d/conf/dnsresolver_windows.go#L46)
The hints specify "Family: windows.AF_UNSPEC" which causes windows to
try and resolve both A and AAAA records, and it returns the error
WSANO_DATA when no IPv4 address is found. Somewhat oddly though not
too surprising the behavior for IPv4 only results seems to be no
error.

I'd suggest either querying each family separately and only failing
when both fail, or keep the existing AF_UNSPEC call and then doing a
subsequent AF_INET6 call if err WSANO_DATA is returned by the first
call to allow IPv6 only hosts to work.

Here's the redacted config I'm using for reference.
The endpoint only has an AAAA record. It doesn't have a public IPv4 address=
.

[Interface]
PrivateKey =3D [redacted]
Address =3D 10.10.10.3/32, fddd:28fa:bc9a::3/128
DNS =3D 192.168.10.1, fddd:28fa:bc9a::1
MTU =3D 1328

[Peer]
PublicKey =3D [redacted]
PresharedKey =3D [redacted]
AllowedIPs =3D 10.10.10.0/24, fddd:28fa:bc9a::/64, 192.168.10.0/24,
192.168.20.0/24, fda2:369:f8ec::/60, fda2:369:f8ec:10::/64
Endpoint =3D myhost.example.com:12345
