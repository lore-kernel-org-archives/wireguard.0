Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A470C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E64FA206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHjbWZjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E64FA206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50630c6c;
	Sat, 4 Apr 2020 22:36:06 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c33cd5ad
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 07:14:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id l36so703764pjb.3
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2020 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=1ciYpadnAZtdwBAqd8aW3C5cqPUAEU7YSMRHTnJA3HA=;
 b=CHjbWZjs6ypOf5JVWf5xuLFurQcw0QK6WVRyCxGEFwGAPWehBxQaj/k9R/N34gIbTU
 YrWlJTREHUT6Lz1F9kTfxwqHdC+JZc4FRKLKNC1rqmn+KVPfbGSEG+hs0w67LXb6FYks
 E4eBssMM5GW+yvEwZoj69YsRk6+w5fb0xqPDPvUNyZGwXJuLpHklTTCeSjV6P0Irv1ZE
 khE8cPkeQsJ+9/Z8j8LrroYwyZqCsclUz/mEf5pxoecYV+tjJhi63cvLPT9svljTzbvj
 w0QlN2069WmrYonUq4VuFa5sSE4EqfycAhQ7/OJw1PiMeBtodTLZACc3x+mXn6w7A1Hm
 rNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=1ciYpadnAZtdwBAqd8aW3C5cqPUAEU7YSMRHTnJA3HA=;
 b=nu/1ZqzJgYh2smDcGThhfgh4A2nwy4ZNlbRxh/ouyDRZURznUgXqFSphMVYEss96T2
 4Q7EITUxwNKrpgy+14BLPKEfDxJkLnCSMbukYWxRTcBvRp0dg52QuVcPREWltf0v8eV5
 cuDU+dmk5/kxd+FipttCdFb+/Ne++j3hI6CvUaxynv+3QXjihSj1Q/0r32tdHirv7TLz
 JUzWDZkXXyEuODivpab4hgjDVnbbFbS1z+NwlcbN4S8a5nQqMTn1+bYiceXyq6ecK9Yj
 YIFZ01H5Lq2tHcWQbOsb+iT8lg3gftr0sOsn+rcF4J7Lepvd8IgbDCLjHtWS9S3Huxal
 QpkQ==
X-Gm-Message-State: AGi0PuYwa1WEuBQAtf5TGMMGUgYDQAzcmEe5ubccm2mGn0kjrTgyAwAj
 ilbU+uXpZSYJYr2Ea0b6BFvwnTZASWc=
X-Google-Smtp-Source: APiQypIq9KGXShRcAz8/l7KDqO/m9hVtaE+jOHpo0JtMADh+xPq9Q3SYbeC/gsb5p80tr7RIM6slGQ==
X-Received: by 2002:a17:902:ac8d:: with SMTP id
 h13mr11138614plr.267.1585639351175; 
 Tue, 31 Mar 2020 00:22:31 -0700 (PDT)
Received: from ?IPv6:2604:5500:c289:d500:9431:18a4:bec6:2a9f?
 ([2604:5500:c289:d500:9431:18a4:bec6:2a9f])
 by smtp.gmail.com with ESMTPSA id x186sm11661217pfb.151.2020.03.31.00.22.29
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 00:22:30 -0700 (PDT)
From: Alex Besogonov <alex.besogonov@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Multihoming?
Message-Id: <445BCA5B-03B7-4127-82E8-029188083D45@gmail.com>
Date: Tue, 31 Mar 2020 00:22:27 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:36:00 +0200
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

Hi, list!

I=E2=80=99ve read the source code Wireguard implementations and it =
appears that true multihoming seems to be impossible with the current =
protocol. By true multihoming I mean possibility of using multiple =
connections at the same time, preferably with configurable rates for =
them on both sides.

A typical use-case would be a small office using two independent ISPs to =
connect to a Wireguard server, so that failure of one of them would not =
cause service interruption. Or a mobile user with an LTE and WiFi =
connections used simultaneously.

Any ideas on how this could be implemented?=
