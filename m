Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 167fa4a2
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 08:46:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5facf33b
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 08:46:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 306492ee
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 08:46:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be006aae
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 08:46:03 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id p80so151281373iop.3
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 01:55:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
References: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 May 2017 10:55:32 +0200
Message-ID: <CAHmME9pNgSjXeKnzM23Bb3Q=zZJKMDtq-3xevMzdtP7XdoMjkQ@mail.gmail.com>
Subject: Re: Ability to use one udp port for multiple wg interfaces
To: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Damian,

1. Always use the latest snapshot version of WireGuard. The one you
listed is out of date.

2. No, you cannot use the same port.

3. You may have multiple peers on a single wireguard interface. This
is the configuration that you probably should be using. "It is not
very friendly to open additional udp ports in multiple peer scenario
where firewall ACLs are desirable" This is 100% incorrect. With
multiple peers on an interface and a sufficiently clamped allowed-ips
entry for each, you'll have perfect firewall ACLs.

Regards,
Jason
