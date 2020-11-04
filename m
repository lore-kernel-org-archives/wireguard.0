Return-Path: <SRS0=4t3h=EK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3063DC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Nov 2020 17:36:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EE62067D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Nov 2020 17:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xirihosting.com header.i=@xirihosting.com header.b="mkmqy/f7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EE62067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xirihosting.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e58b512;
	Wed, 4 Nov 2020 17:33:49 +0000 (UTC)
Received: from smtp119.iad3a.emailsrvr.com (smtp119.iad3a.emailsrvr.com
 [173.203.187.119])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 21ca6d0e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 17:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xirihosting.com;
 s=20180223-h43bbanu; t=1604511402;
 bh=45ATsbEC8a9rvfSFsWtpUqpQ3JXB2xsYT5NcLrfW+rw=;
 h=Date:Subject:From:To:From;
 b=mkmqy/f7JOEIgL3WZtufq4/dTJ+6k36X/AWlehrsITISv40IMPrJYPiPqBv4lR3Il
 5m7WvOySOd27S9V/jMwwQP/A7bmEC4JkWnMg5XaINdQS+EOuuFp+3eSKvPrRZYYJef
 3ogn/oOeaotn7Of1T98FW4GqtoZdNNf45AmSEYaU=
Received: from app47.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140])
 by smtp15.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 00A1151F1;
 Wed,  4 Nov 2020 12:36:41 -0500 (EST)
Received: from xirihosting.com (localhost.localdomain [127.0.0.1])
 by app47.wa-webapps.iad3a (Postfix) with ESMTP id E1ABAE117E;
 Wed,  4 Nov 2020 12:36:41 -0500 (EST)
Received: by webmail.emailsrvr.com
 (Authenticated sender: dxiri@xirihosting.com, from: dxiri@xirihosting.com) 
 with HTTP; Wed, 4 Nov 2020 12:36:41 -0500 (EST)
X-Auth-ID: dxiri@xirihosting.com
Date: Wed, 4 Nov 2020 12:36:41 -0500 (EST)
Subject: Re: Using Wireguard for Geo redundancy
From: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
To: "Laura Smith" <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
In-Reply-To: <gBLFnYn1ENCoAu8pZXEVAFF88CT1DSPAOnmcV47vBrvQlLpA1jg2Yp6iZb9RotAOGDJPrqgeDiqO
 xesYB09WPXEtWsqR5R5rvx-udouR9-w=@protonmail.ch>
References: <1604430353.311423080@webmail.emailsrvr.com> 
 <gBLFnYn1ENCoAu8pZXEVAFF88CT1DSPAOnmcV47vBrvQlLpA1jg2Yp6iZb9RotAOGDJPrqgeD
 iqOxesYB09WPXEtWsqR5R5rvx-udouR9-w=@protonmail.ch>
X-Client-IP: 186.176.65.158
Message-ID: <1604511401.921917444@webmail.emailsrvr.com>
X-Mailer: webmail/18.1.9-RC
X-Classification-ID: 0f841780-d6c1-4ca6-b3ff-ba666b913a61-1-1
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

I didn't know you can use names instead of IPs on the WG config, that is pr=
etty cool!=0A=0AThanks Laura! =0A=0A-----Original Message-----=0AFrom: "Lau=
ra Smith" <n5d9xq3ti233xiyif2vp@protonmail.ch>=0ASent: Wednesday, November =
4, 2020 6:11am=0ATo: "dxiri@xirihosting.com" <dxiri@xirihosting.com>=0ACc: =
"WireGuard mailing list" <wireguard@lists.zx2c4.com>=0ASubject: Re: Using W=
ireguard for Geo redundancy=0A=0AHello Diego,=0A=0AWireguard is deliberatel=
y "dumb". It doesn't have any fancy things like failover built-in, that is =
an "exercise left to the reader" as the saying goes.=0A=0ASo, in answer to =
your question, the "best" solution would involve BGP. But from your email i=
t would seem you don't run BGP and you don't have an independent allocation=
 of IPs.=0A=0ASo that leaves us with "tier 2" options.  My suggestions of o=
ptions to look at would be (in rough order of preference):=0A=0A- If the tw=
o datacentres are run by the same company, then talk to them. They might be=
 willing to provide an anycast IP range for you that is visible from both d=
atacentres.=0A=0A- If the two datacentres are run by different companies, b=
ut they are "provider independent" and you buy your transit capacity from t=
he same ISP at both locations, then speak to your ISP. They might be willin=
g to provide an anycast IP range for your that is visible from both datacen=
tres.=0A=0A- Use name rather than IP in your Wireguard client config files =
and then run your DNS with a short TTL so that you can achieve a manual fai=
lover in, say 5-10 minutes.=0A=0A- Use an external cloud service such as AW=
S ELB, Cloudflare etc. to provide the failover layer for you.=0A=0AGood luc=
k !=0A=0ALaura=0A=0A=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=
=80=90=E2=80=90=0AOn Tuesday, 3 November 2020 19:05, dxiri@xirihosting.com =
<dxiri@xirihosting.com> wrote:=0A=0A> Hi!=0A>=0A> I am looking for informat=
ion on how to leverage Wireguard in a geo-redundancy scenario.=0A>=0A> We h=
ave a couple management boxes colocated next to each other that provide HA =
via a VIP that "jumps" between each of those management boxes depending on =
availability.=0A>=0A> Now lets say we want to place management box on datac=
enter 1 (DC1) and management box 2 on datacenter2 (DC2).=0A>=0A> Assuming t=
he VIP cannot move between DCs, how could you leverage Wireguard to provide=
 the same level of redundancy but with geographically dispersed hosts?=0A>=
=0A> Any information on this topic or documentation that points me in the r=
ight direction would be really appreciated!=0A>=0A> Thanks!=0A> Diego=0A=0A=
=0A

