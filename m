Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85D9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Jul 2022 23:21:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cdfd97fc;
	Sat, 2 Jul 2022 23:21:13 +0000 (UTC)
Received: from melchior.bamsoftware.com (melchior.bamsoftware.com
 [2600:3c00:e000:128:de39:20ee:9704:752d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2ee4e0f6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2022 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bamsoftware.com; s=mail; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SADBIpydu2Yolvshi+ARZfmto4AFpilNvI0HnIgl06U=; b=VGDWsJCBbo3wmiRomCq1FgVenZ
 /CDEh3MG76TZRqOIHA5Hf3x4+zau7kRWN/Tydx5YTrk4RMSiaER6hxWTbCs2urWqKAeRImdfJDGAa
 fCRPtbRm8sPGwSPZqHXhI7ULmcAOY5a0GCAwdAe7cVk5CnnKgmRXktMoJBpdWXr7Vo5o=;
Date: Sat, 2 Jul 2022 19:21:07 -0400
From: David Fifield <david@bamsoftware.com>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard protocol blocking in China, swgp-go (userspace
 obfuscation proxy)
Message-ID: <20220702232107.ofaioenh3twoqdfd@bamsoftware.com>
References: <20220609220522.kwqa4uvuc3sijlka@bamsoftware.com>
 <87pmjbpele.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmjbpele.fsf@ungleich.ch>
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

On Tue, Jun 14, 2022 at 03:13:11PM +0200, Nico Schottelius wrote:
> > I am forwarding some information about WireGuard blocking and
> > anti-blocking that was posted to a censorship circumvention forum.
> 
> In regards to this topic I was wondering if it makes sense to have a
> more generic obfuscation proxy that can carry tcp/udp payload?
> 
> Maybe this already exists, but I would think that something that hops
> protocols (IPv6, IPv4 endpoints, tcp/udp encapsolution), changes ports
> and uses envelope based tunneling (http, https, smtp, imap - worst case
> DNS) would make it easier to sustain communication even in more serious
> filtering scenarios.
> 
> Given such a "generic obfuscator", it could be combined with "protocol"
> modes, i.e. enhancing protocols such as wireguard with the presented
> algorithm, making it even harder to predict the content.
> 
> I'd assume some performance regressions using such an obfuscator, but
> maybe it could even "learn" the proper obfuscation by detecting blocks
> on easier to detect obfuscation and then switching to a stronger, but
> less efficient obfuscation.

There are many designs for anti-censorship protocol obfuscation proxies,
including multi-modal ones like you suggest, more or less fanciful, more
or less realized. You can get a list of some of the more popular and
practical ones under the "censorship-circumvention" topic on GitHub:
	https://github.com/topics/censorship-circumvention
There's plenty of research on the topic as well, sometimes leading to
practical systems. CensorBib has the most important papers:
	https://censorbib.nymity.ch/
For an introduction and survey of ideas that have been proposed, I
recommend reading "Making Sense of Censorship Resistance Systems"
( https://censorbib.nymity.ch/#Khattak2016a ) and "Towards Grounding
Censorship Circumvention in Empiricism" ( https://censorbib.nymity.ch/#Tschantz2016a ).
There are summaries of recent research papers on censorship at
https://github.com/net4people/bbs/issues?q=label%3A%22reading+group%22 .
The idea of pluggable obfuscation modules is fairly ubiquitous, and has
been systematized in various ways:
	https://www.pluggabletransports.info/
	https://shadowsocks.org/guide/sip003.html
	https://guide.v2fly.org/en_US/advanced/advanced.html
	
Let me suggest, however, that it is a mistake to focus too narrowly on
protocol obfuscation. It is a necessary element, but not the most
important one nor the one that's hardest to get right. There's no
shortage of obfuscators, and even naive protocol obfuscation usually
works even against well-resourced censors like the GFW. The weak link of
circumvention systems tends not to be what cover protocols they use, but
the particulars of their connection establishment. (This point is made
in the two SoK papers I linked above.) Empirically, censors prefer to
disrupt communications during the early stages, when the connection is
being first set up. It is faster, cheaper, and overall more effective
than long-term steady-state protocol processing.

Take HTTP for example. It's not hard to obfsucate a network tunnel so
that it resembles HTTP at some degree of fidelity. One might think that
to in order to block such a tunnel, a censor needs to somehow
distinguish tunnel HTTP from "real" HTTP. But most real-world censors
will never go that far: instead they will look at the destination IP
address or Host header of HTTP requests, or send their own probes to
suspected servers to see how they respond; but in any case they'll add
the server's IP address to a firewall block list, and call it a day. The
hard part of obfuscating a tunnel as HTTP is not faithfully implementing
HTTP; it's protecting the server's address from being blocked for
reasons unrelated to HTTP. Protocol obfuscation cannot help when it is
not the protocol that is being attacked.

Having the tunnel hop across different endpoints is not a bad idea, but
consider: how does a legitimate user learn what endpoints to use,
without a censor learning them also? There are ways to protect
circumvention endpoints, from single-user servers (which I believe is
the model swgp-go intends), to strategic distribution of endpoint
addresses, to colocating proxy servers with other network services, but
these go beyond the realm of protocol obfuscation.

What I like about swgp-go is that it has a narrowly targeted goal (to
hide the most salient distinguishers of WireGuard, with low overhead)
and it is designed for a realistic and informed threat model. The
protocol obfuscation is re-encryption and padding, but it doesn't have
to be more than that.
