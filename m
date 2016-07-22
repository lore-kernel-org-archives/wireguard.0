Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 252eac40
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 12:40:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bdd3706
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 12:40:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2cca54b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 12:40:52 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b199so84851195lfe.0
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jul 2016 05:42:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160722113212.GA17578@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to> <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jul 2016 14:42:52 +0200
Message-ID: <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I usually do something like:

wg set wg0 peer ABCD allowed-ips 0.0.0.0/0
ip route add 0/1 dev wg0
ip route add 128/1 dev wg0
./tungate.sh proxyserver.wireguard.io

The tungate.sh script just ensures that proxyserver.wireguard.io is
reachable with the original route, and takes into account ifupdown
changes:

http://0bin.net/paste/oobWhr-vTxhwyo+V#eT1QmdqFr455L0uEHYlduNSEDeUAkfV+v9KMWordUCQ
