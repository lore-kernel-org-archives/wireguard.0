Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC22C432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B8F2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPg4Jbz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B8F2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce23cbf8;
	Wed, 25 Sep 2019 08:50:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d139302c
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 20:53:56 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38361625
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 20:53:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id p7so1840659wmp.4
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2019 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sE/KrPtP2aEuCvRQ2p6DG/ctiOLeEkaipNdTaNt54tM=;
 b=WPg4Jbz6ehdrlE1S9BLqWz8q0pz0eotuO7IJxAvGaSz7/t4C+skrq0G5okm+zU2rkd
 fcKZ3m1CA819xYAwRdEg8x3jegOFNlkjfk11MFtDI2+9WV/WNvwWWzatrU+9h5dmIEkv
 DkGnGqlmuG2Ic2ftlF7YCD6u9HYSE8OLGgo5tm9V45iEC4m0M2cL3RI9twT+DbPNYaEN
 5WWpXgdrDmkiQPhiQ8ydyKyv/m1FXVzoQ4uGBZRKvaPeTYlJXfps8zTWEyijNIv6yfQq
 CKTz1Mln9hxm1PhTASMmZ+eh1tCpOgh7jBODsJAFU5QY2dz1GUb1lB8gWMKty2H0jjIs
 9Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sE/KrPtP2aEuCvRQ2p6DG/ctiOLeEkaipNdTaNt54tM=;
 b=V5H5ycvUSTpayWJHJF9pSnal/8ErH7+3c4AwKu3lWZV7IW91bhyN3v8TQ+DfXJhp3D
 hbcEruxs9B5A8mOHC74Kk+Ptdt741B4pVm/M7TFTmgPi8fdm5Fk9uNMQHz6FEfdWBeBc
 OB57kFfts1OijUoiboA0AyL4rJdADX2FQRGFedq+6LnWVjYod8o+7TG8Wqscb5E4U006
 /SjND8eBN34d4mpncb4ray5LJtyjLhQRHyzpXymi6wtLm86xCzu9g6NtvsXyl00DmLcM
 izimjuip1WYHJ9fkF1JrkRgfQYKei+uON1AZgIBXlBKfz0cbRf4mPJshxzGTyCoSChhX
 XUqg==
X-Gm-Message-State: APjAAAXRt0JItLVGqIfls2PqS+wYWBceYNFA80GlM4tCMFccIs5XtKnB
 +yEg8ExJL2ES2pRzgYR7D8mWmMQJJLSTrbht9G9a5c5lQJ4=
X-Google-Smtp-Source: APXvYqxtQvZc1038h/ilH7L3+1sIXzG5PvgTUkJy3kcHy4TL8+ZoWEz59KaYF9wIppjLnnTMGp4SC6d01x9hoh7zBug=
X-Received: by 2002:a1c:98c8:: with SMTP id a191mr2421185wme.17.1569358434403; 
 Tue, 24 Sep 2019 13:53:54 -0700 (PDT)
MIME-Version: 1.0
From: James <james.b.price@gmail.com>
Date: Tue, 24 Sep 2019 16:53:43 -0400
Message-ID: <CA+kUo267JEndBxav--GABQ3o02ZXMOVmktB1ZW2R6Tzx-X0v-Q@mail.gmail.com>
Subject: Re: Strange firewall dnat rule to make WireGuard work on
 dual-interface
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 25 Sep 2019 10:50:01 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7830868840606129984=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7830868840606129984==
Content-Type: multipart/alternative; boundary="0000000000000210ba059352bc05"

--0000000000000210ba059352bc05
Content-Type: text/plain; charset="UTF-8"

(Apologies in advance if this email gets orphaned. I don't understand how
mailing lists work.)

What I can see is that wireguard uses the default route interface as it's
source IP for any outgoing packets. This means that if you receive a
connection request from eth1, if the default route is eth0 it will attempt
to send out on the IP of eth0.
By design or lack of features, it ignores what the interface and IP the
incoming packet was received on.

I'm trying to do something similar to you but even with your IPtables I
can't get mine to work. I have a more complicated setup and I can't seem to
get the outbound packets to follow a routing table using a mark.
My current solution is to rebuild my vpns and iptables by changing my
routes to make wireguard defaultly reply on the correct interface for my
situation.

--0000000000000210ba059352bc05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(Apologies in advance if this email gets orphaned. I =
don&#39;t understand how mailing lists work.)</div><div><br></div><div>What=
 I can see is that wireguard uses the default route interface as it&#39;s s=
ource IP for any outgoing packets. This means that if you receive=C2=A0a co=
nnection request from eth1, if the default=C2=A0route is eth0 it will attem=
pt to send out on the IP of eth0.<br></div><div>By design or lack of featur=
es, it ignores what the interface and IP the incoming packet was received=
=C2=A0on.=C2=A0</div><div><br></div><div>I&#39;m trying to do something sim=
ilar to you but even with your IPtables I can&#39;t get mine to work. I hav=
e a more complicated setup and I can&#39;t seem to get the outbound packets=
 to follow a routing table using a mark.=C2=A0</div><div>My current solutio=
n is to rebuild my vpns and iptables by changing my routes to make wireguar=
d defaultly reply on the correct interface for my situation.<br></div></div=
>

--0000000000000210ba059352bc05--

--===============7830868840606129984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7830868840606129984==--
