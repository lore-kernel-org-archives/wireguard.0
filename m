Return-Path: najoll@posteo.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b671996
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2018 04:25:04 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fb7b5ac
 for <wireguard@lists.zx2c4.com>; Tue, 6 Feb 2018 04:25:04 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id B794220ED3
 for <wireguard@lists.zx2c4.com>; Tue,  6 Feb 2018 05:30:51 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3zbBNC24Clz9rxK
 for <wireguard@lists.zx2c4.com>; Tue,  6 Feb 2018 05:30:51 +0100 (CET)
From: Nicholas Joll <najoll@posteo.net>
Subject: Strange behaviour with interface name
To: wireguard@lists.zx2c4.com
Message-ID: <3cfc3270-9a30-a6ce-cf80-76e2d5f1fe21@posteo.net>
Date: Tue, 6 Feb 2018 04:30:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Dear all

A conf file called

     wireguard-se1gb1.conf

generates, via the wq-quick command, an interface named thusly (note the
missing the initial 'w'):

     ireguard-se1gb1.conf [sic]

Nonetheless, the interface - which works - can be pulled down with

     wg-quick down wireguard-se1gb1.conf

(note the 'w' at the start of 'wireguard'). Renaming the conf file to

     wireguard-seGb.conf

generates an interface that is named as expected.


Wireguard: 0.0.20180118-wg1~xenial
OS: Linux Mint 18.3 Sylvia x86_64
Kernel: 4.15.1-041501-generic

Yours,

Nick
