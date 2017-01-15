Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dae5fef
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:07:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54253bf4
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:07:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b0b6c9f
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:07:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c47e59d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:07:13 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id f9so28644395otd.1
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 02:17:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d05b5f22-2c63-455a-b9d7-7526f8c867d2@gmail.com>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <d05b5f22-2c63-455a-b9d7-7526f8c867d2@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Jan 2017 11:17:33 +0100
Message-ID: <CAHmME9oeM6=CnWVQ4ufJgkk0CAVqTJKQRF-1ywYUJbGKAh+6TQ@mail.gmail.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
To: Ameretat Reith <ameretat.reith@gmail.com>
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

On Mon, Jan 9, 2017 at 9:46 AM, Ameretat Reith <ameretat.reith@gmail.com> wrote:
> Another use case would be circumventing some crazy state backed firewalls
> that drop or throttle -mostly UDP- connections having high bandwidths.  If
> peer is being used as gateway and nameserver resolver, it can be used to
> rotate server IPs too; yet another method to bypass kind of blockages.

That's another neat use case indeed. Baptiste's auto RTT-sensing idea
would automatically figure out which IPs the firewall has throttled.

(I suspect, however, that WireGuard isn't designed long term to deal
with state sponsored firewalls and such; it's fingerprintable, as
discussed earlier on the mailing list. Good approaches to building
"unblockable VPNs" probably include something like symmetric crypto
only, so that there's no protocol or handshake, with large random
nonces (XChaPoly), forming messages that are indistinguishable from
random, which are then massaged into resembling valid gzip'd data, and
then placed below a valid HTTP header on port 80... or something wild
like this.)
