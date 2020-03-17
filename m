Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690B1C10F29
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:23:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B07E520663
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:23:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=opal.com header.i=@opal.com header.b="BBTINMvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B07E520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=opal.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3e34b5d;
	Tue, 17 Mar 2020 17:17:03 +0000 (UTC)
Received: from mail.opal.com (tunnel103479-pt.tunnel.tserv4.nyc4.ipv6.he.net
 [2001:470:1f06:113d::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad63960a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 07:31:10 +0000 (UTC)
Received: from localhost (vpn-2.opal.com [IPv6:2001:470:8cb8:4:0:0:0:2])
 (authenticated bits=0)
 by mail.opal.com (8.15.2/8.15.2) with ESMTPSA id 02H7bJ2F058673
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 17 Mar 2020 03:37:20 -0400 (EDT) (envelope-from wgrd@opal.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opal.com; s=mail;
 t=1584430641; bh=DQlmtCxM2FQV/OPRU5R37gJR7cSZvbGbmwSVOMd03/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=BBTINMvHMeRNlX9rqeBGG6kGdit+uy6hFTegd4bRH1gwpZlrW4yNDpUyi8Mo6OQdc
 VBDbNbl8aIYGO7xP8jTGn9TOR3L//6f/us6lMnX675Mz9IsdfbVurvVvk0/oOYVRRs
 cUXXeXDXQt+UeCe1XujluFPRnsWV/dtTb4r/1J2A=
Date: Tue, 17 Mar 2020 08:37:17 +0100
From: "J.R. Oldroyd" <wgrd@opal.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Logging
Message-ID: <20200317083717.14719676@opal.com>
In-Reply-To: <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
References: <20200315141659.771e0088@opal.com>
 <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; amd64-portbld-freebsd12.0)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.opal.com [IPv6:2001:470:8cb8:2:0:0:0:1]);
 Tue, 17 Mar 2020 03:37:21 -0400 (EDT)
X-Mailman-Approved-At: Tue, 17 Mar 2020 18:17:01 +0100
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

On Mon, 16 Mar 2020 13:30:17 -0600 "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
> Adding direct syslog support might make sense. I'll look into
> integrating those files you sent, though, perhaps it'd be better if
> you submitted those as a patch to the mailing list with a proper
> Signed-off-by line? (Or even to Github?)
>
Will do.
 
> I'm curious to know: is there a reason why you prefer this to something like:
> 
> `LOG_LEVEL=debug wireguard-go -f wg0 2>&1 | logger &`
> 
Since adding syslog support is so trivial, given the existing code
is already designed around logging levels and given Go's clean support
of syslog, why not just build it in so that wireguard's logging is done
consistently with all other UNIX daemons?  Piping stdout to logger
is non-standard and also loses the ability to filter the different
log levels to different log destinations.

	-jr
