Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B629BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:13:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC4164F65
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DC4164F65
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59a83adb;
	Sun, 7 Mar 2021 16:10:53 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 19f26acf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615133448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=2eZsvAXYU8xq11kvCEtCwJPLc4cWAtY30WQ5mDx1H1U=;
 b=N4HO0SJMGjvIMT4EifsVdzbwoH51tJGCp9uvZZZcTNsjkWT5UEpeOwqw9THocEn9Y2cMlv
 oSf2nhn4a5tpYMIfehuZLLDvl5rSiCDhg6hZnFoDSJtWNHu1KaK2gOpSI6pasa+PiJCoNA
 oPbQuUhR7rwu1aFFN+d2pnWcZfAVkpU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b449512e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:10:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id l8so7535901ybe.12
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 08:10:48 -0800 (PST)
X-Gm-Message-State: AOAM531PzZxOhqvzSvsCUwsLj6UicEon1w82ogvQl1na3YWlN89SvyXU
 729/hjofqcyTzwbTBRXYAGAc2NPpBmR4P/qxDM4=
X-Google-Smtp-Source: ABdhPJyeNEmf9W4gOPHt3A6AkxI3L3yWBsPRtlGtcdTjuHhl6VscplAe08K9AsbneJ+SM/2+UgCyBcMQ9tMJRhQkywY=
X-Received: by 2002:a25:3cd:: with SMTP id 196mr28028178ybd.456.1615133447727; 
 Sun, 07 Mar 2021 08:10:47 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Mar 2021 09:10:37 -0700
X-Gmail-Original-Message-ID: <CAHmME9rBKDPTZxDHNgGZxoVY0n1Ybm1CDyHiU23eER=nMjB61w@mail.gmail.com>
Message-ID: <CAHmME9rBKDPTZxDHNgGZxoVY0n1Ybm1CDyHiU23eER=nMjB61w@mail.gmail.com>
Subject: Maintainer wanted: experienced iOS and macOS dev for WireGuard apps
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

Hey everyone,

Our macOS and iOS apps are currently the apps most in need of love and
maintenance. So, the project is looking for a dedicated maintainer for
the wireguard-apple git repository. There's probably a decent amount
of work to do up front, clearing out cobwebs, and then after that it's
maintenance as usual. If you've got strong iOS/macOS chops and are
interested, please let me know.

Thanks,
Jason
