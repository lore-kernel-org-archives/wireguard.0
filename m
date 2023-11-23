Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE21EC46CD8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:25:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b8b5526;
	Wed, 20 Dec 2023 04:59:02 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45b4893e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Nov 2023 14:32:16 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A1135C00C4
 for <wireguard@lists.zx2c4.com>; Thu, 23 Nov 2023 09:32:15 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute2.internal (MEProxy); Thu, 23 Nov 2023 09:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unexpl0.red; h=
 cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1700749935; x=1700836335; bh=SA
 ik552WB0e9mVo86fen3jXNVqao1YdeH6OqGlN8lRk=; b=QWfxctTh5GfOQKVWhg
 nK7S0jGwKEesGeBq39c7wA4BoVbyxU1v/iAYFNl7MCcVi5ZoUZq7fX12QrrS5SdB
 Fl1G4p1xJWGE2bt3n0q/h2UcbOoC1mmyplUr6QN84uv6U1IAXW+uv3n11KDgKYy3
 ILHbuoTSh69mDVyk7tqM7tQUkOHbN9xFxtzhDHR0qZtv64xGdb1uFUGbcaHuqtfw
 DieqwrPW+6C8MxN6tcidCptyoL9LKpl9BaBdIHF1VYQxYtVOPKIuzSRwHSE1sGIG
 dCua3LXJGFBwsLvIkWBhTMzI0V2R0V4ITFObwNH6Nn2ZOUNL+u2zhju/QStdOczJ
 6Mrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1700749935; x=1700836335; bh=SAik552WB0e9m
 Vo86fen3jXNVqao1YdeH6OqGlN8lRk=; b=mMVtPEZzRQDno/7sGJ0+x5WwVv1mI
 mfcDDFjSjxafLb4wVCvqoUwAlg48LYvVsyFrH+qi631NxdgeEem1s173kZLjO+ot
 ZRAVO/QCyAEs210Zj7lCrBjn8fW90Zf35zPDNxq8Q7b+SwB11lL8+zRQfqM3aGtD
 nxeTt/iDDJajQc0fs9DQrgfV4k91pnLugr290/JDrjoE2vESQjjoSoCAU+qFEiH+
 KzLKCWbL1kRyQ2mGxst0rfCsTTFv8ZpSx7XGVXCwErhqhNcwoEySpOxF5pl2oh7X
 RHgH+kbiLu+Wp3O7hhRPO/BNAkwRSKhdp4A1RM8SExYJ27YYO1/uqtokw==
X-ME-Sender: <xms:bmJfZZRWwuXGh1WB3vjiNh_04zpu1F56PTiyUL2GnPPWqIeM5LJKag>
 <xme:bmJfZSzx7d3uBZp7hU78kWCg7eICyn_5HkMt-p-1AJHw8RUbddmzbSDBHKLwsr2Ar
 Rozh2_NM5_9xZ3ACpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehfedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepiicuoegu
 iihmsehunhgvgihplhdtrdhrvgguqeenucggtffrrghtthgvrhhnpeekheefkedvudfgle
 eiffetvdduteffkeekueegkedvgeejjeeuffdugedttddtgeenucffohhmrghinhepghho
 ohhglhgvrdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpeguiihmsehunhgvgihplhdtrdhrvggu
X-ME-Proxy: <xmx:b2JfZe2P7biq278k1aNXsMVukHoAL13wmWOPOZjHjdLXMh8INq76Iw>
 <xmx:b2JfZRCi1KVGF0MlTVpAUeyP8T0D0DB2a8ztvABopP7giWoNNtresw>
 <xmx:b2JfZSglJyiVDFMnZV6lRkOQQaJhLUkkqeqP7kUSoWf5m4DiXLPhYA>
 <xmx:b2JfZdt_h005skSCfZhbq4VANw5dbp7uTlwAYY2cWHKFoRF5dTok_w>
Feedback-ID: i0fcc46dd:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D93F6BC007C; Thu, 23 Nov 2023 09:32:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <44acf7f1-3a68-4e82-bb2e-0f296490b7ce@app.fastmail.com>
In-Reply-To: <CAEqCujJ7bck6w0UiKdwXFfH6R+RWgALZg5JUxEuQupUgPRHQPg@mail.gmail.com>
References: <CAEqCujJ7bck6w0UiKdwXFfH6R+RWgALZg5JUxEuQupUgPRHQPg@mail.gmail.com>
Date: Thu, 23 Nov 2023 14:31:53 +0000
From: z <dzm@unexpl0.red>
To: wireguard@lists.zx2c4.com
Subject: Re: UAPI socket for the macOS sandboxed Wireguard app
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Would like to see this reviewed, as it appears to accomplish #4 on the MacOS TODO list[0].

I know Jason hasn't gotten a chance to review yet, as he says in the wgctrl-go PR.  If we need extra review bandwidth, I can do some testing if desired.

-dzm

[0]: https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY/edit

On Sat, Oct 7, 2023, at 10:46 PM, Jan Noha wrote:
> Hello,
>
> I want to submit a series of patches concerning Wireguard on macOS.
>
> If it's ok, I will just link to a github PR which links to three other
> PRs (in wireguard-apple, wireguard-go and wireguard-tools).
>
> https://github.com/WireGuard/wgctrl-go/pull/143
>
> Let me explain what this is about. I've been trying to automate
> Wireguard tunnel configuration for some P2P use cases and I wanted to
> use wgctrl-go library for the task.
>
> This already works fine on Linux and Windows. On macOS, it's a bit
> more complicated. If you only use CLI for creating tun interfaces
> (using wireguard from homebrew for example), it also works.
> Specifically, wgctrl-go communicates with the wireguard user-space
> daemon via a unix domain socket located in /var/run/wireguard/ (this
> is referred to as UAPI in the code).
>
> However, if you want to use Wireguard from the App Store - which has
> some other advantages besides the UI (such as on-demand VPN and
> generally nice OS integration) - it comes as a sandboxed Network
> Extension. Currently, it does not expose any UAPI socket, so wgctrl-go
> cannot be used to configure it.
>
> The socket can be opened except it has to be inside the sandbox home
> directory. There is no problem connecting to it from "outside" using
> cli tools which are not sandboxed themselves.
>
> That's basically what I did here. Changes were needed in
> wireguard-apple and wireguard-go to open the socket in a
> macOS-specific location, then I updated wgctrl-go and wireguard-tools
> (so that wg commands work too) to look for UAPI sockets in both the
> sandbox location and the default one.
>
> If you're interested in discussing this topic further, I'll look
> forward to any feedback.
>
> Thank you,
> Jan Noha
