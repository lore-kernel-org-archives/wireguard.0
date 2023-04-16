Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF5EC77B78
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 11:14:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d48112a2;
	Sat, 22 Apr 2023 11:14:36 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b712f1c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Apr 2023 15:06:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2FA5332008C0;
 Sun, 16 Apr 2023 11:06:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 16 Apr 2023 11:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnnyutahh.com;
 h=cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :sender:subject:subject:to:to; s=fm1; t=1681657606; x=
 1681744006; bh=JwJEDjD1wcskeSgA+nZG9of/4xf0EI5tjDfYenwgO8I=; b=G
 SEES/7KO1gokF+WX1NWXY4Vp/a7iYcqRMRzxKFb+N8IeSyfexIqUjnFM0r7cqqXO
 UmUjQNSt3SWYF84yNxhSKURFEmOnreMoZXPdCeVbNgIUqVTb8IE1cmjzqAUKXM50
 dmNYvbIBP9Gv09Wc/IzA6Bk0ih07gHhquxJfiB6/H0wZEQP0kKu2Fz6N0ZWzlQcF
 eDVwrpuDlDCg3pYM/HoNL1J/yTndvgng1difRZdyMS6kKqdzHbhzLw3GkOscZKUF
 Ou9bHARfGj49lrYtpZTcQslh8+UeBj2Yjl3dQ+/zVy4zOWxqZFhhgREtbhqU7FhP
 JBwYp7zlu6g9HkAzeZ8hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1681657606; x=1681744006; bh=JwJEDjD1wcske
 SgA+nZG9of/4xf0EI5tjDfYenwgO8I=; b=Mitt55m8sqH20Wz5Df1KiLcWew3ju
 gyE3WZLfBho/IOWpOx/BKr84mq/UdzOop7aBIH2rAGR02xRSwL6VjCW7geUgXpyg
 KLL2Oe9Ha0ygmYQtUrOwoXbrQ4NPEblrv/nL/HLqDyAsPAsk4TScopCaRrMJlTRq
 0dWGUF4znfTbddbOCs6U+wyodzgUVS/pv/U9uKabtKmqNXb0vydYRU0VEwEgWOx5
 7BXV8NkqP401VfRlreZ26G02qvrpLrsPjVmMvNtE+VR8YKf6qfwtueZJml236glF
 bPAem2trG/a5ruNXB6PyV9Jyo+kintsvzo7waPJKrZa8lcMxsPiylA0iw==
X-ME-Sender: <xms:Bg88ZPLl9anjqJwNzAkSxM6ASNMYHia-jRrjJXvfGyN_19eY_YVejQ>
 <xme:Bg88ZDJwWGkaeYs2SQaG88v7Q0o-l-Ud64jZTY462SuDtLeq-iIvyOcHo_vEYIhQD
 2xb5Z7qmKYzzQ710gc>
X-ME-Received: <xmr:Bg88ZHsJ7RAoRVah5AjX7lLMgxShjKtmr4Mb0d6MwRLtucbax65iKzBZcorr0IpyTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelgedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvhffutgfgsehtkeertd
 dtfeejnecuhfhrohhmpeflohhhnhhnhicufghtrghhhhcuoehmrghilhhmrghnqdifihhr
 vghguhgrrhgurdgtohhmsehjohhhnhhnhihuthgrhhhhrdgtohhmqeenucggtffrrghtth
 gvrhhnpeelvdevtdetkeejlefgjeekhfduteehffffhfegfeejtedufeelfffhtddtieeg
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hilhhmrghnqdifihhrvghguhgrrhgurdgtohhmsehjohhhnhhnhihuthgrhhhhrdgtohhm
X-ME-Proxy: <xmx:Bg88ZIb3uNezx55f3fzQ1askmz5Ko45T_D-aOteLaJ8H3_aHbf5sYg>
 <xmx:Bg88ZGaM76eo1Z50ISuXdZChxTGSjvDEmsIIbyDFlGLuZC5gt7h4vw>
 <xmx:Bg88ZMAHERxPCAKXQ49JS34OMP0W0mEXTlOY_BcJh85hCbuQ0ztUDg>
 <xmx:Bg88ZPC6hVOvFrZAGOodBUljPtoLCCab4UOq_6-WTeNdH7wBtuZnKw>
Feedback-ID: i099146e4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Apr 2023 11:06:46 -0400 (EDT)
Message-ID: <da06afd5-82bf-56e7-aa27-394c750a44f8@johnnyutahh.com>
Date: Sun, 16 Apr 2023 10:06:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Johnny Utahh <mailman-wireguard.com@johnnyutahh.com>
Subject: How to optimize AllowedIPs "overlapping" routes?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 11:14:31 +0000
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

1. wg0.conf: AllowedIPs = 0.0.0.0/0, ::0/0 --> higher-latency network
2. wg1.conf: AllowedIPs = 192.168.7.0/24   --> much-lower-latency network

When enabling both of the devices/.conf's (listed as 1. and 2. above) 
concurrently, the #2 route travels over #1 (all starting up via 
'wg-quick'). In this scenario I'd prefer #2 routing "bypasses" #1 and 
retain its (#2's) lower-latency path/network. Can this be done, somehow?

I deduce the "route" for #2 changes when concurrently-enabling #1 
because the #2-ping-latency immediately and dramatically increases to 
match #1-network's latency (and immediately reverts to #2's lower 
latency when #1 is disabled). This hurts my #2 network, badly.

I'm running/testing the above on macOS v12.6.3 build 21G419, 
wireguard-go v0.0.20230223. If not on macOS, might this be feasible on 
Fedora or Ubuntu?

I realize this might be a FAQ. I could not find any docs/resources to 
help after a brief search, so I'm posting here.

[I'm not a networking expert, so I may be butchering various 
terminology, concepts. I apologize in advance for my ignorance.]

~J
