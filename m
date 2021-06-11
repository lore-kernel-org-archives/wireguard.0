Return-Path: <SRS0=K7sE=LF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471E8C4743D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 07:16:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B671A60C3E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jun 2021 07:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B671A60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cde2f13;
	Fri, 11 Jun 2021 07:16:29 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09ef3635
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jun 2021 07:16:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g20so3147633ejt.0
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jun 2021 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ejF8J3nKSIAOMzY14Vn3mUH4T3j8i5rtEYbLo7MDhLA=;
 b=X+44QNIrvP9Virw1em7BZux8Wtpqw6Oxwj7H5PREI9fAXmtsuEhB4eSzRz8nvTEPtI
 2YYQmyVQLlMIvfi1spszGHPqYpgwNTYDYgUsVHk5MgPvMuOlzttuZ5Cre8CwZtaHRGJg
 0qsJrcCxC37dtO4JyEdbkUcWhFcYHvwGlw0i8KUKMBRXdTtSyDTh7eq8dVj6pIKpGkd+
 3gkE+IVYgHlybszUi8qLC6jZjf67HdSs+3XY5r3ZTSLRBkhkp5Z9o/ynhwebTc5IgERW
 oleVG1VS0AFvQspHObd/+wOZ3lVF1QJPfB94xmarz0aa+Oeg/yf3txI+ZpHnliNKW/qj
 ZKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ejF8J3nKSIAOMzY14Vn3mUH4T3j8i5rtEYbLo7MDhLA=;
 b=rL7+xGEuJoDfIF9Fz4WIR+19nov8iEmMcnlcyVNBDQzwsKgmT9e3e9zoJdcQlviB/O
 HdsvYyuqHDSmJ4jJmX3ZhBrLUm1ZISKWMFOnwgKaXF8p3FRLgBb/yuQa5ew8+UuUH7Nz
 WDDBNCfKOGOX3HZ93Vn43CQWbnpr/Rs07KR1bt4JvRPtm5Cl4qU2GDRdaQEYEuclYoEB
 auSBZhSpAxg+LQVXuRvGlqdRUrhndGjU5bhxLOT0+GntuA3a49IqKG6D/y7P1ORqq0Eo
 Rlb/ATdwSm4uzJGbI1toqKtLWbRkWXnEpKFai4sJToNHDmQtjBpH4zBIRw9VQHedk7id
 ySww==
X-Gm-Message-State: AOAM533HFAlGgJoO9BuTaOe7YjZq7V1oTY+Zjz5aB5lpG10XM8VAsdVm
 FnZHZ26N97UhEKX3fuNToQwn/Q==
X-Google-Smtp-Source: ABdhPJzPg2exSe5MpdkcF3CmAAgu55e7kyGEPFgwaA02Rk9EvMrlyA1VEz7uWeZcSmdN8rU+LU8G5g==
X-Received: by 2002:a17:907:1c20:: with SMTP id
 nc32mr2302328ejc.21.1623395787808; 
 Fri, 11 Jun 2021 00:16:27 -0700 (PDT)
Received: from smtpclient.apple (87.119.154.76.ipv4.telemach.net.
 [87.119.154.76])
 by smtp.gmail.com with ESMTPSA id w17sm2254834edd.44.2021.06.11.00.16.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Jun 2021 00:16:27 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: WireGuard is broken on iOS 15 beta
From: Andrej Mihajlov <and@mullvad.net>
In-Reply-To: <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
Date: Fri, 11 Jun 2021 09:16:25 +0200
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E201364E-C433-4A43-968E-F336D5944986@mullvad.net>
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
 <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
 <CANdratux27RGAbVg1QBEKEnff8jb3pdezZ-Ad0=bqYfOw6iUeA@mail.gmail.com>
To: David Crawshaw <crawshaw@tailscale.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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

IIRC one thing to consider with that lookup: iOS enables users to run =
Personal VPN and Custom VPN (aka WireGuard) side-by-side so there is a =
chance you may pick the wrong utun.

> On 11 Jun 2021, at 00:33, David Crawshaw <crawshaw@tailscale.com> =
wrote:
>=20
> I finally managed to get a device running iPadOS 15 and an Xcode 13
> beta. This technique works. Some modified code with logging:
>=20
> func tunnelFD(provider: NEPacketTunnelProvider) -> Int32 {
>    os_log("tunnelFD searching")
>    var buf =3D [CChar](repeating: 0, count: Int(IFNAMSIZ))
>    for fd: Int32 in 4...64 {
>        var len =3D socklen_t(buf.count)
>        if getsockopt(fd, 2 /* SYSPROTO_CONTROL */, 2, &buf, &len) =3D=3D=
 0 {
>            let str =3D String(cString: buf)
>            os_log("%{public}@", "tunnelFD \(fd): \(str)")
>            if str.starts(with: "utun") {
>                os_log("tunnelFD found likely fd")
>                return fd
>            }
>        }
>    }
>    os_log("tunnelFD found nothing")
>    return -1
> }
>=20
> produces the logs:
>=20
>    tunnelFD searching
>    tunnelFD 7: utun3
>    tunnelFD found likely fd
>=20
> Note that the current technique of calling
> provider.packetFlow.value(forKeyPath: "socket.fileDescriptor") causes
> the NetworkExtension to crash under iOS 15. The logs say the kernel
> sandbox killed it:
>=20
>    Sandbox: process(525) deny(2) file-test-existence =
/private/etc/.mdns_debug
>=20
> On Thu, Jun 10, 2021 at 8:44 AM Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>>=20
>> I won't have an updated OS to test this out in until next week at the
>> earliest, but perhaps this hack will work?
>> https://git.zx2c4.com/wireguard-apple/commit/?h=3Djd/fd-search-hack
>> Let me know if that is successful, or if it blows up.
>>=20
>> Jason

