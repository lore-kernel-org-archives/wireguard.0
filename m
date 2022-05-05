Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 May 2022 19:38:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 37e84baf;
	Thu, 5 May 2022 19:38:40 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f0506587
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 May 2022 19:38:38 +0000 (UTC)
Received: from blind.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id BC55620643
 for <wireguard@lists.zx2c4.com>; Thu,  5 May 2022 21:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1651779513;
 bh=GQL9joPKliS7GmXWMF4vphWNN/cM+dDczMQxKqIDZFk=;
 h=From:To:Subject:Date:From;
 b=G8+RlTYwJe6eXCC7R8FVY3QsRU2+udPKgzMfUvqZ50kRer80KLOx7PVelEgfic/km
 MRjYGOvgcJqlFNbDV2gCheGtgguEfEHmfoYjaDQcJ8zF5sFW1Gt1ua1PZKwb1L7xZI
 8X2m2bnVprx1amJZQU8de4Of9N76VfjQpKpYUkA3hAPa5t+LWH5LGHi5lz7AxBEVIj
 syr8LkQX1yEBjI/DLAbL8BJC2Hl+9/A1wOgo09hDGAGaCwsjwgK3Lt7B4y5uEBOHV1
 eqQsqdvfJRrdKR1b17QnVUJ/jX34oIfBT/KxI7SjMnhEpseVOJgJ8aEZxt+dkPeqhZ
 mi1cRePT0etHg==
Received: by blind.localdomain (Postfix, from userid 1000)
 id 3494F13A0C80; Thu,  5 May 2022 21:38:38 +0200 (CEST)
User-agent: mu4e 1.7.13; emacs 28.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: wireguard@lists.zx2c4.com
Subject: Interface not deleted in kubernetes
Date: Thu, 05 May 2022 21:32:19 +0200
Message-ID: <874k2393cx.fsf@ungleich.ch>
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


Hello,

I am not sure if I am off-topic here, but I am not sure where to best
raise this issue. The situation is: if I start a Pod in Kubernetes that
uses the ungleich-wireguard:0.0.5 [0] container, which is basically
using this script [1] I am able to get the following output:

--------------------------------------------------------------------------------
[21:29] blind:~% kubectl -n test logs -f wireguard-7cf446469-gmkvd
+ wg show
interface: clients
  public key: 5QzByP8MnQyR7seJWJyiP6fFHn5OnkPI+O0WAuYoLko=
  private key: (hidden)
  listening port: 51820

peer: fnIGys3sZKfyjSA7oXw891IOxuuRi7yYM6tihNG+1WA=
  allowed ips: 10.0.0.2/32
+ wg-quick up /etc/wireguard/clients.conf
Warning: `/etc/wireguard/..2022_05_05_19_29_32.4005058985/clients.conf' is world accessible
wg-quick: `clients' already exists
+ exit 1
[21:29] blind:~%
--------------------------------------------------------------------------------

As the pod/container are freshly created, I assume that the "clients"
interface is a leftover from a previous run of that container. Which
brings me to the real questions:

  Are wireguard interfaces

      a) Not contained in a container?
      b) Not destroyed if the container is destroyed?

As containers are namespaced, I would have expected the device to die
with the container, but I even cleared the full deployment and get this
error again.

My logical understand would be that the interface should be destroyed if
the container exits, however the output implies that this is not the
case.

Any pointers in this direction are very welcome.

Best regards,

Nico

[0]
https://hub.docker.com/layers/ungleich-wireguard/ungleich/ungleich-wireguard/0.0.5/images/sha256-cf50085115df1f686509288375349ce61cc4ef06a06c940cf7cbd9041a6d9ef6?context=explore

[1]
--------------------------------------------------------------------------------
#!/bin/sh

set -x

# Ensure everything is clean / show prior state
wg show

# Start all definitions
for conf in /etc/wireguard/*.conf; do
    # Try to up and if any tunnel fails -> exit
    wg-quick up "$conf" || exit 1
done

# Debug output
while true; do
    wg show
    sleep 300
done
--------------------------------------------------------------------------------


--
Sustainable and modern Infrastructures by ungleich.ch
