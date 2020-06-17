Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08C1C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:16:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A14320679
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="Js/W+DCE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iFq+Nz28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A14320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da4dda26;
	Wed, 17 Jun 2020 07:58:44 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 148471a6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:58:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 06631478
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 04:16:44 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Wed, 17 Jun 2020 04:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=ZS1d1IUXBfrFJchR2+w9gXEBqtVcxA/
 SndNhYxgvqIo=; b=Js/W+DCESRF5w9IDe48tYLLLGSmOuKR5ou+XcAXEu3H3GiK
 7qPFIqe8QdzeTdTMpm2Y+jxWiSZ4glGb9xLY85nlkAZUNG66EGcolMPlBDWRJcWo
 PMtOtb283bIoZIf3VrUucWoZBxmrOJatEoefvzYa/ZC7kXWR2/XB5CjiGIewgHzS
 Z40m6CQ2VJyIYIgLU9BGggl8lcI/wJNBgqBq7bZPyq9inELdJFYveF8FqE2oMwJd
 3pBNMiFhsMEjsTbZxLAPctl9bZLavjmz/tngNjXl9Ph4Ff3D6j8JbtzoLH75TpSL
 BKB/QELACrdY0q7VMEcrbknlRA3KZppRTc71Nrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZS1d1I
 UXBfrFJchR2+w9gXEBqtVcxA/SndNhYxgvqIo=; b=iFq+Nz28Lsrxv0TARJK7LO
 pf7EN+cK8D9dCCuv19ZlUONnJxcEavy0LTiQ1BodkewdoaT0GERo18JM/j9PCq8J
 vLiSZYC3mpsezQ3aEE1NgZWiK1qf44NRzjJOyiswfFj4W1Wf5BCvpNyyRSTiWZpc
 VJ+wpXrlwsbm6TLQpRG+zkodRKfWk5S7+wbeuZOxCdU4vreOwE5sa0nQG4RqpkYb
 7oPg+8yB/dD1WxXKJZaJ9VLA5AIITuhsvTtoAu1LxnDfQMiF+KdPm8D/hpwoL2Ks
 6Mxtyb9Gy74N3YwNPqwWhqBrmpnerLvJLAWVNrDDagvR9898wfE6hwSOULSCg04w
 ==
X-ME-Sender: <xms:bNHpXnRQpKGq107mGdrvBf_OaS-W2Kuyijx72yPDXFVPsPjiKdD_Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedfgfhrihgtucfnihhghhhtfdcuoegvrhhitgesvghrihgt
 lhhighhhthdrtghomheqnecuggftrfgrthhtvghrnhepveduuedtveelieevheehjeelle
 dugeffvdekgefhheekheefvefhtdfhudelheeunecuffhomhgrihhnpehsvghnthgvnhgt
 rdgvshenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 gvrhhitgesvghrihgtlhhighhhthdrtghomh
X-ME-Proxy: <xmx:bNHpXoyVJH7Gc4X-JlJby73a-tgcDDkL52snzagelBdu_3xCb0GtaA>
 <xmx:bNHpXs3MX9BI-4Rrsk0DkzFWqI1-JDzsIT5VzcQYwJl9jekFPZFdDA>
 <xmx:bNHpXnDNqaI2apmUbFDUL_tw7AB5aZ3djZwZdvOEUO2YKl9-sQaCSA>
 <xmx:bNHpXsYWA8tQ2sEOMJuW9_9DQqEClmgJYzIAUGKyzRqfQeJrVqd6JQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 60A16180091; Wed, 17 Jun 2020 04:16:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-529-g3ee424a-fm-20200611.001-g3ee424a1
Mime-Version: 1.0
Message-Id: <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
In-Reply-To: <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
Date: Wed, 17 Jun 2020 20:16:21 +1200
From: "Eric Light" <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: add restart command
Content-Type: text/plain
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

As a purely Debian user, the 'service x restart' pattern is far more memorable than the syncconf method.  I know personal preference isn't a great reason to add a knob, but Garrit's method is probably going to be much more familiar to many users.

As to _when_ you'd need this... during a config update as you mentioned, but possibly also to easily generate logs for troubleshooting a config I suppose?

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Wed, 17 Jun 2020, at 19:47, Jason A. Donenfeld wrote:
> Thanks for the patchset. I'm wondering what the intended use case of
> this is. When do you need to set the interface down and then
> immediately up again? Most changes to the config file can be reflected
> with a more simple:
> 
> wg syncconf wg0 <(wg-quick strip wg0)
>
