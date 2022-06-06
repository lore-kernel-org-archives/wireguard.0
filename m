Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6E4C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jun 2022 11:02:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f978a6c4;
	Mon, 27 Jun 2022 11:01:07 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 272783ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jun 2022 13:32:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A28A53200915
 for <wireguard@lists.zx2c4.com>; Mon,  6 Jun 2022 09:32:25 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute4.internal (MEProxy); Mon, 06 Jun 2022 09:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 abstractbinary.org; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654522345; x=1654608745; bh=tsoHai5kKb
 fITMOlT7ecbUYNfrJdF1Z8uJD6YfAws4c=; b=A6JNNvi4HZHfCDb2ylS2saErpm
 o3lwyPfpZ+FUbdLqAv6yKkTv3APHmbRyuq/QOqqrJuG+kjWe8N9R4uDw0U0TCYqC
 LA6iLNriZmayryCFQlxOkW0bcyZgUiNhO66wAxYuexqTWV4SkmyyvfA1kHaqp9fb
 4bXNDRAmQTscCJnCQ3k2NzLK9glVDqsAhoMMsw8Ml7GZRiaW40LoM/eS3mtBLVQY
 vVdMMH5uVmWAO54Zvvsd8lYrqKc+ckY0R73G48Y4UFMMoVHUd9tZ634YA5UWvOIb
 MdQC+Q3fnzTIYmJXtMKDk+CVyReTh33vF5DrkL0TXxj710xh7v1xsP30ClNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654522345; x=
 1654608745; bh=tsoHai5kKbfITMOlT7ecbUYNfrJdF1Z8uJD6YfAws4c=; b=s
 xJbaTMf7X4lgUkVb9IfKrF6lr3KaibxB233axJCfYxKeNo6u+zBs3wSBg/Gkbopu
 w5sWoEppIiIH3ch5hWhRr5vEXj8bhQQhOL0pkHzaD0a5rU4qcsOYbDMYXVkDIiI1
 P5Dwr1FPj8HVYwrdyS8focalJwnUs3U5DUb3jXyPedFmvaXZ09BzbnvOupr2tK4U
 YBqOEavZu7b6l8yWPC7KWSZ/wIsiSOPg7+sxUkQSJfXZtEUwn5tnhoEIZtC98T1e
 qsuc2pStUU4K+8y+XGi0I44U/OPCxiHbSSddaup1PyVhpeVUZgw+F0Ue7tmnGxb/
 ATQjYbzGOgd/nbKE5ADWQ==
X-ME-Sender: <xms:6AGeYgSYWdl5UEXvMVwkjFDg225_Bby3TuXLgMSqzBlg2pDRB4hcfg>
 <xme:6AGeYtxtX-2y94TcR0uPgKMH_uhXdoD0g4Wngb77BSGE06Qjz1WNal0zZMcFJhPWU
 A0epk_tgzqzLqnXWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedftehlvgigrghnughruhcuufgtvhhorhhtohhvfdcuoeifihhr
 vghguhgrrhgusegrsghsthhrrggtthgsihhnrghrhidrohhrgheqnecuggftrfgrthhtvg
 hrnhepgeejleduffevudduvefghfffvdfhtdetudeuhfffueelueeivdffueelueejlefg
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfihirh
 gvghhurghrugesrggsshhtrhgrtghtsghinhgrrhihrdhorhhg
X-ME-Proxy: <xmx:6QGeYt3GhdSXXjcC4xHM73VYSa1MvnHi32UbiCM_VyRT3pyX1ubKig>
 <xmx:6QGeYkCmP-wxXahZCFSPBxgyL4ex6WPEa1aoxVUk-4-DRZiBhwIV_Q>
 <xmx:6QGeYpgNu8W5JPg4MhuRYW0dULfaWe6ZdqJftySKq9_MWqaCl8hMoQ>
 <xmx:6QGeYkt_26qPAoL-erWnAlx-ErsRPnfv110ElnwMPPwyLmoVBKQXBw>
Feedback-ID: iff4c4080:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E06FC15A0080; Mon,  6 Jun 2022 09:32:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-592-g7095c13f5a-fm-20220603.004-g7095c13f
Mime-Version: 1.0
Message-Id: <fedd0d21-a55c-4e17-8dcf-dd348e157aee@www.fastmail.com>
Date: Mon, 06 Jun 2022 14:32:04 +0100
From: "Alexandru Scvortov" <wireguard@abstractbinary.org>
To: wireguard@lists.zx2c4.com
Subject: What's the purpose of the wg-quick firewall rules?
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 27 Jun 2022 11:01:06 +0000
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

Hi,

I'm trying to understand what the firewall rules that wg-quick adds do.

I see these rules being added:

```
table ip raw {
	chain PREROUTING {
		type filter hook prerouting priority raw; policy accept;
		iifname != "wg0" ip daddr 10.10.1.2 fib saddr type != local  counter drop
		iifname != "wg0" ip daddr 10.10.0.2 fib saddr type != local  counter drop
	}
}
table ip mangle {
	chain POSTROUTING {
		type filter hook postrouting priority mangle; policy accept;
		meta l4proto udp mark 0xca6c  counter ct mark set mark
	}

	chain PREROUTING {
		type filter hook prerouting priority mangle; policy accept;
		meta l4proto udp  counter meta mark set ct mark
	}
}
```

The `raw` rules seem fine, but I can't figure out what the `mangle` rules are for. They're added in `add_default`, so they have something to do with the "route all traffic through Wireguard" functionality, but removing them doesn't seem to break anything on my laptop.

I think the first iteration of these were added in commit ebcf1ef8b1ad in wireguard-tools, but the commit message is "wg-quick: linux: filter bogus injected packets and don't disable rpfilter", and that doesn't make it any clearer to me.

What breaks if these rules aren't present?

Thank you.

Cheers,
Alex
