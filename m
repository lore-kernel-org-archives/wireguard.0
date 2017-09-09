Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b825f9e
 for <wireguard@lists.zx2c4.com>; Sat, 9 Sep 2017 15:07:39 +0000 (UTC)
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
 [209.85.213.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f44a6a6
 for <wireguard@lists.zx2c4.com>; Sat, 9 Sep 2017 15:07:39 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id v203so6148984vkv.3
 for <wireguard@lists.zx2c4.com>; Sat, 09 Sep 2017 08:33:31 -0700 (PDT)
MIME-Version: 1.0
From: Wang Jian <larkwang@gmail.com>
Date: Sat, 9 Sep 2017 23:33:30 +0800
Message-ID: <CAF75rJA4jjfQPQk1DM0TuGAXFyQrPx3v52Jwkdej=nsowpTDEQ@mail.gmail.com>
Subject: The plan for road warrior access?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Wireguard is great for site to site VPN, even in current early stage.
We will replace our IPSec deployment with wireguard, after the
multihome issue fixed. Thanks for your outstanding work.

For road warrior access, I think it's quite straghtforward to build an
SSL VPN around wireguard, to address these issues:
1. integration into existing authentication system (ldap, radius, oauth2, saml)
2. address pools, allocation of client address; multiple connections per user
3. pushing address, routing and dns config to client; split or full tunnel
4. ACLs

(The client.sh demo is an example)

But wireguard is in early stage, the mentioned functionalities can be
designed as part of wireguard and tools, protocols.

Wireguard is meant to obsolete IPSec and likes. How about your plan on
road warrior access?
