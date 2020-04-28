Return-Path: <SRS0=XOuh=6M=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C481EC83004
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 06:57:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FA2206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Apr 2020 06:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20FA2206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12b825ef;
	Tue, 28 Apr 2020 06:45:00 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c6542566
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Apr 2020 06:44:57 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 2F540C009; Tue, 28 Apr 2020 08:56:32 +0200 (CEST)
Date: Tue, 28 Apr 2020 08:56:17 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [RFC PATCH] wg-quick: linux: raise priority for mangle nft chain
Message-ID: <20200428065617.GA19621@nautica>
References: <1588008413-5667-1-git-send-email-asmadeus@codewreck.org>
 <CAHmME9rT_sZrp6rZJV=Jqw-7kwCgkZ2yiBYJqiunb2gibBGhOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9rT_sZrp6rZJV=Jqw-7kwCgkZ2yiBYJqiunb2gibBGhOA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

Jason A. Donenfeld wrote on Mon, Apr 27, 2020:
> This patch is missing a Signed-off-by line.

Sorry, will add and resend without RFC after some feedback.

> On Mon, Apr 27, 2020 at 2:02 PM Dominique Martinet
> <asmadeus@codewreck.org> wrote:
> > -       printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
> > +       printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -160; }\n' "$nftcmd" "$pf" "$nftable"
> >         printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postrouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
> 
> Should this one be -160 too?

Good question, the only two chains I'm aware of conflicting are
wg-quick's premangle and ip6tables's mangle/PREROUTING rpfilter
(e.g. a rule like:
ip6tables -t mangle -A PREROUTING -m rpfilter --validmark --invert -j DROP
)

As I understand rpfilter only makes sense on prerouting or broadly
speaking input (firewalld's nft backend will move the rpfilter rule all
the way down to filter input table, but that's not possible with
ip6tables) - it checks the incoming packet came through the same
interface we would send back to.
For postrouting the kernel already picked an interface for us so there
would be little point in checking the kernel would pick the same
interface again? So no rpfilter and marks aren't used in these rules.

If someone ever comes in with an ip6tables rule that relies on mark
checking in mangle POSTROUTING then it would help to move postmangle to
-160 as well, I'm just not aware of any.
Letting you decide on this one, I'd tend not to bother until a usecase
shows up, but I guess there's no harm in moving it anyway....

-- 
Dominique | Asmadeus
