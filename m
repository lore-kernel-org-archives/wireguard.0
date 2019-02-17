Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7844C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 20:44:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6189A2184A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 20:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tomli.me header.i=@tomli.me header.b="DLVURLEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6189A2184A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tomli.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37d1ae62;
	Sun, 17 Feb 2019 20:35:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b5c2760
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 20:35:52 +0000 (UTC)
Received: from tomli.me (tomli.me [IPv6:2a00:1a28:1157:199::5a76])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c82a6e9
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 20:35:51 +0000 (UTC)
Received: from tomli.me (localhost [127.0.0.1])
 by tomli.me (OpenSMTPD) with ESMTP id a90cbc51;
 Sun, 17 Feb 2019 20:44:09 +0000 (UTC)
X-HELO: localhost.localdomain
Authentication-Results: tomli.me; auth=pass (login) smtp.auth=tomli
Received: from Unknown (HELO localhost.localdomain)
 (2402:f000:1:1501:200:5efe:7b76:78da)
 by tomli.me (qpsmtpd/0.95) with ESMTPSA (DHE-RSA-CHACHA20-POLY1305 encrypted);
 Sun, 17 Feb 2019 20:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=tomli.me;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to;
 s=1490979754; bh=Ogd+io1yuXNPyMlAST8jZfAGC83VKH2oBe1YUV/hXDs=;
 b=DLVURLEVt25SJvoKAZBqeA916BW6xvl9QHxKSIE81XoA6ixOXr/tanwTwNixQRIQHJZ5upxs7JyMrzs5sMl5Cnxq++9SYPe/WDkR56jli6e0N0ntSqMEQU8wMU4KUP/SMaCmi8VS6HGY3/nfwA5Erco4qXU16d5Pm0jYEOvbfsfCF84jdlQ75vu8w8B6TZGEqdVP3gs7B+yfE9M8iXjrxU2uXwquKefX8N6v3RfJp2BnjBYofrrYuCyoYqEDAw7OkyyvyTxEvviQG24leWO6YxuegcMX3WwaM5dSTpqRa7Z3txxYuMSn94neEGQQpP9irGDAAOkOLNhSmvCqg3sJ8w==
Date: Mon, 18 Feb 2019 04:44:02 +0800
From: Tom Li <tomli@tomli.me>
To: Roman Mamedov <rm@romanrm.net>
Subject: Re: Logical cores / SMT with WireGuard
Message-ID: <20190217204401.GA26054@localhost.localdomain>
References: <735c8b20-c92b-2403-1557-32187b130a8f@icloud.com>
 <20190217160136.6138076b@natsu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190217160136.6138076b@natsu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: wireguard@lists.zx2c4.com
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

On Sun, Feb 17, 2019 at 04:01:36PM +0500, Roman Mamedov wrote:
> On Thu, 14 Feb 2019 18:02:26 +0000
> Lee Yates <rainmakerraw@icloud.com> wrote:
> 
> Sorry, hit "send" before reading the rest of your message.
> 
> > the router runs headless and is awkward to get a monitor to so I can access
> > the BIOS.
> 
> You can toggle it without needing the BIOS.
> It is possible to disable SMT from grub, with Linux kernel boot arguments.
> It even seems possible to disable/enable it without a reboot.
> See https://www.golinuxhub.com/2018/01/how-to-disable-or-enable-hyper.html

Hi all.

The information provided by the original link is out-of-date, it works, but
it's tedious and easy to make a mistake and disable the wrong logical CPU. The
new Linux kernel with L1TF fixes has introduced a SMT kill switch, which is the
standard interface to control SMT.

It's located at

    /sys/devices/system/cpu/smt/control

You can disable SMT by,

    echo "off" > /sys/devices/system/cpu/smt/control

enable it by,

    echo "on" > /sys/devices/system/cpu/smt/control

Or permanently disable it until reboot,

    echo "forceoff" > /sys/devices/system/cpu/smt/control.

More information is available at,

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/l1tf.rst

I hope it helps.

Cheers,
Tom Li
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
