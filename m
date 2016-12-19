Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 587887d5
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 12:25:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c689cdf
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 12:25:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7231e19a
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 12:25:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6c8e2477
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 12:25:37 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b126so143362788oia.2
 for <wireguard@lists.zx2c4.com>; Mon, 19 Dec 2016 04:32:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Dec 2016 13:32:31 +0100
Message-ID: <CAHmME9rqtmYntL046vCOTVHwcdk2ThTwqMFqFj4kBKtKxixo4A@mail.gmail.com>
Subject: Re: openwrt route_allowed_ips is inprecise
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
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

On Mon, Dec 19, 2016 at 9:00 AM, J=C3=B6rg Thalheim <joerg@higgsboson.tk> w=
rote:
> Should no the output first sorted from the shortest subnet prefix to the =
longest?

No; that doesn't matter.

> What do you mean be precise? Is there a bug in the other logic apart from
> probably unnecessary routes?

Performance will suffer unnecessarily.
