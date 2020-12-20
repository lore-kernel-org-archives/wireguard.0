Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7FEC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 09:37:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A3622BED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 09:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A3622BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc943bb5;
	Mon, 21 Dec 2020 09:28:05 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72b84373
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 21:24:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id k10so8037548wmi.3
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 13:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=JhtK3xIdTAkLGs4FhuAkx9mSig8s7kxuX/fa7anJD+0=;
 b=NRoVtbRDLJnkkomNMDAM/gMjyzUBva5SkX9BJYdB4Gk2duBDgwjlLDh1Uf5WcWANRB
 nX0m3QxpwoWyDW1hj8TPfrxsc1190xxJie27S9sen6R3uGuUjFlUqDrE0WXn19mVOcAZ
 H0d8GPbR3Dm0qUplMLENbKLEn5vub2gbEv32aAF3P76X5vzqcxYeSIABh4gNybiNYNX/
 rzrWqrtateP7NkhO1iw0feyy26auxrO2WgDd0snEZ2En7PYTVDzj6/ahAo0yxXnn/8pG
 nSqCoaGyL6YgPku0vMA2IfxUPQZ9JhtdjApF1bqPBAebS2JjwAKuTukf05eNNty27gim
 q25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=JhtK3xIdTAkLGs4FhuAkx9mSig8s7kxuX/fa7anJD+0=;
 b=AOgt+XvUI3z7JUnJAitOBFgq20Gxa64gfnOb2tPU9OG/DLLLk9/SyZzw01/IuU8ZQg
 M/RfLg3U+BHkwNrSF0QLQF7/Y7zuAMcalaT++ENhyOM+cO0cZUOBrinEsnEiOMVVohpn
 HiwmzAcFyh6su7GSfQ3wkvm66yXE+qlrx9THyNhs5/k0YZIkxe7LdPjdMjmy1IDJxrUe
 2XVna3C1RLvLDzwFV7MY0zllU+0KgCeTim2SmqvLsy4BU8FBNukObZLuOCRm0Kj6ndG6
 GCu7impRHZLK1aW67s7ENU/GGaaqrDvYLMfg13Ua+uq/udGsNXih6zHnsXuA+hAdRblS
 k6TA==
X-Gm-Message-State: AOAM533SkSsGdyJWjSHM8Ji1jeFwFGqEnSLDNCDpki5jCSfr7tmt7WfZ
 oi1ZlciWDwgVaF4knZHyx9Gj3Scbikc=
X-Google-Smtp-Source: ABdhPJye9uVuMKOPee7qBT5GBRy+eN3Nagz/Oifu7Ndh33fiG3LDSQljolRi/2dUtWADuVXM2XwFOQ==
X-Received: by 2002:a1c:9e86:: with SMTP id
 h128mr13878871wme.171.1608499990129; 
 Sun, 20 Dec 2020 13:33:10 -0800 (PST)
Received: from [10.0.10.15] ([212.51.157.96])
 by smtp.gmail.com with ESMTPSA id y13sm19447951wrl.63.2020.12.20.13.33.09
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Dec 2020 13:33:09 -0800 (PST)
From: paddor <paddor@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: [macOS] Using WG in multiple accounts 
Message-Id: <AC87237E-57A5-4B74-9F22-DD44A1FD8A70@gmail.com>
Date: Sun, 20 Dec 2020 22:33:08 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Mailman-Approved-At: Mon, 21 Dec 2020 10:28:04 +0100
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

Hi

I'm using a two account setup on my Mac: one for work, one for private =
stuff. The WireGuard app works pretty well under one account. But it =
does not seem to work with multiple accounts.

I tried creating separate configs for the two accounts (which I would be =
fine with). But, I think, because they both are set on-demand when on =
Wi-Fi (except my home SSID), they both try to turn on, even though the =
app explicitly says that a WG tunnel can only be viewed, edited, and =
activated by the user who created it. This seems to be a bug.

When I saw that the WG tunnel created in my work account also tried to =
connect under my private account, I thought I could try it with just one =
WG tunnel. But that still doesn't work.

Using wireguard-go and wireguard-tools (via Homebrew) seems to lack the =
functionality of "on-demand when on Wi-Fi except this SSID".

Any ideas?
Thanks

Patrik=
