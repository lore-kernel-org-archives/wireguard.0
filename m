Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D84C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc6b1dc6;
	Tue, 20 May 2025 19:54:44 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d30fc49a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2025 22:51:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 810862540172
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2025 17:51:07 -0500 (EST)
Received: from phl-imap-13 ([10.202.2.103])
 by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 17:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eizinger.io; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1739746267; x=1739832667; bh=2WMizP00uf
 lSMmkU7mF27Kvs4UxwxG0DyqJ0P8VSQu0=; b=qVB28UygiSGoiHhS7peNZM1Njh
 SMW0VHHeUMonj38FLhzKMUEouZtGofcYPeYk+LSc2gZdJn13HVOCI6lQRTwjBLG5
 5zhjfzng90hUUpyQDYP3V/PaXKhW/jgMrWx7JICBKTp7P8HHk0JEmngPloJtLe4e
 OUqJHU9rFjq8+jaJqCteqp1epbUvmv1F+inSYCTUzq5pF9Xj9aAq5/DdDBdNNseC
 RsHCkPJSyQJ4LdavSzVRtf/JijJCwFd3rpwe+Q1B4XzpVZ9leDRP4SMkezuF171G
 xn3y1KcASIuDZZq1ceP50Hapr/aBE/44uv1I8Vv7NcADO1IvWVJpBnOmAA9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739746267; x=1739832667; bh=2WMizP00uflSMmkU7mF27Kvs4UxwxG0DyqJ
 0P8VSQu0=; b=ZkpiSdYf0Qk+G1fbZhH1S0hRtaB/rpg2SggQL4LTXmRPKi+t4Fb
 ui4ZqiXErg0T64oE5gTSeH6XiCJNk5Yk0nlQnwgwhmcohsGKQpU1wzBrdyMeDttx
 /iLuRu7f7yk0iJ8z/w2XvwogGHxkojYGoAubU+nfyirQ70Ijq1/BCsHvQNOgcfp1
 15R3XBR5TodCSkn0W5PQU0D4mWC9hSasAwnaBwiZvSXJM4KE+vlMeo/QPlsl8pby
 0m1Kcg8brThkjVOtr2sT5J8nDa0t8x+vZO4KoMlTb22rGtD4h83BvxWt7FxlIvuy
 7FNKwDR287IiCPcwaKU5YoO+x6jXpjZ0ogQ==
X-ME-Sender: <xms:2muyZ_RPxyoPRl8jv89fRWbJrHqLwuFK3KOG05CsbBXH7SrLfgivlg>
 <xme:2muyZwxfmN2Qy_GnGJZaiEqqTE3nwf2-7-MRU_ruHBRG55HjT4cBoti1ckVg2YvVi
 91yUvgMy2U1NQ33Mh4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehieejfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
 fhvffkufgtgfesthejredtredttdenucfhrhhomhepfdfvhhhomhgrshcugfhiiihinhhg
 vghrfdcuoehthhhomhgrshesvghiiihinhhgvghrrdhioheqnecuggftrfgrthhtvghrnh
 eptefghedvhefgfedvvdegfeeiheduheejjeethefgkefhvdetieevkefgueekgfeunecu
 ffhomhgrihhnpeiigidvtgegrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepthhhohhmrghssegvihiiihhnghgvrhdrihhopdhnsggp
 rhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifihhrvghguh
 grrhgusehlihhsthhsrdiigidvtgegrdgtohhm
X-ME-Proxy: <xmx:2muyZ02YtT1jbCjp8K6ZWwF1l53p8pw3Okg3SGH1HxS1kzs1Z5nV6Q>
 <xmx:2muyZ_ByBt8mK3atABozxvrTwRiqQdKPvPp6PbJgfbiZIEqYGFpf1g>
 <xmx:2muyZ4hUhhIF8qa3DSLEkBefrnxjrUCubkC1ZMmeXymFuXhv8B8XWg>
 <xmx:2muyZzrKavEgEaRalvGF9Z4vGDdyLV5TIKhEvFPXzINTYFyiu4FPyA>
 <xmx:22uyZwKSbrw8Oy9xK93XmgtJX1tedtKwiJwBFTItaJMsl2VCzWSfIw_1>
Feedback-ID: i89514918:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id C8CD51F00072; Sun, 16 Feb 2025 17:51:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 09:50:33 +1100
From: "Thomas Eizinger" <thomas@eizinger.io>
To: wireguard@lists.zx2c4.com
Message-Id: <3026a6c9-ee83-43b4-97a1-0904d85b8ad7@app.fastmail.com>
Subject: Race-condition when removing instance of WinTUN adapter?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

We are receiving variations of the following errors on multiple Windows machines from customers. The UUID is what we are setting as the tunnel adapter ID.

```
Spawning native process to remove instance
Error executing worker process: "SWD\WINTUN\{E9245BC1-B8C1-44CA-AB1D-C6AAD4F13B9C}": The system cannot find the path specified. (Code 0x00000003)
```

and

```
Spawning native process to remove instance
Failed to create process: rundll32 "C:\Windows\Temp\ab11b60bba2fb3bcc9a355e9e3a89003522ede647bc6c00704e734a8447c1ce5\setupapihost.dll",RemoveInstance "SWD\WINTUN\{E9245BC1-B8C1-44CA-AB1D-C6AAD4F13B9C}": Het systeem kan het opgegeven pad niet vinden. (Code 0x00000003)
```

(Error message here is Dutch because that particular customer is in the Netherlands. It means "The system cannot find the path specified")

From reading the source code at [0], I suspect that this is "only" a race condition where the adapter is simply no longer present at the time we want to remove it? I am not very well versed at C code which is why I figured I'd ask here before attempting to patch the code. Would it make sense to add a check for this particular error code and not fail as a result, making the function idempotent?

Any insight is much appreciated.

Kind regards,
Thomas Eizinger

[0]: https://git.zx2c4.com/wintun/tree/api/rundll32.c#n160
