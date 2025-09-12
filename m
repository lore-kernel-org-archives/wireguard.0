Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F84EF06E4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a40798f5;
	Sun, 8 Feb 2026 17:13:05 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ed9beb3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 15:28:51 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 385AD1400431;
 Fri, 12 Sep 2025 11:28:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 12 Sep 2025 11:28:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=6f.io; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm2; t=1757690930; x=1757777330; bh=8xP/ZS6EgFKAqwo/R0Ifw
 BYV4jVedRIyCCEKQh1W9E0=; b=Skma1bPGy7/H6ohLz/9Jlggu6mmSyquIL15a4
 ajDjaoH3h35+pbgaDTCrcn8ywIzcHPpTSHh892ZlcKV9c4e3HOoVgKnzaB30WLX+
 wUDIDxOBeSdOmourb96Qrlr67cKiE3Acev5rPoNemgAVmElxpeXyqgwxHYIQnE58
 x/Zba2ZuLa8vPHaXw2Hz+w7eOayehjHzFnQecVSwLVpkkoa3XqTQ15MRXslzrkys
 RtZ6+dMERnda2JGcdGypS9V5FJc4A77rJPG2Ppdm46waexhGlXAnXgHA1Xd/JAcF
 vflU7nKWhaw4e/ptBOQg9n9gucEFluYiCpOsADozrSs6WQ9Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1757690930; x=1757777330; bh=8xP/ZS6EgFKAqwo/R0IfwBYV4jVedRIyCCE
 KQh1W9E0=; b=G0eBY7RE+VeNdYX3Xm/p1Uu68N8WBoHcm1D8KQKqoZyqcMwp4Tw
 6pUmaQ57FnTi2GFe5TK3lb8LPYhRUYdEjThJ/mcsauTOC6EUi/Oo5+RQPtHdbA96
 cZ1KLRlNOSBSVTkRmqdPzWEPToDm5RiEdqHrelI4WaAZNeQaKrljvdXAuBOf4yqh
 SM9pzObdTXaHLrry67485Ilj5vPjmITe6baOgSJnmjGvg/pan0XVgXS1WbBo4URJ
 zNtxFlQ4xuTpSIZt/eprC0fcLmjKeDR1Brs3qFzlB4inao5tKwTVYL3Z0cjcCytQ
 OcBL8uDoIfUtXkzlztJEWmcl4R2a6TRe0Zg==
X-ME-Sender: <xms:MTzEaGd53dxuMLpYTegSamTA6HwmystgA8s9Ykp_-JQk4OzbO_oNFQ>
 <xme:MTzEaAYxnHYBI-LopinCZY2FjKzjWmC1FuJjP4Px1bYLSOcmy4T6a0bGRMj6wwX6D
 zkzVXbdM5bq0uU2E5g>
X-ME-Received: <xmr:MTzEaJWM7mEPjsSSKsOBsoQVl3rIoh9vZHR03QtuXcxP1NTDIrmfTzfu2rqD7AbNiA-PJ23c5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvleegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomhepvfhhohhmrghsucghrgihuceothhhohhmrghsseeifhdrihhoqeenucgg
 tffrrghtthgvrhhnpefgfeehieeigeekfeegfeelkedtgeffvddugfekuddtteevffeule
 ehueegfeefjeenucffohhmrghinhepghhordguvghvnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepthhhohhmrghsseeifhdrihhopdhnsggprh
 gtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifihhrvghguhgr
 rhgusehlihhsthhsrdiigidvtgegrdgtohhmpdhrtghpthhtohepthhhohhmrghsseeifh
 drihho
X-ME-Proxy: <xmx:MTzEaCg3Ar7VagAwkYLLpV7fJnNtGponp2dpHvjKfkAqKfmJlmRyog>
 <xmx:MTzEaHVX9wp9aa8gPrA9eTY1VKpgy98JqZ7TKZ--rU1GMA60UCK_rg>
 <xmx:MTzEaJMNVNXvT_KYSEni1GAJWuMDFzmXwNmU9AOxeXLy1-Ns7xfKzA>
 <xmx:MTzEaDbRUQj5lVaqzwRM5B_mlKXDpqMXo1LGV-sg3SYbUMhDsVjgVQ>
 <xmx:MjzEaHC2XgxuMnWqKGLZCseA6G27T8BCEYdUBboloYKU4oopsc9D7PRt>
Feedback-ID: i008149c3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Sep 2025 11:28:49 -0400 (EDT)
From: Thomas Way <thomas@6f.io>
To: wireguard@lists.zx2c4.com
Cc: Thomas Way <thomas@6f.io>
Subject: [PATCH] device: use gomaxprocs for device worker count
Date: Fri, 12 Sep 2025 16:28:44 +0100
Message-ID: <20250912152844.1128614-1-thomas@6f.io>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

wireguard-go currently creates a worker for each logical CPU available
on the host, which can be problematic in containerised environments
where the actual number of logical CPUs available may be significantly
less. Many modern server CPUs have hundreds of logical CPUs, and
containers often have a limit of at most 1-4. Such a large disparity can
cause significant performance degradation, and increase both CPU
throttling and latency.

The Go runtime has recently been updated to be aware of container CPU limits
to solve this.

https://go.dev/blog/container-aware-gomaxprocs

Using GOMAXPROCS(0) instead of NumCPU means that fewer workers will be
started in environments which can't make use of them, and should improve
the performance of wireguard-go. Regardless, it seems like the sensible
thing to do in-case the main program manually sets GOMAXPROCS to a value
other than NumCPU.

Signed-off-by: Thomas Way <thomas@6f.io>
---
 device/device.go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device/device.go b/device/device.go
index 6854ed8..5c04913 100644
--- a/device/device.go
+++ b/device/device.go
@@ -308,7 +308,7 @@ func NewDevice(tunDevice tun.Device, bind conn.Bind, logger *Logger) *Device {
 
 	// start workers
 
-	cpus := runtime.NumCPU()
+	cpus := runtime.GOMAXPROCS(0)
 	device.state.stopping.Wait()
 	device.queue.encryption.wg.Add(cpus) // One for each RoutineHandshake
 	for i := 0; i < cpus; i++ {
-- 
2.51.0

