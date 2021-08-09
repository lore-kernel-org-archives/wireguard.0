Return-Path: <SRS0=nfW+=NA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2CBC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 12:34:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF59360F35
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 12:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF59360F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7515d493;
	Mon, 9 Aug 2021 12:34:48 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24f2eb0b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Aug 2021 12:34:44 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id B436F22889
 for <wireguard@lists.zx2c4.com>; Mon,  9 Aug 2021 14:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1628512476; bh=nSHhnY3ZJJGfN5F7rZ7PfkZw8AhYQkVKuT9otbYNH4w=;
 h=From:To:Subject:Date:From;
 b=nvBnGXtWS9d+JxF6GDu27feWpktaSrXL03f1G+pytO0DZWl0k7A4CV51A/NQyDFgS
 mypLY5IwR4mboG0Sm41oda9B2Qihl9qCBX7Fj887baOPv67PO02vxd5mOLo1HGcqnc
 +Ul8QxvHkWvjNT3B8iRdLj6+uaobu/YfTrzNVbyEdXSqOJl8vtzTLwd8hCoWZ92AJN
 r2RCjEskIC6pkdHc40Z6o1JHQ556mwCQGpXAAFaxgwCfjldS6CHOnA2m7l6c27pTGC
 hKI/YElzxz78sEb2U+c9pCwN3dsrP4Fofws+LDmeDAuV/FO/QcyKNtnz4Q8YJBmrZr
 5+7H3xDtke2OQ==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id CA0561A70539; Mon,  9 Aug 2021 14:34:43 +0200 (CEST)
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Wireguard as a Kubernetes Service
Date: Mon, 09 Aug 2021 14:34:43 +0200
Message-ID: <87sfzire3g.fsf@ungleich.ch>
MIME-Version: 1.0
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


Hello dear WG mailing list,

I am interested in running wireguard servers (as in endpoints) inside a
kubernetes cluster. I have two different approaches and was wondering
what makes more sense:

1) Wireguard in kernel on every participating node

Assuming that the kernel module is loaded on the host and that a k8s pod
just sets the VPN configuration, every node that hosts the wireguard
service would need to be configured.

Given that a pod is privileged, this might work with a single instance
service that is only terminated on one node. I assume the usual roaming
problems apply so that only 1 node could host that service.

One problem I see here is that the host will have fragments left, even
if the pod is moved to another node. This might be able to catch using
finalizers.

The biggest "problem" I see is that the actual node becomes the VPN
endpoint and not really the pod.

2) User space client

Is there still any Linux user space client that could be used instead?
Performance is not the most critical point of running wireguard as a
service inside k8s, but more the ease of maintenance.

I see these two options, does anyone have a better idea on how to move
the vpn endpoints into a k8s cluster?

Best regards,

Nico


--
Sustainable and modern Infrastructures by ungleich.ch
