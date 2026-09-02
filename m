Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5118DCA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:48:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ed59c963;
	Mon, 5 Oct 2026 07:00:44 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id aefabc56
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Sep 2026 13:42:48 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c160420289bso129441666b.0
 for <wireguard@lists.zx2c4.com>; Wed, 02 Sep 2026 06:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356568; cv=none;
 d=google.com; s=arc-20260327;
 b=Pjlx3ivE6MfP+XCbwH1PHjqsDMkhTGldVey00ep5VYTfDbLs+gEgL+tPDZUAUlKi8X
 O9dEYqfpxCoWygKi1MtTD9KFHjn+UnZ1nOAdylm5wfXpDmvWwgT1BQz5PjiwHnry7PPx
 +2QHlCJsXVEosS4PZjB+osVvaPJfbj7XXfPV4IFcbQtebl7ZO3LyvzXKeFgPiK3uRSbF
 XMbXMnJsUpRqr8jhMFHpl2habAur9AfcjJZa5w+E8pa28OZ1xBNFyFyfkaDzcvu6BI/4
 B5WoutY3i92WURvypnygOi3MZNRYHh8K5JLXq6ofZmSNocTlUnvaDVt7tWrNnDTULwFm
 ZyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:feedback-id
 :mime-version:from:references:in-reply-to:dkim-signature;
 bh=EQb8t2Ct/WsaIgvwMos397ugjKG4ROwCMkhAAe8bsz4=;
 fh=sPTCmxMy7djcbMSEUrSZkvlqpJgqRGw38wwYVoLxkqs=;
 b=HT8ZiDeIm1Mzu/HqkbpJ4ZSxIPmRp3gIRmAIhUYhJPdaDo+N7HRxz77GIqxjkRURov
 YtY2LUngmxbzmblNYBb7yuYdIIaWG6CFCciJxdYHyHFUJv6i9TlZEOsk4pQSa/me8rgP
 ++6UXOBk0cidt2Nvy2WECbzDqRLjDD3QgcrVdDg/QvluqOlCYl419lBJ8iP63Wh04EXB
 f8jQW+53ksF+nO3029Mlg5Vw2/t55eQazZcDxKG19VxhgTPi5Q5rWwCsilmYY9Hl1yDP
 GCmn6msWF3KgjNWBbG4bSWhQHWkes/M2e2d11eRsP7/Z9a+Yewu7edl2ABo/+Fxtk2dg
 3sUg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788356568; x=1788961368; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :feedback-id:mime-version:from:references:in-reply-to:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EQb8t2Ct/WsaIgvwMos397ugjKG4ROwCMkhAAe8bsz4=;
 b=Ks1wy2VoNWTZ1fqtT2YO2pufacAQ8zPyCRGpztWY+O6Rtq9m8o/by8jjGchWbAl/2P
 svC2Ooe24j3ZdBfbQd3yX1wuiT/CuSUJldduP8TozxcjhAdpkJFYdEKB6fBga7UQTnaF
 UOqpQqGX6G2lyt4ias1k7bbVrUFdDuHZiF39pzzLTwMsgfylbdZ0mdtwcfYkgJ8jmLsX
 b6hbZsBGgD7J2G6sQkPljO6vBYu5Ftqu9wrY3u6kmmwPabHJmC4nXRWq8S6o23VrIETK
 m8vdaUbNhdLEl8bCxiesfVOD2MRjhpu0DBZa3EEy18z5iACPOEBIYOGAh9C+QbHeZAdu
 shHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788356568; x=1788961368;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :feedback-id:mime-version:from:references:in-reply-to:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EQb8t2Ct/WsaIgvwMos397ugjKG4ROwCMkhAAe8bsz4=;
 b=Yz45yrv0BHxT9uyeFIGFNColVe4ytHtm+2snkAwGcWZDA1SOGQSVGXFyXsqna+Dj8z
 m6VWilOyE8Tp66L5WGRJmtSUHV+yXNIhFXP2wThFaAAo/O3M+Jri3wvIZftDYY5MPPU6
 zJ3iLpcV2gAqlL0msRz8neS1HpV9Ys2W19m7aC8I2yiem/8c6o2v0AmvQQ3fNt3mqTkO
 zUkMJASPoeihcyADMlBjYIoEfU+SBGvyJZYdUBn6tzlpiSdSDPE9aikWT/odikYA9nbz
 IE4xxrA68IGe0kER5p5FbLbmkCIFzvYR+/3TwS6+oh1Fo2IIS+x0rTXDI7cU7wO6RuPf
 pHug==
X-Gm-Message-State: AFuF++luemQth/1Di0cNkuZ2cSpEXvuVIptuNACSvakeNZ+nlt3cLW/o
 lFjZCGbVhBGBLfP//IY9vc7PIC9soknnCSPTXib3ZfHFbiAuFjYBdE0SP5tq6uRY1Zric7YpgKS
 epK9ezXcxAjMRCl+4NYTJwtrUG8bmwkBrng==
X-Gm-Gg: AYBFou2pDGy4H3qprJ6/rF0fpl8AdPfdkj4qLkNCxw99tBeRThVejICrlD7oqA3VKSI
 +sx9lyO1IHz+vJnXXvz3MHOMysXqXdwbFl1g80IEzxnwpczYfk44xWhb77MhThDRPsjibgremgx
 M53V065GeEoNQMtvN+t20x/utD/wDIFhMHRqAjZ5dDO4Ol6aRbJqM3ETyjDXLXBPuCvgnYHOyZL
 J9YQDCq5kMDleuIQZWtAYBB+ilnVo0RaJmWYPiENf9YbK7oxg6DnKQ2tkXTv8pR+u9g93U84Kff
 QOloX5MV+kP23zxxsBb6TjC2DFRWkZz9V/GXRtl1rcvQxC5tq0wq3qdn8r0q0lzpKXf207BS/PG
 2
X-Received: by 2002:a17:907:72cd:b0:c20:9447:bd5e with SMTP id
 a640c23a62f3a-c25d53ef8b6mr274176166b.9.1788356567827; Wed, 02 Sep 2026
 06:42:47 -0700 (PDT)
Received: from 923746734024 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 09:42:47 -0400
Received: from 923746734024 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 09:42:47 -0400
In-Reply-To: <CABzftJ5vMrTQni1ouLVt=5jcZNQtTF_NKR7swmJhtHp98BEBGw@mail.gmail.com>
References: <CABzftJ5vMrTQni1ouLVt=5jcZNQtTF_NKR7swmJhtHp98BEBGw@mail.gmail.com>
From: Nat Gist <nat.gist@gmail.com>
Mime-Version: 1.0
Feedback-Id: 124969244:user:proton
X-Pm-Message-Id: ca99083614e33a06b6d16d5348d94202ae85c261
X-Pm-Byoe: gv2DYGUi3-xNnpL00PLeRZ2sPQzsSp-u56rh6zey5Y294UiRrqWXvnZxqLIxIUPErucWBxrAIqOpEPiec_Jp2A==
Date: Wed, 2 Sep 2026 09:42:47 -0400
X-Gm-Features: AcwNN1VctSTWV8JTYpn6835YPaZswzH1BgIRwhRX_86NNFVZsLhzX7j9rOJ23Wc
Message-ID: <CABzftJ6FnmmAXrqH0MT175XA5PT=ExNtvQfN43fvaHUSwkLGMg@mail.gmail.com>
Subject: Re: Windows App is unable to resolve DNS for IPv6 only endpoints.
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

So this issue is a little more subtle than I thought, I had some
configuration issues with my local IPv6 setup such that I wasn't
getting a global IPv6 address when testing this, but I did have a
local IPv6 address. If there's a valid global IPv6 address everything
works fine and the IPv6 endpoint is resolved. With AF_UNSPEC
presumably if there's no IPv6 address windows only tries to resolve
the A record since it assumes you don't have a global IPv6 address
anyway, this seems like a bad design decision in windows but it is
what it is.

In any case I think DNS resolution failure isn't the right error
message to have happen when the actual issue is a non-existent route
to the endpoint. So I think my suggestion of explicitly querying
AF_INT6 would still be worthwhile to implement even though there's no
issue in a properly configured IPv6 network.

I guess if you wanted to tunnel using local IPv6 addresses it'd fail
but I'm not sure why anyone would want to do that(other than for
testing).

Thanks,
Nat

On Tuesday, September 1st, 2026 at 4:53 PM, Nat Gist <nat.gist@gmail.com> w=
rote:

> Problem description:
> When using an ipv6 only endpoint the DNS resolution in windows app fails.
>
> Steps to reproduce:
> Using the windows app try to connect to an endpoint using it's hostname w=
here there is only an AAAA record and no A record.
>
> Root Cause:
> Trying to connect produces the following error
> "Unable to resolve one or more DNS hostname endpoints: The requested name=
 is valid, but no data of the requested type was found."
>
> The first half of the error message(before the : ) comes from ErrorDNSLoo=
kup
> https://github.com/WireGuard/wireguard-windows/blob/4e6726c23ae9c5cb58e0c=
9910f3b7515621d133d/tunnel/service.go#L150
>
> The second half(after the :) comes from WSANO_DATA documented here:
> https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-=
getaddrinfow
>
> Looking at the implementation of resolveHostnameOnce(https://github.com/W=
ireGuard/wireguard-windows/blob/4e6726c23ae9c5cb58e0c9910f3b7515621d133d/co=
nf/dnsresolver_windows.go#L46)
> The hints specify "Family: windows.AF_UNSPEC" which causes windows to try=
 and resolve both A and AAAA records, and it returns the error WSANO_DATA w=
hen no IPv4 address is found. Somewhat oddly though not too surprising the =
behavior for IPv4 only results seems to be no error.
>
> I'd suggest either querying each family separately and only failing when =
both fail, or keep the existing AF_UNSPEC call and then doing a subsequent =
AF_INET6 call if err WSANO_DATA is returned by the first call to allow IPv6=
 only hosts to work.
>
> Here's the redacted config I'm using for reference.
> The endpoint only has an AAAA record. It doesn't have a public IPv4 addre=
ss.
>
> [Interface]
> PrivateKey =3D [redacted]
> Address =3D 10.10.10.3/32, fddd:28fa:bc9a::3/128
> DNS =3D 192.168.10.1, fddd:28fa:bc9a::1
> MTU =3D 1328
>
> [Peer]
> PublicKey =3D [redacted]
> PresharedKey =3D [redacted]
> AllowedIPs =3D 10.10.10.0/24, fddd:28fa:bc9a::/64, 192.168.10.0/24, 192.1=
68.20.0/24, fda2:369:f8ec::/60, fda2:369:f8ec:10::/64
> Endpoint =3D myhost.example.com:12345
>
>
