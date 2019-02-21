Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=FAKE_REPLY_C,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700C4C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 21:11:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8162080F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 21:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8162080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7bd1fc8;
	Thu, 21 Feb 2019 21:02:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8165c90
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 21:02:45 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 429cf302
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 21:02:45 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1gwvcz-0002fR-DU; Thu, 21 Feb 2019 21:11:33 +0000
Date: Thu, 21 Feb 2019 21:11:33 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Der PCFreak <mailinglists@pcfreak.de>, Jaseem Abid <jaseemabid@gmail.com>
Subject: Re: Peer names in configuration file possible?
Message-ID: <20190221211133.GA9835@matrix-dream.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH-tXsDAjhKXcwSKSEGvQtrzoznwaL4dufOj+UiLj3bQuF1tMQ@mail.gmail.com>
 <ba2eee20-4dcd-2601-ffb7-bd1915230b0e@pcfreak.de>
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

Hi all,

I would like to propose an idea, that if peer were keyed by an
identifier (e.g. string) insted of pubkey. E.g. from 

[Peer PubKeyWithBunchOfCharacters]
  Identifier = Gorge

[Peer AnotherPubkeyWithBuchOfCharacters]
  Identifier = Jane

..

we changed it to

[Peer George]
  Pubkey = BuchOfBase64

[Peer Jane]
  Pubkey = AnotherBuchOfBase64



It might not only
  * save people from doing reverse ip what was this peer guessing
    and/or lookup (e.g. in wg show)
  * discourage remembering pubkeys, while encouraging key rotation
  * perhaps make peers naturally sorted in a consistent manner
    (after changing keys)

but also:
  * enable lossless key turnover
    pubkey changes, session keys tied to peer -> no connection drop
    I think it should work fine, if privkey changed first, then
    pubkey on peer, with handshake complete before old keys
    become stale?


What do you think?


Regards,
Ivan

On Tue, Jan 22, 2019 at 12:50:17PM +0100, Der PCFreak wrote:
> Hi,
> 
> this is my first post to this list, so hopefully I don't get anything 
> wrong. Excuse me if so.
> 
> I don't know if this has ever been mentioned but I am asking myself how 
> should I keep track of let's say 1000 Peers in the configuration file of 
> a WireGuard server when the config file just shows me the public key of 
> the peers to identify them?
> 
> Would it be possible to add something like 'identifier' which might or 
> might not be unique:
> 
> Sample '/etc/wireguard/wg0-server.conf'
> 
> [Interface]
> ...
> ...
> 
> [Peer]
> identifier=computer01
> ...
> ...
> 
> [Peer]
> identifier=computer02
> ...
> ...
> 
> For example the command 'wg show wg0-server dump' could then maybe show 
> the 'identifier' as column to make things easier?
> 
> I am thinking of possibly replacing/migrating a large OpenVPN server 
> instance to WireGuard and I am currently thinking about the management of
> the peers which on OpenVPN I do do with username/password + OTP. Just 
> the public key in the config is not enough in my opinion, a descriptive 
> field should be possible.
> 
> Also I assume when 'SaveConfig = true' is set in the servers 
> configuration file any saves to the file currently remove manually added 
> comments so doing it with comments is not a good option.
> 
> Regards
> 
> Peter aka PCFreak

On Wed, Jan 30, 2019 at 03:29:33AM +0530, Jaseem Abid wrote:
> Hello lovely WireGuard people,
> 
> I wrote a tiny patch to add a name attribute to peers because identifying
> clients on my VPN just got very hard. Also hacking on wg source was a lot of
> fun. I asked @zx2c4 about this a while ago and he was open to the idea.
> 
> It's not _really_ ready for a submission yet because of a few rough edges
> but
> I'd love to get some eyes on this if anyone is kind! I've never written any
> kernel code before and my C is a bit rusty, so please feel free to be picky
> about the review. I've added '*NOTE:*'s for the reviewer where I'm not sure
> of
> the approach.
> 
> A few other questions,
> 
> 1. There are barely any inline code comments, is that intentional or
> something
> that the community would love to improve? I don't mean the really obvious
> ones
> but things that are tricky.
> 
> 2. Is there any interest in a getting started guide for developers wanting
> to
> work on wireguard itself? Something like the usual CONTRIBUTING.md? I had
> to dig
> through a lot of netlink tutorials and old kernel newbie guides to make any
> progress. It would be helpful to have it in one small doc.
> 
> The patch stays in the `name` branch here[1] and this commit does most of
> the
> work[2].
> 
> [1]: https://github.com/jaseemabid/WireGuard/tree/name
> [2]: https://github.com/jaseemabid/WireGuard/commit/544e59b4
> 
> -- 
> Regards,
> 
> Jaseem Abid
> https://twitter.com/jaseemabid
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
