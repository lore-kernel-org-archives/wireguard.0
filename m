Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f123ea3f
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:20:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d688bf2e
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:20:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34a34e78
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:11:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f02b39d6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:11:57 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id a14-v6so11555844otf.6
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 15:35:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <trinity-ab8f59da-1b2f-40a9-90cc-d7aedaf3743c-1522773202032@3c-app-gmx-bs64>
References: <trinity-ab8f59da-1b2f-40a9-90cc-d7aedaf3743c-1522773202032@3c-app-gmx-bs64>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 00:34:59 +0200
Message-ID: <CAHmME9o1H2=VVwo=KgKqO5UK7W35ad9pLb0SxBgcby+Zy1Zt9w@mail.gmail.com>
Subject: Re: wg-quick (script snippets) for OpenWRT/LEDE
To: vtol@gmx.net
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

Hello vtol,

OpenWRT has its own robust configuration system, which can do nice
things like avoid circular routing. For that reason, the set of tricks
that wg-quick uses are best avoided on those types of fully-managed
systems. That's why it's not included in the package. Perhaps it
should be, though, for people who would prefer to use quick ad-hoc
VPNs? Have you tried running it with any success?

As mentioned here, you may be able to replace some of the UP/DOWN
hooks with hotplug scripts, or possibly other hooks that are part of
the OpenWRT system. If nobody pipes up here, you might want to ask a
generic question on the OpenWRT list about generally how to execute
scripts on events in relation to network interfaces.

Jason
