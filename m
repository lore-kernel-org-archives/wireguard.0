Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE43D49226
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27c09827;
	Mon, 18 Nov 2024 12:38:25 +0000 (UTC)
Received: from wfout3-smtp.messagingengine.com
 (wfout3-smtp.messagingengine.com [64.147.123.146])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b3f0b81
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Apr 2024 12:36:55 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.west.internal (Postfix) with ESMTP id A11251C000F7
 for <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2024 08:36:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 30 Apr 2024 08:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dotat.at; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1714480613; x=1714567013; bh=dIqwsmNgpC
 6hWqIJ10O6zsrRIz6gGpPw8IgC8IPoJ8w=; b=ZCcrpYe7Le4V5hLxgURw+rgSpi
 3aJt+xDyMkgbsKHoLbyiUH61LM6quP3CuxuS7fEDUtvNrGcbueh2mKS/5mZOmNlH
 8KKHoiMmvsm5u28+TssQE9It/pUQ9MzAJAWObpVg9OGuw0URk+c65LML1BlEnBTr
 cR/9NmXRFkqiHzNTVeOizV27VKsZsM6D2/z/Hns7D8JfJLvMWiRkeUDegbtf/yQL
 YcMu3PA1S8Gts9eRLA38JU45t573SUonkWP7D7tmqIRXO9A/YB62yFaFn3sg2oTG
 9sHMlcHs2nynS3D/9NmUIZ4d56dRFX80tDLVtFFON7r8VLyJw0ah0pCXjPyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1714480613; x=1714567013; bh=dIqwsmNgpC6hWqIJ10O6zsrRIz6g
 GpPw8IgC8IPoJ8w=; b=QYiU2dMFsb526GkLlDwj3gYZPDr5eW07u5zcjvZUjNZy
 gb/d0UpGjQTKarkFBBexxqwgk87JpxUYo0U2uAt5vMVctY2k/YFyEeU3tTGfccgQ
 aB+8PHq/B4JIKp0jSgLWoH1dVdmdl3P1/S+Bd0Sn8lLA3rhjd/Mfe1YemQscrZ2x
 vV258lGViWFHSpyXN6iFcgjkqQNtXRTcR6c6+jk7aX6AX31gt5YxTtQg54ZrNyU8
 /bwY10LI3B1b3oCdpiY1fu/JLJqFrXyPp/IK9zNaXKWGDhKiuuERcLz/5/0kUSSH
 zh6C55D5HWYM9OLXwmA95hfNrs49v/El4otAX8fiUA==
X-ME-Sender: <xms:5eUwZrVBy0cEVVRmbZ2dkSMyrQ3zVWIbHMFQe5HBnC9-4RTkXk7_tQ>
 <xme:5eUwZjm0Zf9_wRqeP2q7GT71LdAjn6soO9HEhsDDb9Kifm2SuKTs98v7YLTRDnyR2
 nCC2q_TqN4w2uc>
X-ME-Received: <xmr:5eUwZnZKJaj-cvLzywb5kqbGCGuUMUWKUWK09DFqJ618aGkiVwRGR6-JIQ-TxkcKZ-GC0fI8YP88_5ICg6PoeQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvufgjkfhfgggtsehttdertd
 dttddvnecuhfhrohhmpefvohhnhicuhfhinhgthhcuoeguohhtseguohhtrghtrdgrtheq
 necuggftrfgrthhtvghrnhepgfeiteehjeeijeefuedvjefgvddufefhfeejgeetvedvvd
 fgkeefvdfffeettddvnecuffhomhgrihhnpeguohhtrghtrdgrthenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguohhtseguohhtrghtrdgrth
X-ME-Proxy: <xmx:5eUwZmUkclYp5ap9n50m3RXUH1wLsx3Oh0FQa2nNNaXvQ2RFum_4MQ>
 <xmx:5eUwZlkBrLr3qWuhC8FRQQ46NDfB3xtSNnXn6glBXI726RpWQjzycw>
 <xmx:5eUwZjclZfFRObLetDHEMbBaaXRYIyV6578fY_70VnUAyVB7Mm1msg>
 <xmx:5eUwZvHT0Rp3BVQ0-4oONceHZahIOfdJMfcsc4Hh1wXA-Z-FK9MzCw>
 <xmx:5eUwZlt3QSI7iS8nGbR5tFpUZFyhFXWig7xqv1crlYt52bnPFnnXIiG->
Feedback-ID: i7158435c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <wireguard@lists.zx2c4.com>; Tue, 30 Apr 2024 08:36:52 -0400 (EDT)
Date: Tue, 30 Apr 2024 13:36:51 +0100
From: Tony Finch <dot@dotat.at>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg: include filename in error messages
In-Reply-To: <a0fe98b4-15a5-a60b-9eb2-2c721e60dd6d@dotat.at>
Message-ID: <22ae9383-52b4-6136-e52c-18e1b73d7d40@dotat.at>
References: <a0fe98b4-15a5-a60b-9eb2-2c721e60dd6d@dotat.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

Yesterday when I was setting up wireguard using ifupdown, I got a "file
not found" error which mentioned neither the program nor the filename, so
I was at a loss. After making ifupdown more verbose the problem turned out
to be wireguard.

When I was preparing this patch I really wanted to change all the error
reporting to use err(3) because in my experience it's reasonably nice for
the programmer and the user. Dunno if err(3) counts as part of a sane libc
or if it's worth spending time on such a patch?

-- 
Tony Finch  <dot@dotat.at>  https://dotat.at/
Fair Isle, Faeroes: Variable 2 to 4 in west Faeroes at first,
otherwise southeasterly 4 to 6. Moderate, occasionally rough at first
in east Fair Isle. Showers, fog patches later. Good, occasionally very
poor later.
