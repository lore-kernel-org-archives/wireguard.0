Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B23C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:53:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 921B82173E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="j/PuKziz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 921B82173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e899f3dc;
	Fri, 6 Dec 2019 15:53:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd371150
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:53:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3e4196f
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:53:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d437baf8
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nvb0AQS9aJTJMPabLRaubNghHQ4=; b=j/PuKz
 izVtcihGfAat5CF2flyE9Hwppr7e5EEfIOyMFdJ4KDUO3Pj3R1VDRFzWOht6MmRw
 d0YFXVtRP4fqLeRP7pfKgvy8Tu8yTxijJlQ3KPKky/PZ8Bvr95WZOjWThBR1W68l
 9KI2TLw7TR7Xb/9oVfSJGCjQWYsf8yHM8a+MDLoMZBo76AKEYw7a56nLVKUkMwrq
 +4KoqL154FS4Fpf98mX0YsNaE1xKcddr2BI5PlRmA+X12rwjhjMRwNnDq8WKVBkD
 /cpr459cQICZHCP2wRgSyfPEb6zi0+qn+3F469XQzmLHTm/tXo804w5fColFpjHA
 N0Tmy2Da+YECxI3A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9f178450
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 14:57:58 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 59so6143433otp.12
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 07:53:00 -0800 (PST)
X-Gm-Message-State: APjAAAXgg7m0HmtjQ4HFc3IihQQtvYtZHthtp51vpqUPnHLQoaFtDQal
 CIoJRUTCE1dQSvYXNVV7lN/Q0CoIhXPwFPkH55k=
X-Google-Smtp-Source: APXvYqwqK0pDa6me8NtF5huyma/wgUce4WucP6g46WuJp2BBd+aydn6aVUgQ8PN5Jtoa9eECafMSIyAD6FQOO6FFQDM=
X-Received: by 2002:a9d:66d:: with SMTP id 100mr11735423otn.179.1575647580095; 
 Fri, 06 Dec 2019 07:53:00 -0800 (PST)
MIME-Version: 1.0
References: <fa4b08be3b6fee08@frisell.zx2c4.com>
 <NHVyo9ngt5xOvRvbPjQgDNH8pGe-_qN2sVDvP7jv2a6ZZRWd_0Ia9q6w2ZUTEdIQ_n-U-TRDxz-92_hnUpJTx_e-XlC180z5q1wWwF9q5rs=@protonmail.ch>
 <CAHmME9qFER60XD1aVqP3cgpEHOnikMWfhC-mrxYXojWEjWcu8w@mail.gmail.com>
 <qgogeFsyHmrD5A5oDJC_2s3UznPWIP0ncQl5Co1jS5Khgl_48mDer0UJFV3r6DUKs9bJyCS2j7f8dYz9WT_3WLQEYx8v8iP9cVFXXqvojwY=@protonmail.ch>
In-Reply-To: <qgogeFsyHmrD5A5oDJC_2s3UznPWIP0ncQl5Co1jS5Khgl_48mDer0UJFV3r6DUKs9bJyCS2j7f8dYz9WT_3WLQEYx8v8iP9cVFXXqvojwY=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Dec 2019 16:52:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9pmhntbNxw9ABjA-krzFARDaV+ZWZhgmWuL9hwfMJUCEA@mail.gmail.com>
Message-ID: <CAHmME9pmhntbNxw9ABjA-krzFARDaV+ZWZhgmWuL9hwfMJUCEA@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, Dec 6, 2019 at 4:36 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
> iptables is from Arch Linux iptables-nft package:
>
> $ iptables --version
> iptables v1.8.3 (nf_tables)

Does the segfault happen with the latest version in the git repo?

https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/linux.bash
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
