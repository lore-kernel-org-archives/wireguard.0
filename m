Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F91C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Nov 2022 13:29:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7648c15a;
	Mon, 21 Nov 2022 13:28:59 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aea84c36
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2022 13:28:57 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 21 Nov 2022 14:28:57 +0100
Date: Mon, 21 Nov 2022 14:28:55 +0100
From: dxld@darkboxed.org
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: wireguard@lists.zx2c4.com, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] wg: Allow config to read private key from file
Message-ID: <20221121132855.vkwsez6kjm3ughrr@House.clients.dxld.at>
References: <20221120224601.77300-1-dxld@darkboxed.org>
 <bd851ce5-c45b-b6ed-986e-4d9f3cf54494@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd851ce5-c45b-b6ed-986e-4d9f3cf54494@msgid.tls.msk.ru>
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

Hi Michael,

On Mon, Nov 21, 2022 at 09:31:41AM +0300, Michael Tokarev wrote:
> 21.11.2022 01:46, Daniel Gröber wrote:
> > Using this new option the interface configs can be much easier to deploy in
> > an automated fashion as they don't contain secrets anymore. The private key
> > can easily be provisioned out of band or using a one-time provisioning step
> > instead.
> 
> This is definitely a very welcome option in my PoV.
> 
> Add my
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

I think you mean Reviewed-By? Speaking of which I actually forgot the
signoff myself. Doh.

Is Reviewed-By something we do here? I can't find a single such tag with
`git log --grep Reviewed-By`. I appreciate the positive response nontheless
though :)

> > Before this patch we were using a neat hack: it's possible to simply omit
> > PrivateKey= and set it using PostUp= wg set %i private-key /some/file.
> 
> Well, this isn't really neat, it is a hackish workaround for the missing
> functionality ;)

It does work surprisingly well though :D. I just re-set the private-key
after syncconf now, which definetly ought to loose some traffic but it
works at least ;)

> On a side, note, almost a year ago I sent a patch for wg utility to recognize
> and discard some keywords which are processed by wg-quick script - like,
> Address=. This way, there's no need to pre-process the config file anymore,
> and in order to recognize more peers, one doesn't have to restart the
> tunnel interface, instead, a regular wg syncconf wgif.conf is sufficient,
> and many things can be simplified too (removing the preprocessing).

Ok I think I found your patch[1]. So we did actually independently come up
with the idea of PrivateKeyFile, interesting. Also you support PresharedKey
too. I realised I forgot that one right after sending the patch obv. ;)
I'll send a v2 for that soon.

[1]: https://lists.zx2c4.com/pipermail/wireguard/2021-January/006346.html

As for ignoring the wg-quick options, I'm not sure what's the right way to
go there. I don't find the wg-quick strip approach toooo taxing but it sure
would be more convenient to just call one tool.

> I've never got any reply for these patches.

I have another patch pending for a longish while aswell "wg: Support
restricting address family of DNS resolved Endpoint". IMO you should have
just resent your series every couple of months :)

--Daniel
