Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96905665
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 04:26:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 211b4e14
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 04:26:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6f1752a
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 04:26:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4642f4d2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 04:26:12 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id y198so167067456oia.1
 for <wireguard@lists.zx2c4.com>; Mon, 19 Dec 2016 20:33:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
 <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 05:33:11 +0100
Message-ID: <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
Subject: Re: openwrt route_allowed_ips is inprecise
To: Dan Luedtke <mail@danrl.com>
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

On Tue, Dec 20, 2016 at 4:38 AM, Dan Luedtke <mail@danrl.com> wrote:
> No objection but a remark: It is now even more complex and I think shell script is not the right solution.

This is *not* a complex algorithm and can be implemented correctly in
shell. It's on my list for tomorrow to actually clean that up.

> This is pretty straightforward with netlink

No, it's much less straight-forward with raw netlink. Raw netlink
involves hundreds of lines of code to do anything at all. A real mess.
Fortunately there are wrapper libraries you can use from various
languages to make it easier.

> Regarding LEDE, netifd should track the routes being added and the extra routes do not really do harm.

Alright then...

Speaking of netifd, did you ever fix that netifd issue with the IP dependency?
