Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC70C47420
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:14:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABE352137B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g20ldOkS";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="a21tAS1J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABE352137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5f10b10;
	Thu, 1 Oct 2020 10:40:45 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 591ea694
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Sep 2020 15:51:10 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4BzrXP6JcQzKmQY
 for <wireguard@lists.zx2c4.com>; Sun, 27 Sep 2020 18:22:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:content-type:content-type
 :date:date:from:from:subject:subject:message-id:received; s=
 mail20150812; t=1601223746; bh=cAFntiOUjBx+OeCEhJyk1z54LujnDaUR5
 p+OkZHvCkI=; b=g20ldOkSAcBsRKFTorBIDLVHQ5Nm0vuw5wlOP2nyozOeO5TOe
 vsfrDTckfX/Q2FgYDcK7qEjv1ttBfCUpXtrYS/wi1veuSWYVgfa75hAcuGI3zNoA
 jMKPbITYe4xvYFPi2SO74dNKn8yoVemrNliCm6eEbVTF8uH5XA2O+I/uJZWdio0G
 9eBKtEchbs8kk01MFvpwpW+RqrTbIdwrbvZ33NDYJJsfP0qD9qgG9JwndtB2Jz7Z
 3yDrQaAFkgmvKnBvjEY36HpIttw4SHXsBYBbbAa+R1cEThXUBjSQt6ONzVTWt5az
 b9sRgs/DT2hzJEsaS2lWshpWpCVAwThvRmC+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1601223747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hXJdiyCg/JUT1TlaxpcpprUAUiKVRGW+LdCZ4ldAsBY=;
 b=a21tAS1JVlCzp6slVWVeEej+dWfIe/4QYJE6KKTXZCoNhF85ZQi6oDgJD8FvbeO+F4hwNs
 t4+BH8VwQLZWduIhNCXBLmoFK3d6RJTDimsYta/2xg+xVl5uLn7kFvuuEWPwke+h/czk3v
 tYQuvAxMitxSRWhLcylzBUPMxHvKUmqp+MIAUGA4UqkAYoexHqdCTWPA0gi5r/ebhC5xe7
 ZdhOuW9eBZQIrvF6M+80vfI8nVnurjjI1yJ67Y/Z/C+J8It2Xkg5AYGYsBQAtfXk3584hK
 y2TTnqYuKeZ+8cNBGZQbA0uZpO6kLsqJBGJAy/mLnmCpNh2OogD3/HNzeJrNeA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id NHZV0DhxpJJw for <wireguard@lists.zx2c4.com>;
 Sun, 27 Sep 2020 18:22:26 +0200 (CEST)
Message-ID: <9fb89fd06db799a7a1981205562f7cc933a5a0c5.camel@mailbox.org>
Subject: Wireguard wg-quick defaults conflict with Kubernetes firewall
From: Sebastian Rose <sebastian.rose@mailbox.org>
To: wireguard@lists.zx2c4.com
Date: Sun, 27 Sep 2020 18:22:25 +0200
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.52 / 15.00 / 15.00
X-Rspamd-Queue-Id: A3772150C
X-Rspamd-UID: da5e1c
X-Mailman-Approved-At: Thu, 01 Oct 2020 12:40:42 +0200
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

Hello,

wg-quick in its default configuration causes routing conflicts when the same host is also running a kubernetes
master node. The issue seems to be how wg-quick marks the traffic to route to the Wireguard peer: 
https://www.wireguard.com/netns/#routing-all-your-traffic
This leads to a loss of network connectivity when Kubernetes and Wireguard are running simultaneously on the
same host.

wg-quick (when not instructed otherwise) generates an wg0 interface like this:

> interface: wg0
>   public key: [REMOVED]
>   private key: (hidden)
>   listening port: 37827
>   fwmark: 0xca6c
> 
> peer: [REMOVED]
>   endpoint: [IPV4]:51820
>   allowed ips: 0.0.0.0/0, ::/0
>   latest handshake: 1 minute, 21 seconds ago
>   transfer: 161.54 KiB received, 185.11 KiB sent

Additionally, the following routing rule gets created
> rule 32765:	not from all fwmark 0xca6c lookup 51820

> # ip route show table 51820
> default dev wg0 scope link

This got created with the following configuration:

> # wg showconf wg0
> [Interface]
> ListenPort = 36768
> FwMark = 0xca6c
> PrivateKey = [REMOVED]
> 
> [Peer]
> PublicKey = [REMOVED]
> AllowedIPs = 0.0.0.0/0, ::/0
> Endpoint = [IPV4]:51820

As part of a kubernetes installation, the following firewall rules get added:

> # iptables -L KUBE-FIREWALL
> Chain KUBE-FIREWALL (2 references)
> target     prot opt source               destination         
> DROP       all  -- !127.0.0.0/8          127.0.0.0/8          /* block incoming localnet connections */ ! ctstate RELATED,ESTABLISHED,DNAT
> DROP       all  --  anywhere             anywhere             /* kubernetes firewall for dropping marked packets */ mark match 0x8000/0x8000

As far as I can tell, Wireguard marks its traffic with 0xca6c and Kubernetes wants to drop traffic that's
marked 0x8000. Since 0xca6c ∧ 0x8000 = 0x8000 all Wireguard traffic gets dropped and there is no network
connectivity.

Proposed solution:

Change FwMark in the [Interface] section of the wg0.conf to something like

> FwMark = 0x4a6c

This will cause the kubernetes firewall not to conflict anymore with the defaults of wg-quick.

Best,
Sebastian

