Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E5FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 15:58:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 343c5594;
	Tue, 4 Jan 2022 15:58:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e930bf2d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Jan 2022 15:58:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B56D6614E6
 for <wireguard@lists.zx2c4.com>; Tue,  4 Jan 2022 15:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC5BC36AEF
 for <wireguard@lists.zx2c4.com>; Tue,  4 Jan 2022 15:58:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bIVfZYDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1641311896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=PgxzCwnAloXL0D936wVCht4DnKll2p6DsLng7kfm7hA=;
 b=bIVfZYDU7gwLaK+3l5n2cKAE7T7iMFU3EKjP2MZ0ImkCJPKuZRzzjcxcxRBHoGsANEWZeX
 wzIva8kdHasR88DzShthGUOfHkd3SP78ZxYDmQTimZY86nKiWgpSCOQF/qAi/kqqCN08W9
 5JMRkvfq1xvJ9DGQTZdiZIN8P2LsR3I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7b26fa86
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Jan 2022 15:58:16 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id e202so66607305ybf.4
 for <wireguard@lists.zx2c4.com>; Tue, 04 Jan 2022 07:58:16 -0800 (PST)
X-Gm-Message-State: AOAM5323Hw/5AkfRabEXtzHliG1hodDXMS1UR1SpmUimci+b5vDFdUvh
 sYXxY2mAaNxAfMMZjOe8qzFJrjMRGBzNFPR7PLM=
X-Google-Smtp-Source: ABdhPJx7o0RcVbbpty2K0O1W2UHOLxP/la3wNHg67vwgT06jX9UaJCPtXKPOXPVIz50EE7K6Cl/SZ1hrOfLK+GPydro=
X-Received: by 2002:a25:3bd3:: with SMTP id
 i202mr37578377yba.115.1641311895254; 
 Tue, 04 Jan 2022 07:58:15 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Jan 2022 16:58:04 +0100
X-Gmail-Original-Message-ID: <CAHmME9pxSFhfFB9VNyvyKLk9jDTyOwp_p7VG3+9uHx0fN1+hGg@mail.gmail.com>
Message-ID: <CAHmME9pxSFhfFB9VNyvyKLk9jDTyOwp_p7VG3+9uHx0fN1+hGg@mail.gmail.com>
Subject: PSA: systemd-networkd v250 adds routes from allowedips by default
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi everyone,

Hope you all had a nice new year's.

Version 250 of systemd-networkd added support for a `RouteTable`
option in the `[WireGuard]` section of a `.netdev` config file. By
default, it is "main". When this happens, the allowed IPs from
configured peers are added to the system's main routing table using
the metric specified by the also added `RouteMetric` option.

This is pretty similar to wg-quick(8)'s behavior with its `Table`
option in the `[Interface]` section, except that it doesn't do
anything fancy for default routes or for routes that overlap with
configured endpoints.

This means that if you're currently using systemd-networkd v250 with
0.0.0.0/0 or ::/0 or similar in your allowed IPs, those allowed IPs
will be automatically added to the main routing table, which might
prove problematic for folks who are already manually doing fancy
fwmark things with systemd-networkd. If this applies to you, you may
want to set `RouteTable=off` explicitly.

At the moment, I suspect this mostly affects Arch Linux users who
followed fwmark instructions on their wiki.

Regards,
Jason
