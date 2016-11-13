Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f331ac3
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 20:17:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84c372a6
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 20:17:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1c11009
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 20:17:20 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b14so45252112lfg.2
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 12:19:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <405b2e79-854d-4c30-07b0-bd524137d2f6@cumulusnetworks.com>
References: <CAHmME9qYYU-p5BhR0ReNSB+__wysuDK+eEk1SisCoyf4=2woxg@mail.gmail.com>
 <20161113132347.17907-1-Jason@zx2c4.com>
 <405b2e79-854d-4c30-07b0-bd524137d2f6@cumulusnetworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 13 Nov 2016 21:19:47 +0100
Message-ID: <CAHmME9rV_Qqj_QNKOARav6vOyyF-__E07saChPYo9MF6wED83A@mail.gmail.com>
To: David Ahern <dsa@cumulusnetworks.com>
Content-Type: text/plain; charset=UTF-8
Cc: Netdev <netdev@vger.kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
Subject: Re: [WireGuard] [PATCH] ip6_output: ensure flow saddr actually
	belongs to device
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi David,

On Sun, Nov 13, 2016 at 5:30 PM, David Ahern <dsa@cumulusnetworks.com> wrote:
> You can't require the address to be on the dst device. e.g., it can be an address from the loopback/vrf device.
>
> This block needs to be done at function entry, and pass dev as NULL to mean is the address assigned to any interface. That gets you the equivalency of the IPv4 check.

I gave v2 my best shot. Hopefully it's adequate, but I have a feeling
it might be best for you to just code up what you have in mind.

Regards,
Jason
