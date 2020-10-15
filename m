Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F28EC433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3161820848
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWb0m6Si"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3161820848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54857e74;
	Fri, 16 Oct 2020 13:16:55 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1b019779
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Oct 2020 12:05:17 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id cm24so1814906edb.0
 for <wireguard@lists.zx2c4.com>; Thu, 15 Oct 2020 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zOhZA6BBT6c2LVR3QmA/IZh+72qSPUreXetA62Gz3zQ=;
 b=gWb0m6Si3AUawH8DxW7Zh4RhoM75gFT5JEQ58YqlSDZR4AUg1Z5RiIxKGxVdma7Pd4
 PLwWZ5qTYV2RVKKemgE7U3OsU1pwsoZRfLm8SCSwDOv3BT/260JhFsVd9vLYafZJI3bS
 eRi7jjt6ywWcDw/MIKBpJgpbQnJL/50AOKoAoJmk6uw23Ru0NntKe6f8OLctrSK7lCe3
 mBuL9uT3kIEekCphXuBg21eWnZvdhRFSircEQoC4aa3kczhJzmbh9/HrZqsEsDCC6wMV
 2J8TQxMnqHKDSnChoGKdxW80Rbf6vzLNSeZaTj3kefxa3D2mC8Phv4NkXE2a1EjK5P3k
 X5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zOhZA6BBT6c2LVR3QmA/IZh+72qSPUreXetA62Gz3zQ=;
 b=GWm0MYSdkCja/LHUnnhoa0Z5FuIG0pCERpAJ1jefFIKgArucGcb+ykYJVktb3MvalH
 KlhTwK4DwPjv3Ze90xJdIkosMtnwlmDVcZVGcBkhI7IbGtb6oELplyPtIzJw1TZ6V3WD
 M9X9PbUAjWVRvHinVoTVMNtUY62GOJlEuAl/56ACUPTP+lMyw+EGkU7KRJsbGxVoRAqP
 3++jgRjwAft5CxUbYPAvkSOPq0AqjXzoUA49/GnCYmGrejMihLKlhXCiPu6i5DlYU4XN
 /hJqnMMRFW7v9UGpG6zZDQSUF6BblQYjZ/vYuKBzDZqoO8Hb5lzLnwjMQnPDwGC7Q+LQ
 lhsA==
X-Gm-Message-State: AOAM533FhnFQmago1T12+IgYJM70pmUIWop+9ZyjkT5T7ACH4DE9GOFa
 ELwggBl/YJODlCWknPx95jFoCW16IC7vk7zFfJqod81+JYfiTj0u
X-Google-Smtp-Source: ABdhPJyEcmiP2hmkzfozTTd8WPiA30vIj7mAxOE9m3CqkSMj9IwZgMaKeFpsr5bByRPHwqReUWDrGF+xYUH45WjmAvo=
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr4139557edb.100.1602763534199; 
 Thu, 15 Oct 2020 05:05:34 -0700 (PDT)
MIME-Version: 1.0
From: Enzo A <r33int@gmail.com>
Date: Thu, 15 Oct 2020 14:04:58 +0200
Message-ID: <CAC=m+TjA+J8RqsiLwJWXtNoFvPUJ0xVHS=UKVUUeh=2yRz8yqA@mail.gmail.com>
Subject: Weird behavior with IPv6 on Windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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

Hello everyone,

First of all, thanks a lot for developing and maintaining Wireguard.
It really is an amazing product!
I am running with a strange issue with Wireguard on Windows. When my
tunnel is enabled, DNS-resolving hosts that are in AllowedIPs results
in the A (IPv4) record of the (sub)domain being resolved over the AAAA
(IPv6) record, which gets ignored when wireguard is enabled.
The intended behavior is that the AAAA record always gets resolved in priority.

Here is my client config: https://del.dog/easocerran.txt, and here are
also some screenshots of an example ping showing the issue:
https://imgur.com/a/dnlg6nd

Thanks!
