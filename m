Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49ced5c8
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2016 16:57:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1df2f512
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2016 16:57:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abfb9f9b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2016 16:57:09 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id g23so158407299wme.1
 for <wireguard@lists.zx2c4.com>; Mon, 21 Nov 2016 09:00:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <f4136414.dNq.dMV.2g.oxNfmO@mailjet.com>
References: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
 <f4136414.dNq.dMV.2g.oxNfmO@mailjet.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 21 Nov 2016 18:00:34 +0100
Message-ID: <CAHmME9or-d8X5Nd-y+WTPxp6TuRWafOSZ97qu6FFFAQ2W5=zkA@mail.gmail.com>
To: Joakim Sindholt <opensource@zhasha.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] What is a good way to ingrate (as of now) wireguard
 into openrc in Gentoo?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 21, 2016 at 2:55 PM, Joakim Sindholt <opensource@zhasha.com> wrote:
> There are a couple of problems with this - the number I've experienced being
> that
> dhcpcd has no respect for network config it didn't create and so it will
> happily
> nuke the ip rules every time it renews the dhcp lease.

Add 'wg*' to denyinterfaces in dhcpcd.conf.
