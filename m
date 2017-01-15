Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6918ff97
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:56:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cab2f2a
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:56:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea75d35a
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:56:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f11d6bef
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 09:56:13 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id f9so28565428otd.1
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 02:06:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170109094706.GA1315@lud.polynome.dn42>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
 <20170109094706.GA1315@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Jan 2017 11:06:33 +0100
Message-ID: <CAHmME9rEwaPR5p8v5JpKAbZ_ihsKaXivn8cOJ0_iWPz5zNHUDA@mail.gmail.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

On Mon, Jan 9, 2017 at 10:47 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> This is not what I proposed.  Endpoints do not need to be ordered, and you

Sorry, I read too fast evidently. That's a nice suggestion, indeed, of
sending multiple handshakes and seeing which one arrives first. If the
same exact handshake packet is sent to multiple IP, only the first one
to arrive will actually be replied to, due to the anti-replay attack
prevention rejecting the ones that arrive later. This, then, makes
implementation quite simple. Wonderful. So then, as you wrote, the
symmetric session would use the IP from the handshake for the
duration.

I'm still struggling to come up with a satisfactory solution for how
to manage "learned" new IPs from the roaming, to prevent the list from
getting too large. Fixed size LRU cycling perhaps?
