Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBC7C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 464E0222B8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:13:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pycnPVTs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 464E0222B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 689b0e94;
	Fri, 9 Oct 2020 11:40:13 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5ca2aab8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Oct 2020 11:40:02 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 144so4667768pfb.4
 for <wireguard@lists.zx2c4.com>; Sun, 04 Oct 2020 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2gf7zKQgXOmEUHyooQorX1wYEGIAonETZfls5GvGAjg=;
 b=pycnPVTsC7B1kzRGUMQ+Fi1lSDqVVw0F24mueQCr1pYLnFOKFrZjjJ8bJpvIpaHiQm
 t9nEiubOFH/lQvuYKxfde6K80JE907fHkERjtVcPvReQi3y4yFKOT+brE1qiECbAKxml
 8r70O7w7DRxS0s3381f57l12t7xDTfbAFIfOWBw0LeXHaCL7xOzuSpVr/czs7jHpgeJL
 9++E4yxrrjP3QyWOFw9MotjSwMDdVv0H0jfBXNIZKj4QwVMl3ji05YQgW53tg/qYYUBv
 WDP7JeG23pItpA3Plv1C123+RIquCXjbfW+RfAip4ku434KSeJyF+MoTlvHd46RMeTa/
 Gizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2gf7zKQgXOmEUHyooQorX1wYEGIAonETZfls5GvGAjg=;
 b=EyDs9ffbUdNnUan8SP90Be5JrROjDttQWaO9nmh3BLozoJPVW+kVjWAfdyKiaFqV8c
 GDxnl8XTJ1lSIzr+d1BFtxQPYUT06cSVewVm+deZfM7xRCL0+Aa2ZdxBfW8ujUx3bmnM
 GnfoFsbSu6dsm0AAi8e+CwxekwLjj+TyAJZxoYBm2yaIrDmi7WuguT/Nf0nNavTIRnfO
 3fPCOGFi9EWr4/O2uldvtSo/wUc5aIMHLqzeb1NMOYOjuG0mFSZFL6NEbCD6RA7Ujtr8
 bqBh2NSZI1R9DnE4lCn5XyP2HlhUVnc2B1vst4RBDhcDt9hPyDjr6IwhrMeQeEo4fLUP
 lLNg==
X-Gm-Message-State: AOAM533rSUt0E8PZ0PEFtFqu49qjcXlEOqPcjU+1QccYEIG7Cz2TmTTf
 2EWtsv3q5DEfsZO/bgGxsNhv+CxeROHKJZ9KpW0nUlwaDq2CVHrK
X-Google-Smtp-Source: ABdhPJycP/GFI6gDtlYQzt5ZS2IfU0OpjtasIqWZOmH2mXe3Ecxwe6wlWClWE1Gvyg20D/Bx236urn/OQPOPu0KRvtI=
X-Received: by 2002:aa7:8885:0:b029:142:2501:39ea with SMTP id
 z5-20020aa788850000b0290142250139eamr2468854pfe.57.1601813534628; Sun, 04 Oct
 2020 05:12:14 -0700 (PDT)
MIME-Version: 1.0
From: Rudi C <rudiwillalwaysloveyou@gmail.com>
Date: Sun, 4 Oct 2020 15:41:52 +0330
Message-ID: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
Subject: [FR] How can I expose the wireguard tunnel as a socks5 proxy on the
 client?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 09 Oct 2020 13:40:09 +0200
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

I use Wireguard to circumvent Iran's censorship. A major problem with
it is that it's very hard to selectively proxy specific domains/apps
through Wireguard, while leaving others alone. This is an essential
feature for Iran's internet, as:
1. The connection is terrible, so avoiding using the proxy for
uncensored sites helps a lot.
2. International traffic is 2x more expensive, so avoiding the proxy
for internal traffic is very beneficial.
3. Some internal sites ban international IPs and need Iranian IPs.

The easiest way to solve this program, as far as I understand, is to
add the ability to expose the tunnel as a socks5 proxy on the client
side. This is the approach that shadowsocks, v2ray, etc have adopted.
There are mature solutions to selectively routing traffic through a
socks proxy.

I searched around, and there are docker containers that already do
this wireguard-to-socks thing; But running docker is expensive on a
non-Linux machine, so it'd be much appreciated if you could support
exposing socks and HTTP proxy servers natively.
