Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15FEC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:47:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F563206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="e8+izJ1h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F563206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b5612d2;
	Mon, 9 Nov 2020 22:40:19 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e20337c2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 11:08:26 +0000 (UTC)
Date: Wed, 04 Nov 2020 11:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1604488279;
 bh=TVCIgQ5ZbOReYN8pKv1Qrlii+mDUbAMxCsJYT6c5N9A=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=e8+izJ1h6xTqbuGQjw2Up+P8/OfUKre/csmr7ewBj6Ail3NcQuOGEoyrmV+PV8kU3
 RAr36mFTQbxt3NHKIcGU1EfGXxYMgOvkmGmbXfpfhSaV6ANgGMoVLYIpTQru4no+vE
 4zeSKK2j9KjUWCe8QktwOeS31KOUQGEJNp+JuDbE=
To: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Using Wireguard for Geo redundancy
Message-ID: <gBLFnYn1ENCoAu8pZXEVAFF88CT1DSPAOnmcV47vBrvQlLpA1jg2Yp6iZb9RotAOGDJPrqgeDiqOxesYB09WPXEtWsqR5R5rvx-udouR9-w=@protonmail.ch>
In-Reply-To: <1604430353.311423080@webmail.emailsrvr.com>
References: <1604430353.311423080@webmail.emailsrvr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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
Reply-To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Diego,

Wireguard is deliberately "dumb". It doesn't have any fancy things like fai=
lover built-in, that is an "exercise left to the reader" as the saying goes=
.

So, in answer to your question, the "best" solution would involve BGP. But =
from your email it would seem you don't run BGP and you don't have an indep=
endent allocation of IPs.

So that leaves us with "tier 2" options.  My suggestions of options to look=
 at would be (in rough order of preference):

- If the two datacentres are run by the same company, then talk to them. Th=
ey might be willing to provide an anycast IP range for you that is visible =
from both datacentres.

- If the two datacentres are run by different companies, but they are "prov=
ider independent" and you buy your transit capacity from the same ISP at bo=
th locations, then speak to your ISP. They might be willing to provide an a=
nycast IP range for your that is visible from both datacentres.

- Use name rather than IP in your Wireguard client config files and then ru=
n your DNS with a short TTL so that you can achieve a manual failover in, s=
ay 5-10 minutes.

- Use an external cloud service such as AWS ELB, Cloudflare etc. to provide=
 the failover layer for you.

Good luck !

Laura

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Tuesday, 3 November 2020 19:05, dxiri@xirihosting.com <dxiri@xirihosting=
.com> wrote:

> Hi!
>
> I am looking for information on how to leverage Wireguard in a geo-redund=
ancy scenario.
>
> We have a couple management boxes colocated next to each other that provi=
de HA via a VIP that "jumps" between each of those management boxes dependi=
ng on availability.
>
> Now lets say we want to place management box on datacenter 1 (DC1) and ma=
nagement box 2 on datacenter2 (DC2).
>
> Assuming the VIP cannot move between DCs, how could you leverage Wireguar=
d to provide the same level of redundancy but with geographically dispersed=
 hosts?
>
> Any information on this topic or documentation that points me in the righ=
t direction would be really appreciated!
>
> Thanks!
> Diego


