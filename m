Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BF6C64E7B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:38:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166A92075A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166A92075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8055b1e;
	Wed, 2 Dec 2020 13:31:51 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ce5c8bc7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 09:20:36 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id s30so20204560lfc.4
 for <wireguard@lists.zx2c4.com>; Mon, 30 Nov 2020 01:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Pc7FYR4hoOdzmGwxUmFMwMZQWPa2tJFNad53rH+P/vI=;
 b=jCtdEO5pnSQZsZJb0ixZK4L5XEXi5CZ6Yaj+5msOtYq0e3ivyo/W0cO8GrzdvtrpyI
 x3raw6EJt6bFlBjqhHFJkGy9iozHhQmG9UTvfYwm9RFICU+Jes7yITiAL2P34pI37XAA
 WzRv6/La7iU18YK54wIFgoqplJDqeirPU07SxlwieWbnbGeVcKfk3zglGTeRM5PM2Vbb
 nGfgGdZ+MVkR3JJvsqF1ZeGSWPNI1dqDjLo5tRXVqf665WeQH4BxDcfxaAx25n/oF+Ou
 dPFQoS4N/kjSwZPLDptpw89QXMnaQ9aoDonBsS9LPFiyy8htNttkHx1U0qU8wrflsfKs
 ld+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Pc7FYR4hoOdzmGwxUmFMwMZQWPa2tJFNad53rH+P/vI=;
 b=gTTAKZsoQOAxNH4kF+Ym9oSRIQiZpo22WrvCDVnE6C6tOt71eRtwYJL+ifCw3CguWd
 glD7G6jUKfuInRZ8l7o7pYu3WdH/zuG62hpI08uPZqFzZzgoZQVe1teFNCD+ReGQTZOK
 56k+evDi/IPuDZ6trL7YwFlMOjdhTk2TWgFGSoiq+ZjWTc8JizxzMURVlNgSUNYGfYrx
 jM154yzk28bmXx1BImbtT5vApwReCvGtiVYCsob2hiO/7vSoitnBYENsp+GwOwshtb0i
 dKMgGZcVUIr9soh6zLDKT6KLNKfwBwKRkWoIUXSC8RXigCLRTRnbZNt6VsK1vgWZHKSO
 kNYw==
X-Gm-Message-State: AOAM530xR3WR0Plmyn4XG5seGkSFN1wZNfQE4orP2cc/1dW5aFtIT95Z
 3aKDQxoDbWKQ587vE+PdEs2oiXFUYz+GGcftKVDmQsKo9BI=
X-Google-Smtp-Source: ABdhPJyu1LUCR0lrtTDXpltKO4Y+2kiBxdpQlkNaKya3SSFH/SWmXtyDAJZL5L4KO2hasPO9XOWm+5s0OthY1HqISag=
X-Received: by 2002:ac2:4acd:: with SMTP id m13mr8793358lfp.69.1606728411157; 
 Mon, 30 Nov 2020 01:26:51 -0800 (PST)
MIME-Version: 1.0
From: Stefan Rinkes <stefan.rinkes@gmail.com>
Date: Mon, 30 Nov 2020 10:32:36 +0100
Message-ID: <CAMy1ncKmBmWcnsyD0Mg9SGGMpYsHpbH+nGTMtx4Kkx0kF4V_VQ@mail.gmail.com>
Subject: [PATCH] Use localtime in inf2cat
To: wireguard@lists.zx2c4.com
Content-Type: multipart/mixed; boundary="00000000000032b38a05b54f9c04"
X-Mailman-Approved-At: Wed, 02 Dec 2020 14:31:49 +0100
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

--00000000000032b38a05b54f9c04
Content-Type: text/plain; charset="UTF-8"

Else build fails in other timezones at certain times.

--00000000000032b38a05b54f9c04
Content-Type: application/octet-stream; 
	name="0001-Use-localtime-in-inf2cat.patch"
Content-Disposition: attachment; 
	filename="0001-Use-localtime-in-inf2cat.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ki4csq4g0>
X-Attachment-Id: f_ki4csq4g0

RnJvbSAwNGFiOGJhYWFjYzBmNDFlZWUyYjU2NjQyZGExZmIxMDRlZGFjNWVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gUmlua2VzIDxzdGVmYW4ucmlua2VzQGdtYWlsLmNv
bT4KRGF0ZTogTW9uLCAzMCBOb3YgMjAyMCAxMDoxMDowMCArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IFVzZSBsb2NhbHRpbWUgaW4gaW5mMmNhdAoKRWxzZSBidWlsZCBmYWlscyBpbiBvdGhlciB0aW1l
em9uZXMgYXQgY2VydGFpbiB0aW1lcy4KLS0tCiBkcml2ZXIvZHJpdmVyLnZjeHByb2ogfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlci9kcml2
ZXIudmN4cHJvaiBiL2RyaXZlci9kcml2ZXIudmN4cHJvagppbmRleCBjYmZlZDNlLi5kYWMyYzk4
IDEwMDY0NAotLS0gYS9kcml2ZXIvZHJpdmVyLnZjeHByb2oKKysrIGIvZHJpdmVyL2RyaXZlci52
Y3hwcm9qCkBAIC00Niw2ICs0Niw3IEBACiAgICAgPENvbmZpZ3VyYXRpb25UeXBlPkRyaXZlcjwv
Q29uZmlndXJhdGlvblR5cGU+CiAgICAgPERyaXZlclR5cGU+V0RNPC9Ecml2ZXJUeXBlPgogICAg
IDxTcGVjdHJlTWl0aWdhdGlvbj5mYWxzZTwvU3BlY3RyZU1pdGlnYXRpb24+CisgICAgPEluZjJD
YXRVc2VMb2NhbFRpbWU+dHJ1ZTwvSW5mMkNhdFVzZUxvY2FsVGltZT4KICAgPC9Qcm9wZXJ0eUdy
b3VwPgogICA8UHJvcGVydHlHcm91cCBDb25kaXRpb249IickKENvbmZpZ3VyYXRpb24pJz09J1Jl
bGVhc2UnIiBMYWJlbD0iQ29uZmlndXJhdGlvbiI+CiAgICAgPFVzZURlYnVnTGlicmFyaWVzPmZh
bHNlPC9Vc2VEZWJ1Z0xpYnJhcmllcz4KLS0gCjIuMjUuMQoK
--00000000000032b38a05b54f9c04--
