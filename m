Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89894C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37425206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37425206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mcint.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fad478a;
	Sun, 24 Jan 2021 16:24:23 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f9856ee6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jan 2021 06:57:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 522975C0251
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jan 2021 01:57:53 -0500 (EST)
Received: from imap10 ([10.202.2.60])
 by compute6.internal (MEProxy); Fri, 22 Jan 2021 01:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcint.io; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=XwF3ZcS2kkTXQHEk+65T0sdCX2bMEDsrDGk9jTsu7Ps=; b=QW9dAx8f
 bYUZYKATXRU8ga8RZHMmJcvDwd3MH5LnghJnLWQ7hL/AqMhzfj40oLZ9/LX0rv0F
 suFnNWAI30BUqpIKsR+srp4BP4VKxSl9SkBtfxEpt70SwMhdjw/UyGWYhzi1cVDY
 9EET//AH/pl6+ZgJ9XOoYQh8n5bFS/RUDkuvyxLdCi9nS/dCatiDAqOSyb1iLOzy
 Jgykqjr1tZquAI07U+RQpMZXjFKEUZ3Ygbw3EKtz20RcpOUbYi9kGlxzOeh5cX5g
 +uKNID5AVzGYs+zAs/iSIwstNDebBF7z7mOX/63ujYeGuL6S5aHwMrnkVBjSeqpC
 xJv2DiVQzmxyBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=XwF3ZcS2kkTXQHEk+65T0sdCX2bME
 DsrDGk9jTsu7Ps=; b=YIwR7yxB1PxS+4vG0RJkqlhGX79uPy5J5gNBh+OrIhyqU
 A76592Qsun8AySPjYqmi3Y1kvrlBdvwfNlrqO4NHcMLrnKW+L9MgZBVol1zQc9Le
 m9M9XP88xGtWuI5+Y83/AfYg5kyY5kymdwwD0hhHpBcuL4o7JtWQUoq9U+teRNu+
 yoyFtt0J9AHN3mC+RTxJkQQQy64n+Nr9ZiPsMVOmLTq4/uqMBfInlesnnB7IykLn
 fsF5zwXA3Tbfqc+UmzZFTQZSm81cMGL0vT3IE2Xn/ORNUuJIlphO0SXWR2yn3pdv
 tyH1D3/JomiFOMOLSuESWV2X5N78wsh4G+BMqt/+Q==
X-ME-Sender: <xms:cHcKYNmtuJ715k9ARHp4ICdjg3eQB0gy7wE9NbE4Lz-l9FH5j2rX0A>
 <xme:cHcKYI0X1TqnDM8bqBLWsUvalcNQvMyK-UxyGa-m-9eqBqmDLLaJQekAPT2HWQK2c
 jZbdAnuH7Yfoczm5Ik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erreejnecuhfhrohhmpedfnfhorhgvnhcuofgtkfhnthihrhgvfdcuoehlohhrvghnsehm
 tghinhhtrdhioheqnecuggftrfgrthhtvghrnhepfefghffgveeuhedtudekuedtfffhle
 dviedtudfhvedvffegjeetjedtheekjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheplhhorhgvnhesmhgtihhnthdrihho
X-ME-Proxy: <xmx:cHcKYDoNQHOgnZ0129BZ9CZvdg26CXMRBbUcn7zWA3_ePaMmp7m1Yg>
 <xmx:cHcKYNkpg2ACqTZgo32OTh8i-T2aiSq2qHSBMdTcwYr-0UvKJOGd9Q>
 <xmx:cHcKYL2Lwe1CiMAUIZ2D9u8e-t8fVoF2UEO4mJ2TqNhZ17gbY6-INA>
 <xmx:cXcKYMCadZ2ydCmF0jI-oEDpXTJ_xKE1y2y1J_FVfA2JT1PStQMiuQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DAE534E0065; Fri, 22 Jan 2021 01:57:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <7a51e0ee-73f8-441a-9cdd-3aa305832c85@www.fastmail.com>
Date: Thu, 21 Jan 2021 22:57:32 -0800
From: "Loren McIntyre" <loren@mcint.io>
To: wireguard@lists.zx2c4.com
Subject: =?UTF-8?Q?wg-quick:_darwin:_DNS_cleanup_&_disabled/inactive_interface_ca?=
 =?UTF-8?Q?using_setup_to_fail?=
Content-Type: text/plain
X-Mailman-Approved-At: Sun, 24 Jan 2021 16:24:12 +0000
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

Hello!

I've been using wg-quick on macOS 10.14, with wireguard-tools at 1.0.20200827. I had one issue prompt investigation, DNS changes persisted after an interface failed to come up. I found a second, related issue, and added an extra error handling case in the wg-quick/darwin.bash script to fix the issue.
---
First, when some network interfaces or "services" are disabled, wg-quick would attempt to bring up the interface, in darwin.bash:449:cmd_up(), something errors and the trap handler runs before :446:monitor_daemon, but after / as-concluding :465:...set_dns, on INT / TERM / EXIT.

This failure occurred as set_dns concluded, but before monitor_daemon and its cleanup del_dns trap, so wg-quick leaves DNS for the system misconfigured. Adding del_dns to the cmd_up trap seems appropriate, and leaving del_dns in the monitor_daemon trap seems appropriate. 


Minimal reproduction of the DNS non-cleanup failure should require only: a network interface set to inactive/disabled in Network.prefPane, and using wg-quick to bring up an interface.
- Interface: disabled / wg-quick: fails. 
- Interface: enabled / wg-quick: succeeds. 
---
Second, when the last interface in the loop is disabled, `networksetup -setdnsservers 'EXAMPLE IF' 10.0.100.53`, returns only:
> (Please note: EXAMPLE IF is currently disabled)

Because `-e` is set for the whole script, when this line is read, the final comparison of the loop fails, causing EXIT when set_dns exits.
> src/wg-quick/darwin.bash:298:           while read -r response; do
> src/wg-quick/darwin.bash:299:                   [[ $response == *Error* ]] && echo "$response" >&2

See toy examples in:
> while read -r var ; do [[ $var == 2 ]] && echo "var: $var"; done < <(seq 3); echo ?$?
> while read -r var ; do [[ $var == 3 ]] && echo "var: $var"; done < <(seq 3); echo ?$?
---
Patches to follow

Best,
Loren
