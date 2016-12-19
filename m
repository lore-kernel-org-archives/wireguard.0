Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e510dd2
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:14:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec08e427
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:14:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a49db92
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:14:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7014a57f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 13:14:05 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id b126so144538733oia.2
 for <wireguard@lists.zx2c4.com>; Mon, 19 Dec 2016 05:21:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161219131953.GB12378@tuxmachine.polynome.dn42>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
 <CAHmME9rqtmYntL046vCOTVHwcdk2ThTwqMFqFj4kBKtKxixo4A@mail.gmail.com>
 <20161219130602.GA12378@tuxmachine.polynome.dn42>
 <CAHmME9qEg6iBwWpwgT_oPPGymfccuOdAyHv1e4+n5c-O8n9=4g@mail.gmail.com>
 <20161219131953.GB12378@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Dec 2016 14:21:00 +0100
Message-ID: <CAHmME9ra07hNWJ6iigH3ZtT0oX2h9C+J2DVtvTOnEqFdTT-HWw@mail.gmail.com>
Subject: Re: openwrt route_allowed_ips is inprecise
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

On Mon, Dec 19, 2016 at 2:19 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> spending the time to test and
> maintain this.

Can't argue with that, I guess.
