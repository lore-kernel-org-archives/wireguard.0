Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE07C6FA8B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 08:32:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9b7f733d;
	Thu, 22 Sep 2022 08:31:58 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 27982570
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 08:31:56 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a8so13380152lff.13
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 01:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad.net; s=july2021;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
 bh=NHzfNwj6PkZ8nrm/8L/3xkRKWIsLnpe+O4LdD+H9Iuc=;
 b=B0pcW2xhZrKAF9Xqz2zHhQqTcqNKpNbKvkL1qdfXxRNhVpGH5C5x9962x4fqqPKNfI
 vyTwVzqAIwDzQlE0lgL8ihAjhiYKYoPn9079/IF+WvlgCllcdRGdUJiM7ViIpByCQ5Xy
 NgfkxnDKejCQFCUFAAX46n/2wb3tUvUfjCTL8oRBYqBnGc7PUzkfDF4aTJXFzjoKpJ3j
 yhZFThjGqvFDN5WxDkMEiXCSN0ShKPeC9+9Cl9dqTIcYm1Zf9CWSdcmARcOfugllLvuK
 ZQZYYs4vAvVmk4p0qbopB7SyfUCXjkqZq5ZMj0KFWU1IqbT50NfNPfzqNQjXjARkBe0h
 Bv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NHzfNwj6PkZ8nrm/8L/3xkRKWIsLnpe+O4LdD+H9Iuc=;
 b=s4CYmgUrFelgks/W53MOe4U9CLqAD/xcvfBS0jA6aCn+Kz/XDt62bQC4bXbfNI5nEs
 Sh5dpSeyd6k9z0ELLs3vjQSjQf2scuKcQHQJ8IxpHHVrOGi2gg0A4lbiqONCsdmQmHbN
 xUEtqUgQ11IDVo8fQfmbVODN7RXk+gi7R9+ixxZBiLyKxKp3VmvTWqQlRNYRruWuNqt+
 ePiNQa0SI3vNKU7q4HR21tcjABt1ZYW6+H4nan6yhiBdUFVVKDwehf9/wyCq+JWeZLr1
 BlT/gRThIQUV2WAI74eyLIrx0YlwKcGDXjAc6v9YpHQVCqDDgXefhxuk0zk+aNfEMGd/
 1glw==
X-Gm-Message-State: ACrzQf2OTtXMGsPsyxs76RM/fJsOkMzWpu2xmQ54+CwG1cK9JcHZoKDT
 Tly9Zz54rYmkWD969m0Sx7wlhXVY2dmYSw==
X-Google-Smtp-Source: AMsMyM6v1FFpecqz2pbfpBcCsEGEDyIXYUnrg/4bZwC2bvn9BgvEXc4Y3DlYNjQnI0vfxyHdozcpZQ==
X-Received: by 2002:a05:6512:1047:b0:49f:5309:3a0c with SMTP id
 c7-20020a056512104700b0049f53093a0cmr746705lfb.683.1663835515971; 
 Thu, 22 Sep 2022 01:31:55 -0700 (PDT)
Received: from smtpclient.apple (78-153-51-85.dynamic.telemach.net.
 [78.153.51.85]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05651205c900b004979ec19387sm813834lfo.305.2022.09.22.01.31.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Sep 2022 01:31:55 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
Date: Thu, 22 Sep 2022 10:31:52 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
To: Houman <houmie@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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

Hi,

I think we have a bug. If I am right, basically in both IPv4 and IPv6 =
extensions, withMemoryRebound takes capacity which is actually a number =
of instances of a given type (sockaddr_ variant) and not the byte size =
of a struct.=20

Could you please patch your WireGuardKit with the following commit and =
see if it helps?=20

https://git.zx2c4.com/wireguard-apple/commit/?h=3Dam/fix-addrinfo-crash

Best regards,
Andrey Mikhaylov

> On 13 Sep 2022, at 14:41, Houman <houmie@gmail.com> wrote:
>=20
> My existing Wireguard iOS implementation stopped working after
> upgrading to Xcode 14 today.
> When trying to connect to servers that support only IPv4, then it's
> fine. But if the server supports both IPv6 and IPv4 then the tunnel
> crashes:
>=20
> This IPv6 extension in
> wireguard-apple/Sources/WireGuardKit/IPAddress+AddrInfo.swift crashes
> with a Fatal Error at addrInfo.ai_addr.withMemoryRebound()
>=20
> The whole extension below:
>=20
> extension IPv6Address {
>    init?(addrInfo: addrinfo) {
>        guard addrInfo.ai_family =3D=3D AF_INET6 else { return nil }
>=20
>        let addressData =3D addrInfo.ai_addr.withMemoryRebound(to:
> sockaddr_in6.self, capacity: MemoryLayout<sockaddr_in6>.size) { ptr ->
> Data in
>            return Data(bytes: &ptr.pointee.sin6_addr, count:
> MemoryLayout<in6_addr>.size)
>        }
>        self.init(addressData)
>    }
> }
>=20
> Has anyone else experienced this problem?
>=20
> Thanks,

