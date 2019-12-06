Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF301C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:06:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D117924659
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="WtCpjm5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D117924659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d01df00;
	Fri, 6 Dec 2019 15:06:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00dfceb9
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:06:22 +0000 (UTC)
Received: from mail-40140.protonmail.ch (mail-40140.protonmail.ch
 [185.70.40.140])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 601c3fa3
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:06:22 +0000 (UTC)
Date: Fri, 06 Dec 2019 15:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1575644775;
 bh=/3C0z5flEVF9y85WszDscsMEtx+wKTnEPK/m7Nk9SuQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=WtCpjm5o+9wOSRBBKwhPeozJ8D9KSfGq79hv0LF4KUGL1XQlBxWQALH/lYsllYnoc
 T8KM/x/+ZuT6V1pOQ8Us4qbBaoUQUrb5+KKABZDA90O8+vJnYo42jFbEKeXbbSo4mq
 vlMaAytZp8njXUrOc0clnVHGSuqW1cJ/kVB5PBFI=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
Message-ID: <51usC7EJy_alaYnTOuLCvYhTzzcKrvAfq01j0Vfu5QVd6OGARQLdDDqQymloKWhWqkp81E09bpwjSRw5mnJDwg5fv8FuAVS-W0CYLuJlpRI=@protonmail.ch>
In-Reply-To: <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "William J. Tolley" <william@breakpointingbad.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Thursday, December 5, 2019 8:24 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

>
> If we can make nft coexistance work reliably, perhaps we can run the
> nft rule on systems where the nft binary simply exists.
>

Will this work correctly on systems where nft binary exist but only
iptables rules are used?

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
