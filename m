Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB81CA6007
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 78204a5e;
	Mon, 5 Oct 2026 07:00:15 +0000 (UTC)
Received: from mail.antaris-organics.com (mail.antaris-organics.com
 [91.227.220.155])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4e894540
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Jul 2026 20:09:37 +0000 (UTC)
Date: Sun, 19 Jul 2026 22:09:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mareichelt.com;
 s=202107; t=1784491776;
 bh=69HVis64DsC8dFbYTYP/FrsOSDPkUAkrqXmHfFbxXSM=;
 h=Date:From:To:Subject:Message-ID:Mail-Followup-To:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To:date:author:from:to:subject:
 message-id:in-reply-to:references:mail-followup-to:openpgp:
 mime-version:content-type:content-transfer-encoding:author:from:
 subject:date:to:cc:resent-author:resent-date:resent-from:
 resent-sender:resent-to:resent-cc:resent-reply-to:
 resent-message-id:in-reply-to:references:mime-version:content-type:
 content-transfer-encoding:content-disposition:content-id:
 content-description:message-id:mail-followup-to:openpgp;
 b=SPJpt7gH1Ga0evvicfy/rkWAr+eQa85JjsPis7hyIxHjC7k1TCQtVuKOulacsT06P
 ClZ9qW5taI7O2ZVa0qCtQBT38f4Z+hJ0nxujWSl6BvvAyVOIQry9XXSSgabIAvrwE/
 EQC0GdeJaDSqijgc2yR1ET0hZWyA4U91S+DYcFsf/eEjd8LXbgQmAKVuQnJFSywhyg
 XeTgQM5oaGwir9+JID2FIOlcX/t+POAQ554JTyVqINdGMA08JoqKFX2SPYI0NUK0Bp
 wkQdmpwjZquYpjxkRBlfOCwoBZv/WRHsL6EBASEcOBr18E/pTB0VcBYV0OOrZUDu4P
 RX0Ii1DpkpWLQ==
From: Markus Reichelt <ml@mareichelt.com>
To: wireguard@lists.zx2c4.com, netdev@vger.kernel.org
Subject: Re: Wireguard head of line blocking when CPUs saturate
Message-ID: <20260719200935.GA5205@pc21.mareichelt.com>
Mail-Followup-To: wireguard@lists.zx2c4.com, netdev@vger.kernel.org
References: <874iiyfrrh.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874iiyfrrh.fsf@toke.dk>
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

* Toke Høiland-Jørgensen <toke@toke.dk> wrote:

> I'm sending this message to (a) see if anyone else is seeing the same
> kind of stalling, and (b) to get input on whether the explanation
> outlined above seems plausible. And, in the case of affirmative answers
> to both (a) and (b), to hopefully start a discussion on what to do about
> this :)

I don't use a wireguard setup on arm hardware, I am just brainstorming...
Given that you just use one tunnel, how about pinning wireguard to a core
and, more importantly, pin the program that causes the 'fat tcp flow' to
some other core?

What you describe must be a common problem on low performance ARM setups
running wg on openWRT (mikrotik comes to mind), so I'd have a look in that
corner of the internet also ;)

HTH


