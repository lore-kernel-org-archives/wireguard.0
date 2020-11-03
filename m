Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6502C5517A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7704206B6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7704206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zackelan.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99feec2b;
	Mon, 9 Nov 2020 22:40:17 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1b946f5c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Nov 2020 08:55:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2981D5C0109
 for <wireguard@lists.zx2c4.com>; Tue,  3 Nov 2020 03:57:59 -0500 (EST)
Received: from imap10 ([10.202.2.60])
 by compute4.internal (MEProxy); Tue, 03 Nov 2020 03:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zackelan.com; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm2; bh=63/xEyCpiQYIn0y974ZSPPhqXA3/up3QzBlrohP7mP4=; b=ohtclUv5
 aE0hsxzaf8BrVj3iX2gSPGAVZyd25sBMr7QjCHGe7yb4va7oZP6psku6eY3xkUx8
 F3JWfFhOGkjsWLp20ul/bycZ8MEcw+nyvbnYQjjl37mkmfRvaSoVJ4KjCAZp/cHD
 D6UABUZChWR3tWPFaAR3hlwNCv1f9tbXblieGOE8sqinVl8MV+7FfkAdrXMaOsuP
 qETsSpHFUIPg4H/9H1CtP1Y+dkzpmM4Pz5BFldhQu9U4Ze578QcHqwIhbnj/4GWe
 FIscDlATOAHQTK4rwDfO/mr7aA/mWsJQLjZGwcbFihHr++tHIg3lN6VCnqvo6bbw
 cy5Mc9RjQfTssw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=63/xEyCpiQYIn0y974ZSPPhqXA3/u
 p3QzBlrohP7mP4=; b=rWnULVNsdvBHxq5zzkk4GWDB88STbRl0r374iTS9+GXt6
 8ado83b3XQu/c+ZVYU2SNZY3bsV9H5/sAXWf1nXxc9mLSkHvfSeg0JH2N2DjEG9L
 HQWLfjAefR3BqLXw1G+t7XWh/2VMF+rV8Q/x5OrWM5LVG1mF0RJZV52Snsg03Xyh
 6Cxuqhj+NruVY8/8ZXUOJDivUee0DiyGaOgux7Xyatgqx3mtTyX9z0Hn31NHInYl
 Kwek4H2hwIBvZXrzl58yiA8GfpxyLGxX9AU12a0PwgTh6GK9BKjyn1y6cHiir+BR
 Cvx64qCsxt28TH/A4eYPgLm+pOD1xjqGLAGbLD1LQ==
X-ME-Sender: <xms:lhuhX9J6lXfxYQyOZWSgrYkg017M3UnplY8RqsOL-GY4tXY4TReQug>
 <xme:lhuhX5ITjNSijIwHH7cpc-ft6O0TGDrScLwwepzCIAaCBqgIGdEKTJx7WmSuPliKR
 vn2wiEeNZf1Vhzfgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtvddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmd
 enucfjughrpefofgggkfffhffvufgtsehttdertderredtnecuhfhrohhmpedfkggrtghk
 ucfglhgrnhdfuceofihirhgvghhurghrugesiigrtghkvghlrghnrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejkeeguedvteetuedugedvgeekkeettdehhfejvdffkedttdffvdei
 fedtffelteenucffohhmrghinhepfihirhgvghhurghrugdrtghomhdpfhhrvggvmhihih
 hprdgtohhmpdiigidvtgegrdgtohhmpdhgihhthhhusgdrtghomhenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeifihhrvghguhgrrhguseiirg
 gtkhgvlhgrnhdrtghomh
X-ME-Proxy: <xmx:lhuhX1vZMfdOnv4WH2di1LCHxDRfvw_LfwYrf0ZFqw8DeTVdQEfu3w>
 <xmx:lhuhX-a5SJhZ4rtcZDRJqUbGmXP4JCKE1V4needtBiXDVCAqyCh-7w>
 <xmx:lhuhX0aPRz7uf5l064H5Up0t7wulbOIi4-i3dBFsQ9QA6GV8xxut7g>
 <xmx:lxuhX9mtN_wi4kqSoA3a_nNFM8SOuIEGuG545-vhvLlXdbcncCwdeA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CFA2A2016A; Tue,  3 Nov 2020 03:57:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <154faa3b-098c-45c2-ab3a-99e2cf9d6754@www.fastmail.com>
Date: Tue, 03 Nov 2020 00:57:38 -0800
From: "Zack Elan" <wireguard@zackelan.com>
To: wireguard@lists.zx2c4.com
Subject: DNS resolution retries and EAI_NONAME
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
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

Short version: if I set WG_ENDPOINT_RESOLUTION_RETRIES=infinity, I would like wg(8) to actually retry infinitely, rather than exiting the first time it gets what it assumes to be a permanent failure.

Long version:

When WG_ENDPOINT_RESOLUTION_RETRIES is set, wg will retry endpoint resolution failures...but it special-cases 2 or 3 error response codes [0] - EAI_NONAME, EAI_FAIL and (if defined) EAI_NODATA because it considers them "permanent" failures that are not worth retrying.

I have several Wireguard tunnels that are set to start at boot on a NixOS box I host. NixOS sets this variable to infinite for me [1]. Despite this, when I reboot that host, I consistently have the tunnels fail on startup. They're failing with a error that wg(8) considers permanent:

Oct 29 19:08:48 mord kernel: wireguard: WireGuard 1.0.20200908 loaded. See www.wireguard.com for information.
Oct 29 19:08:48 mord wireguard-wg0-peer-eG9xbERdnkQrnrpnRrteQQ4zKn-Bi2WA2V2Y2X0UCl0--x3d-start[1046]: Name or service not known: `4184f12df2343796c155.freemyip.com:12345'
Oct 29 19:08:48 mord systemd[1]: wireguard-wg0-peer-eG9xbERdnkQrnrpnRrteQQ4zKn-Bi2WA2V2Y2X0UCl0\x3d.service: Main process exited, code=exited, status=1/FAILURE
Oct 29 19:08:48 mord wireguard-wg0-peer-CBdpnmSVnwIvgtj4M1g3LlCLm-wooeo--x2bs5AARyoPjxU--x3d-start[1048]: Name or service not known: `d67930b08f5396e21ae1.freemyip.com:12345'
Oct 29 19:08:48 mord systemd[1]: wireguard-wg0-peer-CBdpnmSVnwIvgtj4M1g3LlCLm-wooeo\x2bs5AARyoPjxU\x3d.service: Main process exited, code=exited, status=1/FAILURE
Oct 29 19:08:48 mord wireguard-wg0-peer-J4rZgtReGrTwTglP05wLQt1GniIfUV4o4zAqcO-b3AI--x3d-start[1047]: Name or service not known: `9fa2756baed60cb5f18e.freemyip.com:12345'
Oct 29 19:08:48 mord systemd[1]: wireguard-wg0-peer-J4rZgtReGrTwTglP05wLQt1GniIfUV4o4zAqcO-b3AI\x3d.service: Main process exited, code=exited, status=1/FAILURE

This host gets an IP from DHCP a few seconds later, and after that I can SSH in and manually start the Wireguard tunnels without issue.

The assumption that wg(8) makes - that EAI_NONAME / "name or service not known" is a permanent failure - may be true in some cases, but isn't true in mine. 

I think it might also make sense, along with not special-casing those error codes, to lower the default number of retries to maybe 1 or 2 (instead of 15)? That would achieve the desired effect of not taking forever to fail if the error truly is permanent, but also allow use cases like mine where the tunnel is configured to start on boot and I want "the network will be up soon, trust me" retry behavior.

0: https://git.zx2c4.com/wireguard-tools/tree/src/config.c#n245

1: https://github.com/NixOS/nixpkgs/blob/nixos-20.09/nixos/modules/services/networking/wireguard.nix#L280
