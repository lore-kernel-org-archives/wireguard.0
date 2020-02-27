Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E6CC3F2CE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB10246A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baildon-co.20150623.gappssmtp.com header.i=@baildon-co.20150623.gappssmtp.com header.b="jrUQZ3Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB10246A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baildon.co
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0add914;
	Sat, 29 Feb 2020 11:31:03 +0000 (UTC)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [2607:f8b0:4864:20::e35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8430c05d
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Feb 2020 16:43:06 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id t12so3782vso.13
 for <wireguard@lists.zx2c4.com>; Thu, 27 Feb 2020 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baildon-co.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=6gIhPjNiTuhYs4ANUo0+GC/FtryQ4qNXsNjyx3W8438=;
 b=jrUQZ3QfgC2wDBHOvKvoSH3WFlUDqp5ww3w/+Z2IFEIjAyLbVsmWi0PHk0oXrgSgqU
 KUimqyfEqTwbY7Ja7LQy5h8BVtgHSgKy5nPDZLDxzwZ6P3RcYD6Wn0z15xavR8bbmmZC
 L17IPWguiu5ZH6gN76BxqtrOUbVwu7ULkzlJZ+grwGtgYvJMslUTeD7IdGxWzTo47pYD
 IqDTIeDs+QrV0SKR7cAGPZ4g3vyBbiAKls2j8a6mIYGoX365N9L1WVFR0hJS7BvjMvlP
 vWD1StC+PebdjY0+xwaOWGJ9x2kyLP7UxkQVuyAePPTt6SyvyeSEPy79tFJfuRtySjUg
 CRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=6gIhPjNiTuhYs4ANUo0+GC/FtryQ4qNXsNjyx3W8438=;
 b=Qv855z4Cb8pv8QKANM7JO8dKRVO9em9YfzQHVXX2QuIiAUehFcRymEsDgVOHW3RdBf
 FSwKwVpwXhI4AHB0GrfqpW/q4uYVvrDKXfGmtV6uYIAnTpjl/MHxpUUzNJ62GAmaiKbH
 hQ6FNoTTBg4NK6QR2JEp+Hv2p8+ZGoXD6yzH/QlOmT5Ei/FL6RAnTsf+6mR946RiQkAa
 lWnc2hhCnb8HnBiVmJqs2oyhZJtPdZnglYBrkJgq2T5ScyZ3VAY0BTCT3k8l/H1CZ7sR
 1/epVKaCGN80WSDFe8xs8Qw1eYsW3sJQEaLwe6EhKzcw8EUFop9GZtBSzippm+JyWmdU
 yd6A==
X-Gm-Message-State: ANhLgQ2dq1x9hboLmOy16UVsPxVs2nYKV4ufKsx7y7rUNiVIUPcv1ijn
 b0UKbYjxlR+Z9sc1S/OUqNoT8ZaooP7lEDZbLAIb77HRlVU=
X-Google-Smtp-Source: ADFU+vuT2EuwoJsDMKDIVvw+vDlTPOr7Fhbg6i3FzBPnPk+EefES1VaxfK34mWzJwiZ2ul5iGeCRKhSu9jRZFrIeGK8=
X-Received: by 2002:a67:8716:: with SMTP id j22mr65289vsd.177.1582822013373;
 Thu, 27 Feb 2020 08:46:53 -0800 (PST)
MIME-Version: 1.0
From: Sean Baildon <sean@baildon.co>
Date: Thu, 27 Feb 2020 16:46:32 +0000
Message-ID: <CAAF+QM=2cF9nV2Fq-HbUrbFbNwzw51FqAcG6RBvXv-07YWmp5Q@mail.gmail.com>
Subject: macOS Catalina failing https
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 29 Feb 2020 12:30:59 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGV5LAoKUmVjZW50bHkgcHVyY2hhc2VkIGFuZCB1cGdyYWRlZCBhIG5ldyBNQlAgdG8gQ2F0YWxp
bmEuCgpSZXF1ZXN0cyB0byBodHRwcyBlbmFibGVkIHNpdGVzIG92ZXIgdGhlIFZQTiBubyBsb25n
ZXIgd29yaywgZXZlbgp1c2luZyBteSBvbGQgY29uZmlndXJhdGlvbi4gUmVxdWVzdHMgdG8gaW5z
ZWN1cmUgc2l0ZXPigJRleC4KaHR0cDovL2V4YW1wbGUuY29t4oCUd29yayBqdXN0IGZpbmUuCgpN
eSBpT1MgZGV2aWNlcyB3b3JrIGFzIGV4cGVjdGVkLiBJJ3ZlIHRyaWVkIHVzaW5nIHRoZSBpT1MK
Y29uZmlndXJhdGlvbnMgb24gdGhlIGxhcHRvcCwgYnV0IGl0J3MgdGhlIHNhbWUgYmVoYXZpb3Vy
OyBoYW5naW5nLgoKSSdtIHVzaW5nIHRoZSBNYWMgQXBwIFN0b3JlIHZlcnNpb24gb2Ygd2lyZWd1
YXJkIG9uIGEgdmFuaWxsYSBpbnN0YWxsCm9mIG1hY09TIENhdGFsaW5hLiBBcmUgdGhlcmUgYW55
IGtub3duIGlzc3Vlcz8gSGFwcHkgdG8gcHJvdmlkZSBhbnkKdXNlZnVsIGRlYnVnCgpUaGFua3Ms
ClNlYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2ly
ZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlz
dHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
