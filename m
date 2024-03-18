Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551FBC54E58
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Mar 2024 17:09:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a134b496;
	Mon, 18 Mar 2024 17:08:58 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c33ff5db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2024 17:08:57 +0000 (UTC)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD9CE5C7BD;
 Mon, 18 Mar 2024 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710781737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftgY+bLb8XwfHyNervbdasFc4FlYUFBR74M9K0wXRRU=;
 b=vml4KMbBoSdX7TzpANJILNLPkosIvB3jQMDK7SgDm7qYh8gl6hJOWSw/xKZ+hlZiaAWCYy
 CjLkv/5dbuaYtU8e6lyt7riKmOqvDyA8n+1Rm2rIf0GUFkWRYWXtgjW5L4oziM67qGErfD
 YSyLhWqrJrJtVmeVA0avYeTKKqPuCdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710781737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftgY+bLb8XwfHyNervbdasFc4FlYUFBR74M9K0wXRRU=;
 b=lK6sLjjW+BWes869Ev3Zwkmn1q7aHB7iPhWXEkxRA9HjXyT25KTEOtAeBEaBX5XPyOpfvL
 MFBGyIFb7+B+mjDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710781736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftgY+bLb8XwfHyNervbdasFc4FlYUFBR74M9K0wXRRU=;
 b=LHH73Z5lUD01YkOLQIME/DpDwb0eYMJluswQqcNLUQ8Mzuo+H1dklZ4H/OleGN5iSOQ6V2
 3OrCNjJnoKFy7fUMMNHmNXIIxh+1dbSMJpBB1fenuE4P1AxVjIhIh/0egPzFeiJOn8Do6t
 zg2YGnIkI2TB6zbE1R0iHdU3DVir2GI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710781736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftgY+bLb8XwfHyNervbdasFc4FlYUFBR74M9K0wXRRU=;
 b=/tYtToBmjXBuFy/sx0vDRx1IPjdDVL+OpO3t5nHLhGdXKyCMvBIewH3pHuipRdyH3IYYw+
 jf/PbZfKrR6BRUCw==
Date: Mon, 18 Mar 2024 18:08:55 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: dtsen@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 netdev@vger.kernel.org
Subject: Re: Cannot load wireguard module
Message-ID: <20240318170855.GK20665@kitsune.suse.cz>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse> <87r0g7zrl2.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0g7zrl2.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.52 / 50.00]; TO_DN_SOME(0.00)[];
 REPLY(-4.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; R_MIXED_CHARSET(0.71)[subject];
 BAYES_HAM(-0.04)[58.07%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_SPAM_SHORT(2.91)[0.968];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]
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

On Mon, Mar 18, 2024 at 10:50:49PM +1100, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Michal Suchánek <msuchanek@suse.de> writes:
> >> Hello,
> >>
> >> I cannot load the wireguard module.
> >>
> >> Loading the module provides no diagnostic other than 'No such device'.
> >>
> >> Please provide maningful diagnostics for loading software-only driver,
> >> clearly there is no particular device needed.
> >
> > Presumably it's just bubbling up an -ENODEV from somewhere.
> >
> > Can you get a trace of it?
> >
> > Something like:
> >
> >   # trace-cmd record -p function_graph -F modprobe wireguard
> >
> > That should probably show where it's bailing out.
> >
> >> jostaberry-1:~ # uname -a
> >> Linux jostaberry-1 6.8.0-lp155.8.g7e0e887-default #1 SMP Wed Mar 13 09:02:21 UTC 2024 (7e0e887) ppc64le ppc64le ppc64le GNU/Linux
> >> jostaberry-1:~ # modprobe wireguard
> >> modprobe: ERROR: could not insert 'wireguard': No such device
> >> jostaberry-1:~ # modprobe -v wireguard
> >> insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko.zst 
> >> modprobe: ERROR: could not insert 'wireguard': No such device
> >  
> > What machine is this? A Power10?
> 
> I am able to load the module successfully on a P10 running v6.8.0.

Of course, it's not a Power10. Otherwise the Power10-specific chacha
implementation would load.

Thanks

Michal
