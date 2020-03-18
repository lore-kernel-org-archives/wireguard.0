Return-Path: <SRS0=qVad=5D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64C3C10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 08:15:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AC42076C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 08:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=opal.com header.i=@opal.com header.b="6SK5uUD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46AC42076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=opal.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c06f3152;
	Wed, 18 Mar 2020 08:08:36 +0000 (UTC)
Received: from mail.opal.com (tunnel103479-pt.tunnel.tserv4.nyc4.ipv6.he.net
 [2001:470:1f06:113d::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 397a6e40
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Mar 2020 08:08:33 +0000 (UTC)
Received: from localhost (vpn-2.opal.com [IPv6:2001:470:8cb8:4:0:0:0:2])
 (authenticated bits=0)
 by mail.opal.com (8.15.2/8.15.2) with ESMTPSA id 02I8EjPf085395
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 18 Mar 2020 04:14:47 -0400 (EDT) (envelope-from wgrd@opal.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opal.com; s=mail;
 t=1584519287; bh=tusLBOkXJWAce4NpwXcN7M+fl2NL/YOeJ4vR+z/7GL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=6SK5uUD3Y+DuQw8O8BK/mnsVoA6tyY7dqYViW8YXz2H747C8wIItzLVGNR3k5YaM/
 Kw6WkSfEU1OFEB2CVVUkG5f42O67F2OpfZhkIGxOpwb9n40HBZ5MCKejuEH3zeJpPr
 /bJUSh87z0/qHf+uG/m6Umv8Gw6ToIObfn3PAaIE=
Date: Wed, 18 Mar 2020 09:14:42 +0100
From: "J.R. Oldroyd" <wgrd@opal.com>
To: Luis Ressel <aranea@aixah.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Logging
Message-ID: <20200318091442.0d45889a@opal.com>
In-Reply-To: <20200317181205.ar7762xdewbszu4q@vega>
References: <20200315141659.771e0088@opal.com>
 <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
 <20200317083717.14719676@opal.com>
 <20200317181205.ar7762xdewbszu4q@vega>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; amd64-portbld-freebsd12.0)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.opal.com [IPv6:2001:470:8cb8:2:0:0:0:1]);
 Wed, 18 Mar 2020 04:14:47 -0400 (EDT)
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

On Tue, 17 Mar 2020 18:12:05 +0000 Luis Ressel <aranea@aixah.de> wrote:
>
> If you're adding logging support, I'd prefer logs on stderr over a
> centralized legacy mechanism such as syslog. That's much more flexible;
> in particular, it makes it much easier to direct logs of different
> daemons to different places, or run daemons in chroots.
> 

First, I should point out that the whole purpose of syslog(3) is
to do the flexible directing of different daemons' logs to different
places, including in chroots.

That said, adding logging to stderr is also very trivial, given the
current code.  I have updated the two files on my website [1] to include
this.  Just set environment variable WG_LOG_DEST to "stderr" and then
start wireguard-go.

Please test.  If this works as desired, I will update the git patch
that I sent in yesterday.

	-jr

[1] optional syslog logging for wireguard-go
    http://opal.com/jr/wireguard/logger.go
    http://opal.com/jr/wireguard/logger_syslog.go
	(both files are needed)
