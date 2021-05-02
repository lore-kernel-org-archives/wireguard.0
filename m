Return-Path: <SRS0=NC//=J5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE469C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 11:02:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4571D6115B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 11:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4571D6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52447a4d;
	Sun, 2 May 2021 11:02:11 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6289cd7a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 May 2021 11:02:09 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 351871FE3B
 for <wireguard@lists.zx2c4.com>; Sun,  2 May 2021 13:02:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1619953329; bh=w3xA/P4NGSq6DiLCIGqXy5DLg+Tx8SwK2erJXcAnaRc=;
 h=From:To:Subject:Date:From;
 b=G0Bmor6os7SiVfS7bc7Lr+38Z1PyCLoYGzh2Fs2uD8Nq0QPZC1BzuBW5HIswTZhkd
 MVfjAzjrD7VxI4fHcYuF4wBIFnBmW7cbG25hnC+8eTNhMZ+8rp/5mr68z6EqiB3Jn6
 4maP9Bp20/tHR89+6YOaSdQR2bsb5ZqB9ikonMfNb5j3OAngVZB9VxZuu3MRCUbrqs
 dOFlYAVDc2fHSzmmA+QYgoupp/r9XFO09yfgvXlAR8+lSZcaQMQtYcw7ZDmkZtyKnS
 QsIwyeepnxO/Hz2ul32iducwnyepCkdynSLpKZRSeQ0K3l9fYNMtfEPWARbZP38BqV
 gLv7xWadMBpwQ==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id A8D7414C0423; Sun,  2 May 2021 13:02:28 +0200 (CEST)
User-agent: mu4e 1.4.15; emacs 27.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Multiple Keys per Peer
Date: Sun, 02 May 2021 13:02:28 +0200
Message-ID: <87wnshs8jf.fsf@ungleich.ch>
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


Good morning,

when running a lot of VPN connections using wireguard, there are some
questions we see quite often from users, two of which I'd like to
discuss here:

Multiple keys per Peer
----------------------

Users often ask for sharing their connection with multiple
devices. The obvious solution is for users to setup their own VPN
endpoint with the first key and then reshare themselves. However, this
is not feasible in many end user situations.

Conceptually I see it problematic to assign multiple keys per Peer as
the routing from outside ("where should this packet go to"?) might
become ambiguous. One counter option would be to allow a peer to signal
that it uses a certain part of the AllowedIPs. In comparison to layer 2
networks, I see two approaches: 1) a bit similar to ARP/NDP, client
addresses are learned 2) similar to dhcp-pd, clients "requesting" (in
this context more: announcing) that they use a certain sub-range.

Protocol wise I'd imagine this to be rather simple:

side a: I want to use 2001:db8:a:b::/64
side b:
     - checking your allowed IPs covers that prefix -> no ignore
     - checking whether the amount of sub routes is not exceeded
     - and/or checking whether the sub-prefix length is of minimum size
     (especially import for IPv6)
     - yes: adjust routing table, insert more specific route
     (with/without confirm probably should be modeld in tamarin)

What are your thoughts about an extension of wireguard with this?

If there are other suggestions to allow users to decide themselves how
to split a range, let's say a /48 IPv6 network, without setting up their
own redistribution node, I'd also be interested in hearing that.

Best regards,

Nico

p.s.: I have seen some old messages in the archive about this topic,
but did not a conclusion in it.

--
Sustainable and modern Infrastructures by ungleich.ch
