Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b087148
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 09:15:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fefee7af
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 09:15:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b8e5735
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 09:15:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 46a98cac
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 09:15:43 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id v15so1501432ote.6
 for <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 01:20:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
 <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Nov 2017 10:20:10 +0100
Message-ID: <CAHmME9peMcMadCJ2WCp2+gp8e+nDK7Zcp_SjpydHniLm8bKiFw@mail.gmail.com>
Subject: Re: Request: Optional "Comment" [Peer] entry
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Lonnie,

Quite a few people have requested this, and I've implemented it, but
never had the motivation to merge it. I keep hesitating between
thinking that it's a reasonable thing to want, and thinking that it's
not appropriate to have in a low level tool, and that whatever
configuration management apparatus you're using should handle it
instead. Usually I just defer thinking about it until later, but given
it's come up again, I probably should revisit the issue. There is some
precedent for this kind of thing: net devices have ifalias and
iptables has the comment target. However, routes in the routing table
don't have comments, and neither do IP address assignments on
interfaces (unless you're counting rDNS). So, hm. I'll think about it.

Jason
