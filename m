Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1B1C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:41:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9368A21501
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=with.parts header.i=@with.parts header.b="D89+rnR6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9368A21501
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=with.parts
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e278846c;
	Wed, 17 Jun 2020 07:23:28 +0000 (UTC)
Received: from mail.with.parts (mail.with.parts [104.37.195.247])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48e38540
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 18:24:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with adasauce@with.parts
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=with.parts; s=dkim;
 t=1591900908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=YYcY1JqsmdSp6FUi4saidSJzv0J6NcbDb51MUGjqmqg=;
 b=D89+rnR6HB5FcD0yzi8FESn5XsdNLuNLQJ0IbBkgNujFnE81BoiuZSV/wx77cTd6eYwFgm
 PW3aWCS7Tja6ZxVAjiUnrlLuYdUZCWN7fRhNjAPXXBviK3lyWDM8i8PWgAlefI4VyFnhLt
 vRtICO2MG4nMo1aIv2zdxbbL+Hd95utnIuwx0G6WhdC4eIVB6qiADR8V1HEu54h+KL+ezO
 JAyYuI9ZCGkIITzylFFSxnj+EDSXVEXRChsrdcnKJDaxxyL6v215ZFNB34ZGpswOFtao4U
 gVkeDr+/pA+2MNih3yRL0p2XUb/rTy+PiP0Cop0D4EzKSxFw6DQpBIWHaegwag==
From: "Ada Sauce" <adasauce@with.parts>
In-Reply-To: <44-5ee26e80-1-1574d920@168130073>
Content-Type: text/plain; charset="utf-8"
Date: Thu, 11 Jun 2020 15:41:47 -0300
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Message-ID: <44-5ee27b00-7-1574d920@168130139>
Subject: =?utf-8?q?Re=3A?= Ubuntu =?utf-8?q?18=2E04?= kernel 
 =?utf-8?q?4=2E15=2E0-106-generic?= breaks 
 =?utf-8?q?wireguard-1=2E0=2E20200520?=
User-Agent: SOGoMail 4.1.1
Content-Transfer-Encoding: quoted-printable
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=with.parts;
 s=dkim; t=1591900908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to; bh=YYcY1JqsmdSp6FUi4saidSJzv0J6NcbDb51MUGjqmqg=;
 b=Yy3sI1dD2+RNNTFk4frcWf/rcW+GWFXHNbuUyREHU+o6XFs5mlcymFmmo1Uj46+JOYsrkD
 NFMQHDinzfZQ3gV1m35HoPoldHLx6qKRTSuNA77TfKfQ3ztoucg6tNJEGE08pS0JrF82aP
 uwrLRIdE9fnPJ7KaZaZXkimZIquBHD2I1w6AwBW8FQwYhm/cyLCVyirnToC16Uih5ud035
 NwPo7vh+RN+CmzT6Wf2tcDdanXzw+lt+GWRX+yUXz/fX2lOwrAkh2GcLojDSRy6mzM6k+j
 mpVNczoOMAUpHRDhUzr/5d8eCtE3WnJDAaHIvwrHr5+1Om6B3g+1TqVczoJy/w==
ARC-Seal: i=1; s=dkim; d=with.parts; t=1591900908; a=rsa-sha256; cv=none;
 b=D7htTG0SlR/4lByl9kN6Gk8eJBXEjlZNRMZpdXsbOObF5laDmJYPhSTSHPSAdnCJjj1nE0
 xFt4u9C8umZNOXQ4IeCmncfxQA8syUugiuXHW704y4kRkDBFFhtRvRziCKdlo1S55AL/6+
 Bwmw0l4gxp6gukvzL/wP/dDinIUBjb1/cBoVYGjVF4TRiJMSjm5yGPLHIQJQPkE2LJW7VA
 x4iULbJTzMkWicezs8Hlvvsx67JXboShpLCqPmmDa6bC7xkiO+cmyUB4iyyhsQQOHdbbHG
 O4/XakwG9c0OnlKN5kLCxnTsVcCF55piOf/pTzDQZI+G3KnxvnngHs+lIoPqsw==
ARC-Authentication-Results: i=1; mail.with.parts;
 auth=pass smtp.mailfrom=adasauce@with.parts
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:23:25 +0200
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

On Thursday, June 11, 2020 14:49 ADT, "Ada Sauce" <adasauce@with.parts>=
 wrote: 
 
> I'm now also observing the same failure mode as Martin.
> 
> However, the kernel is 4.15.0-101-generic.
> 
> ```
> /var/lib/dkms/wireguard/1.0.20200611/build/socket.c: In function =E2=80=
=98send6=E2=80=99:
> /var/lib/dkms/wireguard/1.0.20200611/build/socket.c:139:20: error: =E2=
=80=98const struct ipv6=5Fstub=E2=80=99 has no member named =E2=80=98ip=
v6=5Fdst=5Flookup=5Fflow=E2=80=99; did you mean =E2=80=98ipv6=5Fdst=5Fl=
ookup=E2=80=99?
>    dst =3D ipv6=5Fstub->ipv6=5Fdst=5Flookup=5Fflow(sock=5Fnet(sock), =
sock, &fl,
>                     ^~~~~~~~~~~~~~~~~~~~
>                     ipv6=5Fdst=5Flookup
> scripts/Makefile.build:330: recipe for target '/var/lib/dkms/wireguar=
d/1.0.20200611/build/socket.o' failed
> make[1]: *** [/var/lib/dkms/wireguard/1.0.20200611/build/socket.o] Er=
ror 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1577: recipe for target '=5Fmodule=5F/var/lib/dkms/wireguard=
/1.0.20200611/build' failed
> make: *** [=5Fmodule=5F/var/lib/dkms/wireguard/1.0.20200611/build] Er=
ror 2
> make: Leaving directory '/usr/src/linux-headers-4.15.0-101-generic'
> ```
> 
> Cheers, Ada
 
Apologies for the spam, I finally got 4.15.0-106 via another apt-get up=
date. It's working correctly with this kernel.

It looks like you were running the same kernel, Martin. Perhaps an upda=
te will fix it for you as well.

Cheers!

