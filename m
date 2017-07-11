Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e74f46f
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:30:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ade722a
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:30:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3538535
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:44:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9ddc9c76
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:44:14 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id 77so9070387wrb.1
 for <wireguard@lists.zx2c4.com>; Tue, 11 Jul 2017 15:49:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871spmzke6.fsf@fifthhorseman.net>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr> <20170710025323.GC31153@zx2c4.com>
 <1499716437.988.1.camel@eggiecode.org> <87ziccyoo1.fsf@fifthhorseman.net>
 <71133f541e1824a0eeb5e2e624aa1f2f@jmt.gr> <871spmzke6.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 12 Jul 2017 00:48:59 +0200
Message-ID: <CAHmME9qAig60WBrjiz=se=B9zhBfhgMOma17MuiQPGdfs+UgRA@mail.gmail.com>
Subject: Re: Debian-based configuration for wireguard
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Wed, Jul 12, 2017 at 12:19 AM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> Good point!  it'd be great to be able to separate the private key
> information from the standard network information for that reason; it's
> not like people can't inspect the rest of the network config once the
> device is configured, so it would be nice to be able to just have the
> private key in an isolated file.


It is for this reason that wg(8)'s private-key and preshared-key
arguments take a file to the key, not the actual key itself.
