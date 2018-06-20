Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bac8e902
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 17:45:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57cef0d8
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 17:45:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9337448
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 17:44:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a5b0828c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 17:44:39 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id q17-v6so484077otg.2
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 10:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <8d3124af-de51-3253-8b89-02233566c4f9@rfa.cz>
In-Reply-To: <8d3124af-de51-3253-8b89-02233566c4f9@rfa.cz>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Jun 2018 19:50:28 +0200
Message-ID: <CAHmME9o1F6r6z8GMj3NqAWAM9-qybLfpOW=STbSso7hOdwFBqA@mail.gmail.com>
Subject: Re: listen on specific IP only
To: Tomas Herceg <tth@rfa.cz>
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

We don't allow this in WireGuard by design.

However, you can easily work around this with iptables:

$ wg set wg0 listen-port 11153
$ iptables -t nat -A PREROUTING .... -p udp --dport 53 -j REDIRECT
--to-port 11153

Fill in the ... with --destination or --in-interface or whatever you want.

Jason
