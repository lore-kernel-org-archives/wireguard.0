Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d14dbfd3
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 14:26:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35ea1ef5
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 14:26:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8742f377
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 14:17:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2c70900f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 14:17:52 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b8so3814568oib.11
 for <wireguard@lists.zx2c4.com>; Thu, 22 Feb 2018 06:34:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <630889583.2626955.1519303108947@mail.yahoo.com>
References: <630889583.2626955.1519303108947.ref@mail.yahoo.com>
 <630889583.2626955.1519303108947@mail.yahoo.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Feb 2018 15:34:34 +0100
Message-ID: <CAHmME9ongKKWPBvnavvzQv0Sb2qrh6fCZ5PNafSNtkbLP2Bdmw@mail.gmail.com>
Subject: Re: ExtIP change no new handshake
To: Hannes Wagner <sirus.lopus@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

You can either try to set persistent-keepalive on the server, so it
notifies the clients about its change in address, or you can use
something like reresolve-dns.sh to reresolve your dynamic dns at
intervals: https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns
